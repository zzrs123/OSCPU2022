# 计算机系统7-> 计组与体系结构4 | MIPS指令集（下） | 从高级程序到MIPS汇编

承接系列上篇[计算机系统6-> 计组与体系结构3 | MIPS指令集（中）| MIPS汇编指令与机器表示](https://www.cnblogs.com/Roboduster/p/16158413.html)对于MIPS指令集本身的介绍，这一篇来说一说高级程序语言如何翻译为MIPS汇编指令，从此也可以简单看出指令集如何影响高级程序的性能。我在去年也总结过这个过程，当时写得太简略，[计算机系统->Hello World的一生 | 程序如何运行)](https://www.cnblogs.com/Roboduster/p/15612880.html)。

1. Computer Organization and Design the 5th Edition，即计算机组成与设计硬件软件接口第五版
2. 课件，由于是英文且只是老师的思路，所以是辅助参考
3. 《计算机组成原理》谭志虎，HUST（此书强推）
4. 《计算机组成原理》MOOC HUST

> 这部分要快点整理了，老师已经讲到流水线了。
>
> 不过这一篇汇编的介绍，我感觉很难和前两篇剥离来说，但我还是感觉这种**分层**对于整体的理解来说很有帮助。这一篇结构上怎么来设计，我打算从**C语言的各种简单语法**来说汇编的对应翻译，在这个过程中整合复习前两篇的内容。顺带提一提**Java的汇编**。
>
> 其实这部分已经不算计组了，实际上汇编本身也不是计组的重点（可能在微机与接口这门课中是一个重点）。重点是从下面的汇编表达中感受我们的上层想法（即高级语言）是如何被计算机执行的（即指令）。
>
> 下一篇会整体介绍几个完整C语言的汇编写法。

## 00  回顾编译过程

我觉得有必要回忆一下，从高级语言到机器指令都经过了哪些具体的步骤。

![image-20220422145450902](C:\Users\shandaiwang\AppData\Roaming\Typora\typora-user-images\image-20220422145450902.png)

可见，具体步骤主要是高级语言程序（如C语言），**预处理**得到.i文件，**编译**得到.s文件（汇编语言），经过**汇编**得到.o目标文件（机器语言），再经过**链接**得到.exe可执行文件（机器语言）。

这里我们主要探讨的是，对于一个C语言语句，它的汇编层面的指令格式是什么样子的，以及这些汇编指令的逻辑是如何组织的。至于C这样的高级语言是如何变成汇编的，这在后续编译器中会进行了解和学习。现在我们只需理解汇编程序的组织逻辑。

下面的汇编是基于这个在线模拟器：[MIPS汇编模拟器](https://godbolt.org/) 中的gcc5.4 -O模式得出。

## 01  汇编开始

### 01-1  MIPS汇编初识

在上一部分描述每个MIPS指令的汇编表示的时候，我已经提到了一些汇编部分的内容，比如`addi $t0,$t0,10`表示将寄存器t0中的数据拿出来加10再放回去。基于这些初始的理解，我们就可以用汇编指令的组合来表示一些C语言（高级语言程序）的一些语句。

如：C语言中一个简单的分支语句：

```C
if(i==j){
    f=g+h;
}
else{
    f=g-h;
}
```

如果用MIPS汇编指令来描述，我们上一次也学习了分支跳转指令，我们假设i放在$s3中，j放在$s4中，f放在$s0中，g放在$s1中，h放在$s2中，则可以设想有：

```assembly
# if语句 Else是不相等时跳转去的标签
bne $s3,$s4,Else 
# 相等时执行的语句
add $s0,$s1,$s2
# 跳转到退出
j Exit
# 不相等时执行的语句
Else：sub $s0,$s1,$s2
#退出
Exit:
```

可以看到，程序的基本架构就是上一篇文章中提到的汇编指令的组合。不过多了一些指令之间的跳转关系：如j指令和标签Exit、Else，来完成程序之间的一些跳转工作。

> **关于标签：**在转成汇编的过程中，编译器经常创建一些编程语言中没有的分支和标签，这也是汇编语言的麻烦之处，而使用高级程序语言不需要添加这些标签，编程速度比较快。
>
> **标签本身是内存地址的符号名称，用于描述跳转的目标地点。**

我们已经大致了解了一个C语言程序是如何变成MIPS汇编的，但实际上**MIPS仿真器**生成的**不完全**是上面的样子，比如上面的例子中就有一个挺严重的问题：我们提前假设了存放数据的寄存器，才有了这些语句，但是把数据放进这些对应的寄存器，本身也应该是计算机该做的工作。我的意思就是说，还需要取出数据的指令。

此外，还需要注意些什么呢，我们先来看看MIPS汇编格式：

### 01-2  [MIPS汇编格式](https://www.bilibili.com/read/cv5720036/)

在开始MIPS汇编翻译之前，可以先了解一下MIPS汇编程序的框架格式，来更好地理解汇编逻辑。MIPS程序大致的一个结构图如下：

![img](https://i0.hdslb.com/bfs/article/d20576e4618b76a402a1c278fed99a3e127caa13.png@840w_594h_progressive.webp)


说明以下几点：

1. 预编译数据的定义方式为：

    ```assembly
    name:  <类型名>  <参数>
    ```
    
    下面给出几个预编译数据的数据类型的说明：
    ![img](https://i0.hdslb.com/bfs/article/abf6c8d868805d50f857793042413e746793ee89.png@942w_519h_progressive.webp)
    
    

2. 标签可以跟指令写在一行，也可以把指令另起一行。另起一行的话这样看起来更清楚。

3. 程序的**入口**可以是`main`标签，也可以是第一行，这取决于编译器的设定。

4. 程序**退出**于下列语句：

    ```assembly
    li $v0, 10           #把10传递给$v0，代表 无返回值 退出
    syscall
    ```
    
    或者：
    
    ```assembly
    li $v0, 17           #把17传递给$v0，代表返回 $a0 退出
    syscall
    ```
    
    如果没有上述语句，程序执行到末尾自然结束。
    
5. 总结

    我们可以用一个模板来概括一个汇编程序应当有哪些部分：

    ```assembly
    
    .data
    	# .data 包含程序所有的数据部分，就像c语言中的 变量、
    	
    	myMessage:	.asciiz "Hello World \n"
    	# 这是一个消息/数据，需要将消息/数据 放入 随机存储寄存器 中，.asciiz是这个消息的数据类型，我们必须要告诉机器 消息的数据类型。
    
    .text
    	# .text是具体的指令内容
    	li $v0, 4
        # li是连接加载指令，将立即数 4 放入 $v0 寄存器中。
    	la $a0, myMessage
    	syscall
    ```

### 01-3  一个简单程序

上面说的可能还是不很清楚，我们拿下面的简单程序来举个例子。C语言程序为：

```C
#include<stdio.h>
int main(){
    printf("Hello World");
    return 0;
}
```

其汇编形式为：

```assembly
$LC0:
        .ascii  "Hello World\000"
main:
        addiu   $sp,$sp,-32
        sw      $31,28($sp)
        lui     $4,%hi($LC0)
        addiu   $4,$4,%lo($LC0)
        jal     printf
        nop

        move    $2,$0
        lw      $31,28($sp)
        nop
        j       $31
        addiu   $sp,$sp,32
```

接下来我们来解释一下这段汇编语言

> 如果对于上面的寄存器感到陌生，可以折返回上一篇的**操作数部分**进行温习。

```assembly
$LC0:
main:
# 是标签，
```

标签(Label)是内存中地址的符号名称。在MIPS程序集中，标签是符号名（遵循与C符号名相同的约定），后面跟冒号(colon)。

## 01  头文件和宏定义



## 02  变量 / 结构体



## 03  输入输出

### 00-1  C语言例程

```C
int a;

int b;

int c = a+b;
```



```assembly
_GLOBAL__sub_I_a:
        lw      $2,%gp_rel(a)($28)
        lw      $3,%gp_rel(b)($28)
        addu    $2,$2,$3
        jr      $31
        sw      $2,%gp_rel(c)($28)

c:
b:
a:
```



C语言：

```C
#include<stdio.h>
int main(){
    int a;
    scanf("%d",&a);
    printf("Hello World");
    return 0;
}
```



```assembly
$LC0:
        .ascii  "%d\000"
$LC1:
        .ascii  "Hello World\000"
main:
        addiu   $sp,$sp,-40
        sw      $31,36($sp)
        addiu   $5,$sp,24
        lui     $4,%hi($LC0)
        addiu   $4,$4,%lo($LC0)
        jal     scanf
        nop

        lui     $4,%hi($LC1)
        addiu   $4,$4,%lo($LC1)
        jal     printf
        nop

        move    $2,$0
        lw      $31,36($sp)
        nop
        j       $31
        addiu   $sp,$sp,40
```



### 00-2  MIPS汇编

### 00-3  对应讲解

## 04  运算表达式

### 03-1  算术运算

### 03-2  逻辑运算

## 05  循环



## 06  分支与跳转



## 07  函数调用与递归



## 08  数组和指针





## 09  文件操作



## 0X  有关汇编 / CPU的学习资源

1. https://godbolt.org/

   在线编译器，输入C就可以产生对应的反汇编代码，支持MIPS、x86等ISA。推荐将自己编写的一些代码片段放进去查看反汇编的MIPS。

2. https://courses.missouristate.edu/KenVollmar/MARS/

   经典的MIPS汇编器和仿真器。建议使用此工具练习编写汇编代码。

3. https://www.onlinegdb.com/

   在线GDB网站，输入C代码就可以进行在线GDB调试。

4. https://www.runoob.com/cprogramming/c-examples.html

   大量C代码实例。

5. https://onlinedisassembler.com/

   在线反汇编，输入机器指令可以得到反汇编代码，支持x86、MIPS等ISA。

6. https://visualmips.github.io/

   MIPS汇编器和仿真器，可以直接输入汇编代码并进行仿真，类似一个在线的MARS软件。也提供了桌面版。

7. https://hdlbits.01xz.net/wiki/Main_Page

   在线练习Verilog的网站

8. https://cpulator.01xz.net/

   CPU在线仿真器，支持MIPS、ARM等多种ISA

9. https://www.bilibili.com/video/BV19J411y7pA?p=2&spm_id_from=pageDriver

   B站MIPS汇编语言的视频。

10. https://gaozhiyuan.net/page/3?s=MIPS%E6%B1%87%E7%BC%96

    大佬的博客，整理了很多MIPS汇编的笔记。

## 0T  简单回顾 | Review

##   

