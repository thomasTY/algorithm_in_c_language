//
//  main.m
//  快速排序
//
//  Created by TYOU on 2021/11/20.
//

#import <Foundation/Foundation.h>

void quickSort(int R[], int s, int t) {
    if (s >= t) {
        return;
    }
    int i = s, j = t, temp;
    int middle = R[(s+t)/2];
    while(i != j) {
        while (i<j && R[i]<middle){
            i++;
        }
        while (j>i && R[j]>middle){
            j--;
        }
        if (j>i) {
            temp = R[i];
            R[i] = R[j];
            R[j] = temp;
        }
    }
    quickSort(R, s, i-1);
    quickSort(R, j+1, t);
}

int main(int argc, const char * argv[]) {
    int cout =6;
    int R[] = {1, 5, 10, 3, 0, 2};
    quickSort(R, 0, 5);
    for (int i=0; i<cout; i++) {
        printf("%d ",R[i]);
    }
    return 0;
}

