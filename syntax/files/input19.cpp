#include <iostream>

using namespace std;

struct Node
{
    int data;
    Node *next;
};

void insertaFinal(Node **pointerToHead, int data)
{

    Node *newNode = new Node();
    newNode->data = data;
    newNode->next = NULL;

    if (*pointerToHead == NULL)
    {
        *pointerToHead = newNode;
        return;
    }

    Node *lastNode = *pointerToHead;
    while (lastNode->next != NULL)
        lastNode = lastNode->next;

    lastNode->next = newNode;
}

void insertaInicio(Node **pointerToHead, int data)
{

    Node *newNode = new Node();
    newNode->data = data;
    newNode->next = *pointerToHead;

    *pointerToHead = newNode;
}

void imprime(Node *head)
{

    while (head != NULL)
    {
        cout << head->data << " - ";
        head = head->next;
    }

    cout << "NULL" << endl;
}

void myReverse(Node **pointerToHead)
{

    Node *temp = *pointerToHead;
    Node *tempHead = NULL;

    while (temp != NULL)
    {
        insertaInicio(&tempHead, temp->data);
        temp = temp->next;
    }

    *pointerToHead = tempHead;
}

// https://www.youtube.com/watch?v=sYcOK51hl-A
void iterativeReverse(Node **pointertoHead)
{

    Node *current = *pointertoHead;
    Node *prev = NULL;
    Node *next = NULL;

    while (current != NULL)
    {

        // We save the next node
        next = current->next;

        // Reverse current node's pointer
        // We change the direction, no we point to the previous node
        current->next = prev;

        // Move pointers one position ahead
        // Recorremos los pointers a la derecha
        prev = current;
        current = next;
    }

    *pointertoHead = prev;
}

void concat(Node **pointerToHead1, Node **pointerToHead2)
{

    Node *lastFirstList = *pointerToHead1;

    while (lastFirstList->next != NULL)
        lastFirstList = lastFirstList->next;

    lastFirstList->next = *pointerToHead2;
}

void equals(Node **pointerToHead1, Node **pointerToHead2)
{

    Node *temp1 = *pointerToHead1;
    Node *temp2 = *pointerToHead2;

    bool areEqual = true;

    while ((temp1 != NULL || temp2 != NULL) && areEqual)
    {

        if (temp1->data != temp2->data)
            areEqual = false;
        temp1 = temp1->next;
        temp2 = temp2->next;
    }

    cout << boolalpha << areEqual << endl;
}

int main()
{

    Node *head = NULL;

    insertaFinal(&head, 4);
    insertaFinal(&head, 5);
    insertaFinal(&head, 6);
    insertaInicio(&head, 10);
    insertaInicio(&head, 2);
    cout << "Lista 1: " << endl;
    imprime(head);

    // myReverse(&head);
    // iterativeReverse(&head);

    cout << endl;

    Node *head2 = NULL;

    insertaFinal(&head2, 4);
    insertaFinal(&head2, 5);
    insertaFinal(&head2, 6);
    insertaInicio(&head2, 10);
    insertaInicio(&head2, 2);
    cout << "Lista 2: " << endl;
    imprime(head2);

    cout << "\nAre equal??? " << endl;
    equals(&head, &head2);

    cout << "\nUniendo ambas listas: " << endl;
    concat(&head, &head2);
    imprime(head);
}