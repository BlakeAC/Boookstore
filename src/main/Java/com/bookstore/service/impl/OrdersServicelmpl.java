package com.bookstore.service.impl;

import com.bookstore.dao.OrdersDao;
import com.bookstore.model.Orders;
import com.bookstore.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service//注解
public class OrdersServicelmpl implements OrdersService{
    @Autowired//自动装配
            OrdersDao OrdersDao;

    @Override
    public  List<Orders> showOrdersById(int id){
        List<Orders> ordersList=OrdersDao.showOrdersById(id);
        return  ordersList;
    }

    @Override
    public boolean addOrder(int id, int bookId, String bookName,
                            int orderNum, String consignee, String address, String contactWay,int orderPrice,String createTime) {
        try {
            OrdersDao.addOrder(id,bookId,bookName,orderNum,consignee,address,contactWay,orderPrice,createTime);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public int getOrderCountByUserId(int id){
        return OrdersDao.getOrderCountByUserId(id);
    }

    @Override
    public List<Orders> getAllOrders(){
        return OrdersDao.getAllOrders();
    }
}
