//
//  main.m
//  反转链表
//
//  Created by TYOU on 2021/11/20.
// NC78.反转链表

#import <Foundation/Foundation.h>

typedef struct node {
    int data;
    struct node * next;
} LinkNode;

// 反转单链表
LinkNode * ReverseList(LinkNode * node) {
    if(node == NULL || node->next == NULL) {
        return NULL;
    }
    LinkNode * p = NULL; // 新链表
    LinkNode * temp = NULL;
    while(node != NULL) {
        temp = node->next;
        node->next = p;
        p = node;
        node = temp;
    }
    return p;
}

int main(int argc, const char * argv[]) {
    LinkNode node1 = {1, NULL};
    LinkNode node2 = {2, NULL};
    LinkNode node3 = {3, NULL};
    LinkNode node4 = {4, NULL};
    node1.next = &node2;
    node2.next = &node3;
    node3.next = &node4;
    LinkNode * node = &node1;
    while (node != NULL) {
        printf("%d",node->data);
        node = node->next;
    }
    node = ReverseList(&node1);
    printf("\n");
    while (node != NULL) {
        printf("%d",node->data);
        node = node->next;
    }
    printf("\n");
    return 0;
}
