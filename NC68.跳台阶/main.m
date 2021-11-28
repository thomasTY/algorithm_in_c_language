//
//  main.m
//  跳台阶
//
//  Created by TYOU on 2021/11/28.
//  Copyright © 2021 TYOU. All rights reserved.
// 一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个 n 级的台阶总共有多少种跳法（先后次序不同算不同的结果）。
// 对于第n个台阶，要么从第n-1个台阶一步跨过来，要么从第n-2个台阶一步跨过来（从第n-2个台阶先走一个台阶再走一个台阶的情况，包含在了从第n-1个台阶走一个台阶的情况中了）。所以说有f(n)=f(n-1)+f(n-2)，边界值为f(1)=1，f(2)=2。此时，跳台阶问题可以完全转化为斐波那契数列


#import <Foundation/Foundation.h>
// 递归 时间复杂度：O(2^N)。 空间复杂度：递归栈的空间。
int jumpFloor(int number ) {
    if(number==1) return number;
    if(number==0) return number;
    if(number==2) return number;
    return jumpFloor(number-1)+jumpFloor(number-2);
}
// 非递归 时间复杂度：O(N)。 空间复杂度：O(1)。
int jumpFloor1(int number) {
    int f1,f2,f3,i;
    f1=f2=1;
    if(number==1) return number;
    if(number==0) return number;
    for(i=2;i<=number;i++) {
        f3=f1+f2;
        f1=f2;
        f2=f3;
    }
    return f3;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
