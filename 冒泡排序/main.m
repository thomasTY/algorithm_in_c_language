//
//  main.m
//  冒泡排序
//
//  Created by TYOU on 2021/11/20.
//

#import <Foundation/Foundation.h>

void BubbleSort (int R[], int n) {
    int i, j, exchange;
    int temp;
    for (i=0; i<n-1; i++) {
        exchange = 0;
        for (j=n-1; j>i; j--) {
            if (R[j]<R[j-1]) {
                temp = R[j];
                R[j] = R[j-1];
                R[j-1] = temp;
                exchange = 1;
            }
        }
        if (exchange == 0) {
            return;
        }
    }
}



int main(int argc, const char * argv[]) {
    int cout =6;
    int R[] = {1, 5, 10, 3, 0, 2};
    BubbleSort(R, cout);
    for (int i=0; i<cout; i++) {
        printf("%d ",R[i]);
    }
    return 0;
}

void exhcange(int i, int j) {
    i = i + j;
    j = i - j;
    i = i - j;
    
    i = i ^ j;
    j = i ^ j;
    i = i ^ j;
}

