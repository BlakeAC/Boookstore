package com.bookstore.controller;



import com.bookstore.model.ShoppingCart;
import com.bookstore.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ShoppingCart")
public class ShoppingCartController {
    @Autowired
    ShoppingCartService shoppingCartService;


    @RequestMapping(value = "/addBookToShoppingCart", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> addBookToShoppingCart(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();
        try {
            //ShoppingCart shoppingCart=new ShoppingCart();
            int id=Integer.valueOf("" + session.getAttribute("id"));
            shoppingCartService.addBookToShoppingCart(id,Integer.valueOf("" + map.get("bookId")),"" + map.get("bookName"),Integer.valueOf("" + map.get("bookNum")));
            ResponseMap.put("state",true);
            ResponseMap.put("message","添加成功");


        }catch (Exception e){
            ResponseMap.put("state", false);
            ResponseMap.put("message","添加失败");
            System.out.println("error");
            System.out.println(e.getMessage());

        }
        return ResponseMap;//返回给前端的数据
    }

    //输除订单
    @RequestMapping(value = "/deleteBookFromShoppingCart", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> deleteBookFromShoppingCart(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();
        try {
            int id=Integer.valueOf("" + session.getAttribute("id"));
            shoppingCartService.deleteBookFromShoppingCart(id,Integer.valueOf("" + map.get("cardId")));
            ResponseMap.put("state",true);
            ResponseMap.put("message","删除成功");

        }catch (Exception e){
            ResponseMap.put("state", false);
            ResponseMap.put("message","删除失败");
            System.out.println("error");
            System.out.println(e.getMessage());

        }
        return ResponseMap;//返回给前端的数据
    }

    @RequestMapping(value = "/showShoppingCartById", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object>showShoppingCartById(@RequestBody Map<String,Object>map, HttpServletRequest request) {
        Map<String, Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();

        try {
            int id =Integer.valueOf("" + session.getAttribute("id"));
            List<ShoppingCart> shoppingCartList=shoppingCartService.showShoppingCartById(id);
            ResponseMap.put("data",shoppingCartList);

        }catch (Exception e){
            System.out.println("error");
            System.out.println(e.getMessage());
        }
        return ResponseMap;
    }

}
