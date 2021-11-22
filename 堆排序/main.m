//
//  main.m
//  堆排序
//
//  Created by chentianyou on 2021/11/19.
//

#include <stdio.h>

// 建堆(下标从0算起)
void sift(int R[], int low, int high) {
    int p = low, c = 2*p+1;
    int temp = R[p];
    while (c < high) {
        if (c+1 < high && R[c] < R[c+1]) {
            c++;
        }
        if (temp < R[c]) {
            R[p] = R[c];
            p = c;
            c = 2*p+1;
        } else {
            break;
        }
    }
    R[p] = temp;
}

// 堆排序(下标从0算起)
void heapSort(int R[], int n) {
    int i, temp;
    for (i = (n-1)/2; i >= 0; i--) {
        sift(R, i, n);
    }
    for (i = n-1; i >= 1; i--) {
        temp = R[0];
        R[0] = R[i];
        R[i] = temp;
        sift(R, 0, i);
    }
}

// 建堆(下标从1算起)
void sift1(int R[], int low, int high) {
    int i = low, j = 2*i;
    int temp = R[i];
    while (j <= high) {
        if (j < high && R[j] < R[j+1]) {
            j++;
        }
        if (temp < R[j]) {
            R[i] = R[j];
            i = j;
            j = 2*i;
        } else {
            break;
        }
    }
    R[i] = temp;
}
// 排序(下标从1算起)
void heapSort1(int R[], int n) {
    int i, temp;
    for (i = n/2; i >= 1; i--) {
        sift(R, i, n);
    }
    for (i = n; i >= 2; i--) {
        temp = R[1];
        R[1] = R[i];
        R[i] = temp;
        sift(R, 1, i-1);
    }
}


int main(int argc, const char * argv[]) {
    int cout =6;
    int R[] = {1,4,1,7,1,7};
    heapSort(R,cout);
    for (int i=0; i<cout; i++) {
        printf("%d ",R[i]);
    }
    return 0;
}


