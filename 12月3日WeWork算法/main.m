//
//  main.m
//  12月3日WeWork算法
//
//  Created by TYOU on 2021/12/3.
//  Copyright © 2021 TYOU. All rights reserved.
// 任意算法对数组排序，再对数组中的元素做去重

#import <Foundation/Foundation.h>
int contain(int R[], int k, int n){
    for (int i=0; i<n; i++) {
        if (k==R[i]) {
            return 1;
        }
    }
    return 0;
}

void bubbleSort(int R[], int n) {
    int i,j;
    int temp;
    for (i=0; i<n; i++) {
        for (j=n-1; j>i; j--) {
            if (R[j-1]>R[j]) {
                temp = R[j];
                R[j] = R[j-1];
                R[j-1] = temp;
            }
        }
    }
    for (int i=0; i<n; i++) {
        printf("%d ",R[i]);
    }
    printf("\n");
    int S[100]={0};//初始化必须要明确定义数组数量，否则数组中会出现随机值
    int count=0;
    for (i=0; i<n; i++) {
        temp = R[i];
        if (0 == contain(S,temp,count)) {
            S[count]= temp;
            count++;
        }
    }
    for (int i=0; i<count; i++) {
        printf("%d ",S[i]);
    }
}

int main(int argc, const char * argv[]) {
    int R[] = {1,4,2,5,6,8,4,4};
    bubbleSort(R,sizeof(R)/sizeof(int));
    printf("\n");
    return 0;
}
