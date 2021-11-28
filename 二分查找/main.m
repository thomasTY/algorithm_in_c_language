//
//  main.m
//  二分查找
//
//  Created by chentianyou on 2021/11/28.
//  Copyright © 2021 TYOU. All rights reserved.
//

#import <Foundation/Foundation.h>

int binSearch(int R[], int, int k) {
    int low=0, high=n-1, mid;
    while (low<=high) {
        mid = (low+high)/2;
        if (R[mid] == k) {
            return mid;
        }
        if (R[mid]>k) {
            high = mid-1;
        } else {
            low = mid+1;
        }
    }
    return -1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
