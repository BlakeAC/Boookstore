package com.bookstore.service;

import com.bookstore.model.Orders;

import java.util.List;

public interface OrdersService{

    List<Orders> showOrdersById(int Id);
    boolean addOrder(int id, int bookId,String bookName,int orderNum, String consignee, String address, String contactWay,int orderPrice,String createTime);
    int getOrderCountByUserId(int id);
    List<Orders> getAllOrders();
}
