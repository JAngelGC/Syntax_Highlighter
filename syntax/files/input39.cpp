#include <iostream>

using namespace std;

class Book
{
public:
    string title;
    string author;
    int pages;

    Book()
    {
        title = "No title";
        author = "No author";
        pages = 0;
    }

    Book(string aTitle, string aAuthor, int aPages)
    {
        title = aTitle;
        author = aAuthor;
        pages = aPages;
    }
};

int main()
{
    cout << "Classes and objects" << endl;
    Book book1("Harry Potter", "JK Rowling", 500);
    cout << book1.title << endl;

    Book book2;
    cout << book2.title;

    return 0;
}