//
//  main.m
//  逆序对
//
//  Created by TYOU on 2021/11/28.
//  Copyright © 2021 TYOU. All rights reserved.
// 对于一个包含N个非负整数的数组A[1..n]，如果有i < j，且A[ i ]>A[ j ]，则称(A[ i] ,A[ j] )为数组A中的一个逆序对。
// 例如，数组（3，1，4，5，2）的逆序对有(3,1),(3,2),(4,2),(5,2)，共4个。

#import <Foundation/Foundation.h>

//方法一：最原始的方法，利用两重循环进行枚举。该算法的时间复杂度为O(n^2)。
int count_inversion(int a[], int n) {
    int count = 0;
    for(int i=0; i <n-1; ++i) {
        for(int j=i+1; j<n; ++j) {
            if(a[i] > a[j]){
                count += 1;
            }
        }
    }
    return count;
}


// 方法二：利用归并排序的思想求解逆序对的个数，这是解决该问题的一种较为高效的算法。该算法的时间复杂度为O(nlogn)。
// [l, r)
void merge_inversion(vector<int> &nums, int  l, int r, int &cnt) {
    cout << l << " - " << r << endl;
    // 只有一个元素直接返回
    if(r - l <= 1 ) return;
 
    // 分治
    int m = l + (r - l) / 2;
    merge_inversion(nums, l, m, cnt);
    merge_inversion(nums, m, r, cnt);
 
    // 归并, 按照从大到小的顺序。
    int i = l;
    int j = m;
    vector<int> temp;
    for(int k = l; k < r; ++k) {
        if(i < m && j < r)
            if(nums[i] > nums[j]) {
                 cnt += (r - j);
                 temp.push_back(nums[i++]);
            } else temp.push_back(nums[j++]);
        else {
            if(i < m) temp.push_back(nums[i++]);
            else if(j < r) temp.push_back(nums[j++]);
        }
    }
    for(int k = l; k < r; ++k)
        nums[k] = temp[k - l];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
