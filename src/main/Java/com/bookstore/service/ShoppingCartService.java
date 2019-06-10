package com.bookstore.service;

import com.bookstore.model.ShoppingCart;

import java.util.List;


public interface ShoppingCartService {
    ShoppingCart selectBook(int bookId);
    List<ShoppingCart> showShoppingCartById(int id);
    void addBookToShoppingCart(int id,int bookId,String bookName,int bookNum);
    void deleteBookFromShoppingCart(int id,int cardId);
}
