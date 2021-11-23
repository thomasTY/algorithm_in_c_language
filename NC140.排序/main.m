//
//  main.m
//  NC140.排序
//
//  Created by chentianyou on 2021/11/22.
// 给定一个长度为 n 的数组，请你编写一个函数，返回该数组排序后的结果。
// 数据范围：0≤n≤10000000，数组中每个元素都满足0≤val≤10000000000
// 要求：空间复杂度O(n)，时间复杂度O(nlogn)

#import <Foundation/Foundation.h>

void quickSort(int R[], int s, int t) {
    if (s>=t) {
        return;
    }
    int i = s, j = t, temp;
    int middle = R[(s+t)/2];
    while (i!=j){
        while (i<j && R[i]<middle){
            i++
        }
        while (j>i && R[j]>middle){
            j--;
        }
        if (j>i) {
            temp = R[j];
            R[j] = R[i];
            R[i] = temp;
        }
    }
    quickSort(R, s, i-1);
    quickSort(R, j+1, t);
}

int main(int argc, const char * argv[]) {
    //这里用桶序法不行，因为要的内存太多了，
    //冒泡法也不行，要的时间太多了
    //所以用了这个常用的快速排序法
//    quickSort();
    return 0;
}
