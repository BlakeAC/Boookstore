package com.bookstore.service.impl;

import com.bookstore.dao.BookDao;
import com.bookstore.model.Book;
import com.bookstore.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service//注解
public class BookServiceImpl implements BookService{
    @Autowired//自动装配
            BookDao BookDao;

    @Override
    public  List<Book> getBooksByType(String bookType){
        List<Book> bookList=BookDao.getBooksByType(bookType);
        return  bookList;
    }

    @Override
    public List<Book> getBooksByTitle(String bookTitle) {
        List<Book> bookList=BookDao.getBooksByTitle('%'+bookTitle+'%');
        System.out.println("123");
        return  bookList;
    }

    //获取书的类型
    @Override
    public List<String> getBooksType(){
        List<String> bookTypeList=BookDao.getBooksType();
        return bookTypeList;
    }
    @Override
    public void addABook(Book book){
        BookDao.addABook(book);
        return;
    }

    @Override
    public List<Book> getAllBooks(){
        return BookDao.getAllBooks();
    }
    @Override
    public  Book getOneBook(int bookId){
       Book book=BookDao.getOneBook(bookId);
        return  book;
    }

    @Override
    public void deleteBookByBookId(int bookId){
        BookDao.deleteBooKByBookId(bookId);
    }

}
