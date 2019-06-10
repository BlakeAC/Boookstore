package com.bookstore.controller.viewController;

import com.bookstore.model.Admin;
import com.bookstore.model.Book;
import com.bookstore.model.Orders;
import com.bookstore.service.AdminService;
import com.bookstore.service.BookService;
import com.bookstore.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/adminPage")
public class adminViewController {
    @Autowired
    BookService bookService;
    @Autowired
    AdminService adminService;
    @Autowired
    OrdersService ordersService;

    //主页控制
    @RequestMapping(
            value="/",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getMainPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        //获取所有图书种类
        List<String> types = bookService.getBooksType();
        mv.addObject("types",types);

        //获取所有图书
        List<Book> books = bookService.getAllBooks();
        mv.addObject("books",books);

        //设置返回页面
        mv.setViewName("admin-index");
        return mv;
    }

    //按分类显示图书页面控制
    @RequestMapping(
            value="/getBookByType",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getBookByType(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String type = "";
        try {
            type = new String(request.getParameter("bookType").getBytes("ISO-8859-1"), "UTF-8");
            System.out.println(type);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        //获取该种类所有图书
        List<Book> books = bookService.getBooksByType(type);
        mv.addObject("books",books);

        //获取所有图书种类
        List<String> types = bookService.getBooksType();
        mv.addObject("types",types);

        //设置返回页面
        mv.setViewName("admin-index");
        return mv;
    }

    //查看所有订单页面控制
    @RequestMapping(
            value="/getAllOrders",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getAllOrders(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        //获取所有订单
        List<Orders> orders = ordersService.getAllOrders();
        mv.addObject("orders",orders);

        //获取所有图书种类
        List<String> types = bookService.getBooksType();
        mv.addObject("types",types);

        //设置返回页面
        mv.setViewName("admin-showOrders");
        return mv;
    }

    //添加图书页面控制
    @RequestMapping(
            value="/addBook",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView addBook(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        //获取所有图书种类
        List<String> types = bookService.getBooksType();
        mv.addObject("types",types);

        //设置返回页面
        mv.setViewName("admin-addBook");
        return mv;
    }


    //用户管理页面控制
    @RequestMapping(
            value="/chargeUser",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView chargeUser(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        //获取所有图书种类
        List<String> types = bookService.getBooksType();
        mv.addObject("types",types);

        //获取所有用户与其下单数量
        List<Map<String,Object>> users = new ArrayList<>();
        List<Admin> admins = adminService.getAllAdmins();
        for (Admin admin : admins){
            Map<String,Object> user = new HashMap<>();
            user.put("username",admin.getUsername());
            user.put("isManager",admin.getManager());
            user.put("id",admin.getId());
            user.put("OrderCount",ordersService.getOrderCountByUserId(admin.getId()));
            users.add(user);
        }
        mv.addObject("users",users);

        //设置返回页面
        mv.setViewName("admin-chargeUser");
        return mv;
    }

}
