//
//  main.m
//  二叉树遍历
//
//  Created by TYOU on 2021/11/20.
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

int maxSize = 1000;
// 先序遍历-非递归
void preOrder1(BTNode * node) {
    if (node == NULL) {
        return;
    }
    BTNode * stack[maxSize], *p;
    int top = 0;
    stack[top] = node;
    while (top>-1) {
        p = stack[top];
        top--;
        printf("%d ",p->data);
        if(p->rchild != NULL) {
            top++;
            stack[top] = p->rchild;
        }
        if (p->lchild != NULL) {
            top++;
            stack[top] = p->lchild;
        }
    }
}
// 中序遍历-非递归
void inOrder1(BTNode * node) {
    if (node == NULL) {
        return;
    }
    BTNode * stack[maxSize];
    BTNode * p = node;
    int top = -1;
    while (top>-1 || p != NULL) {
        while (p != NULL) {
            top++;
            stack[top] = p;
            p = p->lchild;
        }
        if (top>-1) { // 执行到此处，栈顶元素没有左孩子或左子树的节点均已访问过
            p = stack[top];
            top--;
            printf("%d ",p->data);
            p = p->rchild;
        }
    }
}

// 后序遍历-非递归
void postOrder1(BTNode * node) {
    if (node == NULL) {
        return;
    }
    BTNode * stack[maxSize], * p;
    int flag, top = -1;
    do {
        while (node != NULL) {
            top++;
            stack[top] = node;
            node = node->lchild;
        }
        // 执行到此处，栈顶元素没有左孩子或左子树的节点均已访问过
        p = NULL;
        flag = 1;
        while (top != -1 && flag) {
            node = stack[top];
            if (node->rchild == p) {
                top--;
                printf("%d ",node->data);
                p = node;
            } else {
                node = node->rchild;
                flag = 0;
            }
        }
    } while (top != -1);
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
    preOrder1(&node1);
    printf("\n");
    printf("中序遍历:\n");
    inOrder(&node1);
    printf("\n");
    inOrder1(&node1);
    printf("\n");
    printf("后序遍历:\n");
    postOrder(&node1);
    printf("\n");
    postOrder1(&node1);
    printf("\n");
    return 0;
}


