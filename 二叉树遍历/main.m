//
//  main.m
//  二叉树遍历
//
//  Created by chentianyou on 2021/11/20.
//

#import <Foundation/Foundation.h>
typedef struct node {
    int data;
    struct node * lchild;
    struct node * rchild;
} BTNode;

// 先序遍历
void preOrder(BTNode * b) {
    if (b==NULL) {
        return;
    }
    printf("%d ",b->data);
    preOrder(b->lchild);
    preOrder(b->rchild);
}
// 中序遍历
void inOrder(BTNode * b) {
    if (b == NULL) {
        return;
    }
    inOrder(b->lchild);
    printf("%d ", b->data);
    inOrder(b->rchild);
}
// 后续遍历
void postOrder(BTNode * b) {
    if (b == NULL) {
        return;
    }
    postOrder(b->lchild);
    postOrder(b->rchild);
    printf("%d ", b->data);
}

int main(int argc, const char * argv[]) {
    BTNode node1 = {1, NULL, NULL};
    BTNode node2 = {2, NULL, NULL};
    BTNode node3 = {3, NULL, NULL};
    BTNode node4 = {4, NULL, NULL};
    BTNode node5 = {5, NULL, NULL};
    BTNode node6 = {6, NULL, NULL};
    BTNode node7 = {7, NULL, NULL};
    BTNode node8 = {8, NULL, NULL};
    BTNode node9 = {9, NULL, NULL};
    BTNode node10 = {10, NULL, NULL};
    BTNode node11 = {11, NULL, NULL};
    node1.lchild = &node2;
    node1.rchild = &node3;
    node2.lchild = &node4;
    node2.rchild = &node5;
    node3.lchild = &node6;
    node3.rchild = &node7;
    node4.lchild = &node8;
    node4.rchild = &node9;
    node5.lchild = &node10;
    node5.rchild = &node11;
    printf("先序遍历:\n");
    preOrder(&node1);
    printf("\n");
    printf("中序遍历:\n");
    inOrder(&node1);
    printf("\n");
    printf("后序遍历:\n");
    postOrder(&node1);
    printf("\n");
    return 0;
}

