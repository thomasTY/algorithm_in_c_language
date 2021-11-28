//
//  main.m
//  NC7.买卖股票的最好时机(一)
//
//  Created by TYOU on 2021/11/28.
//  Copyright © 2021 TYOU. All rights reserved.
//描述：假设你有一个数组，其中第 i个元素是股票在第 i天的价格。
// 你有一次买入和卖出的机会。（只有买入了股票以后才能卖出）。请你设计一个算法来计算可以获得的最大收益。

#import <Foundation/Foundation.h>

// 解法一：通读题目，思路很简单，可以直接采用暴力法解决问题，其余的方法就是在此基础上进行问题的优化。首先我们用变量i表示买入股票的时间，用变量j表示卖出股票的时间，所以prices[j] - prices[i]表示的就是股票的收益，通过不断循环找出其中的最大值即可。时间复杂度为O(N^2)
int maxProfit(vector<int>& prices) {
    int max = 0;//设置最大值变量
    int i,j;
    for(i = 0;i<prices.size();i++){//两层嵌套循环
        for(j = i+1;j<prices.size();j++){
            if(prices[j] - prices[i] > max){
                max = prices[j] - prices[i];//通过循环判断最大值的结果
            }
        }
    }
    return max;//返回最大值
}

// 解法二：上述暴力法中采用了两次遍历循环，会导致程序开销大，也可以采用一次比遍历循环，首先定义一个关于利润的容器profits，遍历整个数组，将利润存放在容器当中，逐个循环利润值，通过逐个判断利润值的大小，最终输出所谓的最大利润值
// 输入：[1,4,2]，首先计算利润值分别为[3,-2]，随后将进行利润值的判断，如果大于0，则进行累加，否则，将进行重新计数，加个if语句用于具体最大值判断。
// 时间复杂度O(N)的计算分为两个部分，首先在预处理阶段耗时O(N)，计算最大利润时采用了一次遍历，循环体内部指令开销为O(1)，所以总体算法时间为O(N)。空间复杂度也为O(N)。
int maxProfit1(vector<int>& prices) {
    vector<int> profits;
    for(int i = 1; i < prices.size();++i){
        profits.push_back(prices[i] - prices[i-1]);//将差值存在容器中
    }
    int maxx = -1;//设置最大值
    int sum = -1;
    for(int i = 0;i < profits.size();++i){//将利润值进行循环判断
        if(sum > 0)
            sum += profits[i];
        else
            sum = profits[i];
        if(sum > maxx)
            maxx = sum;
    }
    return max(0,maxx);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
