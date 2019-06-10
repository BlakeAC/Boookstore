package com.bookstore.dao;

import com.bookstore.model.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {

    List<Book> getBooksByType(String bookType);
    List<Book> getBooksByTitle(String bookTitle);
    List<String> getBooksType();
    void addABook(Book book);
    List<Book> getAllBooks();
    Book getOneBook(int bookId);
    void deleteBooKByBookId(int bookId);

}
