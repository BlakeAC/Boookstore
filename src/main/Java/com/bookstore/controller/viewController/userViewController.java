package com.bookstore.controller.viewController;

import com.bookstore.model.Admin;
import com.bookstore.model.Book;
import com.bookstore.model.Orders;
import com.bookstore.model.ShoppingCart;
import com.bookstore.service.AdminService;
import com.bookstore.service.BookService;
import com.bookstore.service.OrdersService;
import com.bookstore.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/userPage")
public class userViewController {

    @Autowired
    BookService bookService;
    @Autowired
    AdminService adminService;
    @Autowired
    OrdersService ordersService;


    @RequestMapping(
            value="/",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getMainPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session =request.getSession(true);

        List<String> types = bookService.getBooksType();
        List<Book> books =bookService.getAllBooks();

        int id =  (Integer) session.getAttribute("id");
        Admin user = adminService.getAdminById(id);

        mv.addObject("types",types);
        mv.addObject( "books",books);
        mv.addObject("username",user.getUsername());

        mv.setViewName("user-index");
        return mv;
    }

    /*@RequestMapping(
            value="/bookPage",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getBookType(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session =request.getSession(true);

        String type = "";
        try {
            type = new String(request.getParameter("bookType").getBytes("ISO-8859-1"), "UTF-8");
            System.out.println(type);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        //获取类别参数，并查询该类别所有图书
        List<Book> books = bookService.getBooksByType(type);
        mv.addObject("books",books);

        //获取所有图书类别
        List<String> types = bookService.getBooksType();
        mv.addObject("types",types);

        //获取用户名
        int id =  (Integer) session.getAttribute("id");
        Admin user = adminService.getAdminById(id);
        mv.addObject("username",user.getUsername());

        //返回显示的页面
        mv.setViewName("user-index");
        return mv;
    }*/

    @RequestMapping(
            value="/search",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView search(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session =request.getSession(true);

        String key = "";
        try {
            key = new String(request.getParameter("search-content").getBytes("ISO-8859-1"), "UTF-8");
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        //查询符合条件的书并返回
        //这里要改动
        List<Book> results = bookService.getBooksByTitle(key);

        mv.addObject("results",results);


        //获取用户名
        int id =  (Integer) session.getAttribute("id");
        Admin user = adminService.getAdminById(id);
        mv.addObject("username",user.getUsername());

        //返回显示的页面
        mv.setViewName("search-result");
        return mv;
    }

    @RequestMapping(
            value="/getOrder",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getOrder(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session =request.getSession(true);


        //获取订单
        int id =Integer.valueOf("" + session.getAttribute("id"));
        List<Orders> orders=ordersService.showOrdersById(id);
        mv.addObject("orders",orders);
        //获取用户名
        Admin user = adminService.getAdminById(id);
        mv.addObject("username",user.getUsername());

        //返回显示的页面
        mv.setViewName("user-order");
        return mv;
    }

    @RequestMapping(
            value="/shoppingCart",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView shoppingCart(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session =request.getSession(true);

        //获取订单
        int id =Integer.valueOf("" + session.getAttribute("id"));
        /*List<ShoppingCart> carts = ShoppingCartService.showShoppingCartById(id);
        mv.addObject("cats",carts);*/
        //获取用户名
        Admin user = adminService.getAdminById(id);
        mv.addObject("username",user.getUsername());

        //返回显示的页面
        mv.setViewName("user-cart");
        return mv;
    }

}
