#include <iostream>
using namespace std;

// A linked list node
struct Node
{
    int data;
    struct Node *next;
};

// insert a new node in front of the list
// insert at the beginning of the list
void push(struct Node **pthead, int node_data)
{
    /* 1. create and allocate node */
    struct Node *newNode = new Node;

    /* 2. assign data to node */
    newNode->data = node_data;

    /* 3. set next of new node as head */
    newNode->next = (*pthead);

    /* 4. move the head to point to the new node */
    (*pthead) = newNode;
}

/* insert new node at the end of the linked list */
// insert at the end of the list

void append(struct Node **pthead, int node_data)
{
    /* 1. create and allocate node */
    struct Node *newNode = new Node;

    struct Node *last = *pthead; /* used in step 5*/

    /* 2. assign data to the node */
    newNode->data = node_data;

    /* 3. set next pointer of new node to null as its the last node*/
    newNode->next = NULL;

    /* 4. if list is empty, new node becomes first node */
    if (*pthead == NULL)
    {
        *pthead = newNode;
        return;
    }

    /* 5. Else traverse till the last node */
    while (last->next != NULL)
        last = last->next;

    /* 6. Change the next of last node */
    last->next = newNode;
    return;
}

// display linked list contents
void displayList(struct Node *tmp)
{
    // traverse the list to display each node
    while (tmp != NULL)
    {
        cout << tmp->data << "-->";
        tmp = tmp->next;
    }

    if (tmp == NULL)
        cout << "null";
}
/* main program for linked list*/
int main()
{
    /* empty list */
    struct Node *head = NULL;

    // Insert 10.
    append(&head, 10);
    append(&head, 8);
    append(&head, 4);

    // Insert 20 at the beginning.
    push(&head, 20);
    push(NULL, 20);

    // Insert 30 at the beginning.
    /// push(&head, 30);

    // Insert 40 at the end.
    // append(&head, 40);

    // Insert 50, after 20.
    // insertAfter(head->next, 50);

    cout << "Final linked list: " << endl;
    displayList(head);
    cout << endl;

    return 0;
}