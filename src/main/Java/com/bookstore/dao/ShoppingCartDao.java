package com.bookstore.dao;

import com.bookstore.model.ShoppingCart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShoppingCartDao {
    ShoppingCart selectBook(int bookId);
    List<ShoppingCart> showShoppingCartById(int id);
    void addBookToShoppingCart(@Param("id")int id, @Param("bookId")int bookId,@Param("bookName")String bookName, @Param("bookNum")int bookNum);
    void deleteBookFromShoppingCart(@Param("id") int id,@Param("cardId") int cardId);
}
