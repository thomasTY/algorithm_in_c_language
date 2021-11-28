//
//  main.m
//  链表合并
//
//  Created by chentianyou on 2021/11/28.
//  Copyright © 2021 TYOU. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef struct Node{
    int data;
    struct Node *next;
}Node,*LinkList;

void MergeList_L(LinkList La, LinkList Lb, LinkList Lc){
    //已知La、Lb的元素按值非递减排列
    //归并La、Lb得到单链表Lc,Lc的元素也是按值非递减排列的
    LinkList pa,pb,pc;
    pa = La->next;
    pb = Lb->next;
    Lc = pc = La;//用La的头结点作为Lc的头结点
    while(pa && pb){
        if(pa->data<=pb->data){
            pc->next = pa;
            pc = pa;
            pa = pa->next;
        }
        else{
            pc->next = pb;
            pc = pb;
            pb = pb->next;
        }
    }
    pc->next = pa?pa:pb;//插入剩余段
    free(Lb);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
