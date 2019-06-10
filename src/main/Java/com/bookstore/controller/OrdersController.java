package com.bookstore.controller;


import com.bookstore.model.Orders;
import com.bookstore.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/Orders")
public class OrdersController {
    @Autowired
    OrdersService ordersService;


    @RequestMapping(value = "/showOrdersById", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object>showOrdersById(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();
        int id=Integer.valueOf(session.getAttribute("id").toString());
        try{
            List<Orders> ordersList=ordersService.showOrdersById(id);
            ResponseMap.put("orders",ordersList);

        }catch (Exception e){
            System.out.println("error");
            System.out.println(e.getMessage());
        }
        return ResponseMap;
    }

    @RequestMapping(value = "/addOrder", method = RequestMethod.POST,produces = "application/json")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object>addOrder(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request) {

        Map<String, Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        Date date = new Date();

        System.out.println(simpleDateFormat.format(date));

        try {
            int id = Integer.parseInt(session.getAttribute("id").toString());

            if (ordersService.addOrder(id,
                    Integer.parseInt(map.get("bookId").toString()),
                    map.get("bookName").toString(),
                    Integer.valueOf("" + map.get("orderNum")),
                    map.get("consignee").toString(),
                    map.get("address").toString(),
                    map.get("contactWay").toString(),
                    Integer.parseInt(map.get("orderPrice").toString()),
                    simpleDateFormat.format(date)
            )) {
                ResponseMap.put("state", true);
                ResponseMap.put("message", "新增成功");
            } else {
                ResponseMap.put("state", false);
                ResponseMap.put("message", "新增失败");
            }
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return ResponseMap;
    }

}
