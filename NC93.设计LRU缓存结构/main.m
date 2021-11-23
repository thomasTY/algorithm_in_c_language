//
//  main.m
//  NC93.设计LRU缓存结构
//
//  Created by chentianyou on 2021/11/23.
// 不要用哈希表之类的奇技淫巧，只有这样才能清晰明了地体现出LRU的语义！

#import <Foundation/Foundation.h>
struct node { // 缓存数据的结构体
    int key;
    int val;
    struct node *prev;
    struct node *next;
};
 
struct lru { // 整个缓存的结构体
    int size; // 缓存大小k
    int count; // 缓存中有效数据计数
    struct node *head; // 缓存的头结点，需要被分配空间，但不保存key-value
    struct node *tail; // 缓存的尾结点，需要被分配空间，但不保存key-value
};
 
struct lru db; // LRU缓存实例化

// 在使用缓存之前需要调用一下，参数k为缓存大小
void init(int k) {
    db.size = k;  // 初始化缓存大小
    db.count = 0; // 清空缓存有效数据计数
    db.head = (struct node *)malloc(sizeof(struct node)); // 创建缓存数据头结点
    db.tail = (struct node *)malloc(sizeof(struct node)); // 创建缓存数据尾结点
    // 缓存数据头尾结点连接起来，便于后续操作
    db.head->next = db.tail;
    db.tail->prev = db.head;
    db.head->prev = NULL;
    db.tail->next = NULL;
    
}

// 删除缓存中最后一个有效数据，只有在缓存满后才会删除，所以不用考虑缓存为空的情况
void deleteTail(void) {
    struct node *last_node = db.tail->prev; // 尾结点的前一个就是最后一个有效数据，这就是设置尾结点的方便之处
 
    db.tail->prev->prev->next = db.tail;
    db.tail->prev = db.tail->prev->prev;
    db.count--; // 删除后需要将有效数据的计数器减一
 
    free(last_node); // 释放被删除的缓存结点的内存空间，否则会导致内存泄漏
}

//节点插入到头部
void insertToHead(struct node *node) {
    if (db.count == db.size) { // 缓存如果是满的，需要删除最后一个有效数据结点，也就是把最“陈旧”的数据挤出去
        deleteTail();
    }
 
    node->prev = db.head;
    node->next = db.head->next;
    db.head->next->prev = node;
    db.head->next = node;
    db.count++; // 插入数据后，要维护数据计数器
}

//节点移到头部
void moveToHead(struct node *node){
    // 链表的基础操作
    node->prev->next = node->next;
    node->next->prev = node->prev;
 
    node->prev = db.head;
    node->next = db.head->next;
    db.head->next->prev = node;
    db.head->next = node;
}

// 根据key查找对应的节点指针
struct node * getNode(int key) {
    // 从头到尾遍历整个缓存链表。
    struct node *ptr = db.head->next;
 
    while (ptr != db.tail) {
        if (ptr->key == key) {
            moveToHead(ptr); // 只要访问到了有效数据，就要将该数据的节点拿到缓存的最前端
            return ptr;
        }
        ptr = ptr->next;
    }
 
    return NULL;
}

// 根据key查找对应的value
int getValue(int key) {
    struct node *ptr = getNode(key); // 具体查找工作由上面辅助函数getNode()来做
 
    if (ptr == NULL) {
        return -1;
    } else {
        return ptr->val;
    }
}

// 将数据插入到缓存中
void setValue(int key, int val) {
    struct node *ptr = getNode(key); // 先查找缓存中是否已经存在要插入的key
 
    if (ptr == NULL) { // 若不存在，则创建一个新的缓存节点并***缓存
        ptr = (struct node *)malloc(sizeof(struct node));
        ptr->key = key;
        ptr->val = val;
        insertToHead(ptr); // 插到缓存头部
    } else { // 若key已经存在，则节点已经被getNode()移动到缓存最前端
        ptr->val = val; // 更新缓存中的数据
    }
}
 
// operators整型二维数组，可包含多个操作，如：[[1,1,2],[2,key,0]] = [(赋值,key是1,值是2), 取值key的值]
// operatorsRowLen包含的行数；operatorsColLen包含的列数；
// k设置缓存容量；returnSize返回值的元素个数；返回值为一维数组
int* LRU(int** operators, int operatorsRowLen, int* operatorsColLen, int k, int* returnSize ) {
    int i, j, *op, *res = NULL;
 
    init(k);
    *returnSize = 0;
 
    for (i = 0; i < operatorsRowLen; i++) { // 遍历所有操作
        op = operators[i]; // 降维操作，将每一个操作单独从二维数组中取出来，作为一维数组来进行下一步判断
        if (op[0] == 1) { // set操作
            setValue(op[1], op[2]);
        } else if (op[0] == 2) { // getValue操作
            *returnSize += 1; // 每次getValue操作都有一个对应的返回值，
            res = (int *)realloc(res, (*returnSize) * sizeof(int)); // 所以每次要增加返回值数组的容量，
            res[*returnSize - 1] = getValue(op[1]); // 才能存下所有getValue操作的返回值。
        }
    }
 
    return res;
}


int main(int argc, const char * argv[]) {
    
    return 0;
}




