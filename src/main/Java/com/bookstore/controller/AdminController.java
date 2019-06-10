package com.bookstore.controller;

import com.bookstore.model.Admin;
import com.bookstore.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


import java.util.Map;

@Controller
@RequestMapping("/Admin")
public class AdminController {
    @Autowired
    AdminService adminService;


    //登陆验证
    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> checkLogin(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();//将id放入session

        try {
            if (adminService.checkLogin((String)map.get("username"),(String)map.get("password"))){
                Admin admin = adminService.selectAdminByUsername((String)map.get("username"));
                session.setAttribute("id",admin.getId());
                ResponseMap.put("state",true);
                if (admin.getManager()==0) {
                    session.setAttribute("isManager",false);
                    ResponseMap.put("isManager", false);
                }
                else {
                    session.setAttribute("isManager",true);
                    ResponseMap.put("isManager", true);
                }
            }else {
                ResponseMap.put("state", false);
                ResponseMap.put("message", "密码错误");
            }
        }catch (Exception e){
            System.out.println("查询出错");
            System.out.println(e.getMessage());

            ResponseMap.put("state", false);
            ResponseMap.put("message", "用户不存在");
        }
        return ResponseMap;//返回给前端的数据
    }

    //注册功能
    @RequestMapping(value = "/register", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> register(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();

        try {
            if (adminService.register((String)map.get("username"),(String)map.get("password"))){
                ResponseMap.put("state",true);
                ResponseMap.put("message","注册成功,请登录");
            }else {
                ResponseMap.put("state", false);
                ResponseMap.put("message","已有用户");
            }
        }catch (Exception e){
            System.out.println("error");
            System.out.println(e.getMessage());

        }
        return ResponseMap;//返回给前端的数据
    }

    //注销功能
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return "login";
    }

    //根据id删除用户
    @RequestMapping(value = "/deleteUserById",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map<String,Object> deleteUserById(@RequestBody Map<String,Object> map) {
        Map<String, Object> ResponseMap = new HashMap<>();

        int userId = Integer.parseInt("" + map.get("userId"));
        String message = "";

        Admin user = adminService.getAdminById(userId);
        if (user == null) {
            ResponseMap.put("state", false);
            ResponseMap.put("message", "删除失败，用户不存在");
        } else if (user.getManager() == 0){
            try {
                adminService.deleteAdminById(userId);
                ResponseMap.put("state", true);
                ResponseMap.put("message", "删除成功");
            } catch (Exception e) {
                e.printStackTrace();
                ResponseMap.put("state", false);
                ResponseMap.put("message", "删除失败");
            }
        }else {
            ResponseMap.put("state", false);
            ResponseMap.put("message", "删除失败，你没有权限删除一名管理员");
        }
        return ResponseMap;
    }
}
