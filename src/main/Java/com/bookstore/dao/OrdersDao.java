package com.bookstore.dao;

import com.bookstore.model.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersDao {

    List<Orders> showOrdersById(int id);
    void addOrder(@Param("id")int id,@Param("bookId")int bookId,@Param("bookName")String bookName,@Param("orderNum")int orderNum,@Param("consignee")String consignee,@Param("address")String address,@Param("contactWay")String contactWay,@Param("orderPrice")int orderPrice,@Param("createTime")String createTime);
    int getOrderCountByUserId(int id);
    List<Orders> getAllOrders();
}
