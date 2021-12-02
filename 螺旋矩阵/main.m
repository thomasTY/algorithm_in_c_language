//
//  main.m
//  螺旋矩阵
//
//  Created by chentianyou on 2021/12/2.
//  Copyright © 2021 TYOU. All rights reserved.
/*
 螺旋矩阵：输入一个n*n的矩阵
  [1, 2 ,3 ,4 ]
  [5, 6 ,7 ,8 ]
  [9, 10,11,12]
  [13,14,15,16]
 输入这样的结果：1 2 3 4 8 12 16 15 14 13 9 5 6 7 11 10
 */

#import <Foundation/Foundation.h>

void luoxuanMatrix(int R[4][4], int n) {
    int x, y, k;
    for (k=0; k<=n/2; k++) {
        for (x=k; x<n-k; x++) {//左到右
            printf("%d ",R[k][x]);
        }
        for (y=k+1; y<n-k-1; y++) {//上到下
            printf("%d ",R[y][n-k-1]);
        }
        for (x=n-k-1; x>k; x--) {//右到左
            printf("%d ",R[n-k-1][x]);
        }
        for (y=n-k-1; y>k; y--) {//下到上
            printf("%d ",R[y][k]);
        }
    }
}

int main(int argc, const char * argv[]) {
    int R[4][4] = {{1,2,3,4},{5,6,7,8},{9,10,11,12},{13,14,15,16}};
    luoxuanMatrix(R, 4);
    return 0;
}
