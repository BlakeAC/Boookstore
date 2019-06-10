package com.bookstore.service;

import com.bookstore.model.Book;

import java.util.List;

public interface BookService {

    List<Book> getBooksByType(String bookType);
    List<Book> getBooksByTitle(String bookTitle);
    List<String> getBooksType();
    void addABook(Book book);
    List<Book> getAllBooks();
    Book getOneBook(int bookId);
    void deleteBookByBookId(int bookId);

}
