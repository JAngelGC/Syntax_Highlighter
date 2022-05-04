#include <iostream>

using namespace std;

// comment
class Node
{
public:
    int value;
    Node *next;
};

void printList(Node *n)
{
    while (n != NULL)
    {
        cout << n->value << " - ";
        n = n->next;
    }

    // cout << "NULL";
}

void insertAtTheFront(Node **pointerToHead, int newValue)
{

    // Now, *head is the direction

    // 1. Prepare a newNode
    Node *newNode = new Node();
    newNode->value = newValue;
    // (*newNode).value = newValue; // es lo mismo que arriba

    // 2. Put it in front of the current head
    newNode->next = *pointerToHead;

    // 3. Move head of the list to point to the newNode
    *pointerToHead = newNode;
}

void deleteAtTheFront(Node **pointerToHead)
{

    if (*pointerToHead == NULL)
    {
        cout << "ERROR" << endl;
        return;
    }

    // We will delete the first element,
    Node *first = *pointerToHead;

    // Before deleting, we need to update the pointer to head
    (*pointerToHead) = (*pointerToHead)->next;

    delete first;
}

void insertAtTheEnd(Node **pointerHead, int newValue)
{

    // Now, *head is the direction

    // 1. Prepare new node
    Node *newNode = new Node();
    newNode->value = newValue;
    newNode->next = NULL;

    // 2. If Linked list is empty, newNode will be a head node
    if (*pointerHead == NULL)
    {
        *pointerHead = newNode;
        return;
    }

    // 3. Find the last node
    Node *lastNode = *pointerHead;
    while (lastNode->next != NULL)
        lastNode = lastNode->next;

    // 4. Insert newNode after last node (at the end)
    lastNode->next = newNode;
}

void deleteAtTheEnd(Node **pointerToHead)
{

    if (*pointerToHead == NULL)
    {
        cout << "ERROR" << endl;
    }

    else if ((*pointerToHead)->next == NULL)
    {
        Node *temp = (*pointerToHead)->next;
        *pointerToHead = NULL;
        delete temp;
    }

    else
    {
        Node *temp = *pointerToHead;

        while (temp->next->next != NULL)
            temp = temp->next;

        Node *last = temp->next;
        temp->next = NULL;

        delete last;
    }
}

int main()
{

    // Node* head = new Node();

    // Simply saying: To access members of a structure, use the dot operator.
    // To access members of a structure through a pointer, use the arrow operator.

    Node *head = NULL;

    /* FUNCIONES
    printList
    insertAtTheFront
    deleteAtTheFront
    insertAtTheEnd
    deleteAtTheEnd
    */
    if (2 > 1){
        cout << "jaja";
    }

    insertAtTheFront(&head, 4);
    insertAtTheFront(&head, 6);
    insertAtTheFront(&head, 7);

    insertAtTheEnd(&head, 9);
    insertAtTheEnd(&head, 1);

    deleteAtTheFront(&head);
    deleteAtTheFront(&head);

    deleteAtTheEnd(&head);
    deleteAtTheEnd(&head);
    deleteAtTheEnd(&head); // AQUI MUEREEEEEEE

    printList(head);

    cout << "\n-----------------" << endl;

    // I M P O R T A N T E
    // P R E G U N T A R   A   D A N  P E R E Z
    // C U A L   E S   L A   D I F E R E N C I A   E N T R E  a  y  &a

    // cout << "\n\n**************************" << endl;
    // int* int_ptr = new int();
    // *int_ptr = 20;

    // cout << "int_ptr:   " << int_ptr << "  memory location where that integer is on the heap" << endl;     // memory location where that integer is on the heap
    // cout << "&int_ptr:  " << &int_ptr << "  memory location of the pointer on the stack?" << endl;   // memory location of the pointer on the stack?
    // cout << "*int_ptr:  " << *int_ptr << endl;   // imprime el valor

    // cout << "\n**************************" << endl;
    // int a = 10;
    // int* int_ptr = &a;
    // *int_ptr = 20;

    // cout << "a:         " << a << endl;
    // cout << "&a:        " << &a << endl;            // misma que el pointer??
    // cout << "int_ptr:   " << int_ptr << endl;     // memory location where that integer is on the heap
    // cout << "&int_ptr:  " << &int_ptr << endl;   // memory location of the pointer on the stack?
    // cout << "*int_ptr:  " << *int_ptr << endl;   // imprime el valor

    return 0;
}