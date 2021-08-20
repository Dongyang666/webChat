package com.dyliu.webchat.controller;


import com.dyliu.webchat.pojo.User;
import com.dyliu.webchat.service.IUserService;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Author :  Amayadream
 * Date   :  2016.01.09 17:54
 * TODO   :  路由控制器
 */
@Controller
@RequestMapping(value = "")
public class RouteController {
    @Resource private IUserService userService;
    //老师登陆页面显示
    @RequestMapping(value = "")
    public String index() {
        return "redirect:/user/login";
    }

    @RequestMapping(value = "/about")
    public String about() {
        return "about";
    }

    @RequestMapping(value = "/help")
    public String help() {
        return "help";
    }

    @RequestMapping(value = "/system-setting")
    public String system() {
        return "system-setting";
    }

    @RequestMapping(value = "/add")
    public String add() {
        return "add-student";
    }

    @RequestMapping(value = "/five-chess")
    public String five() {
        return "five-chess";
    }
    @RequestMapping(value = "/add-chat")
    public String addChat() {
        return "add-chat";
    }


    //学生插入控制器
    @RequestMapping(value = "/insert-student", method = RequestMethod.POST)
    public String  insert(@ModelAttribute User user, RedirectAttributes attributes, HttpServletRequest request){
        boolean flag = userService.insert(user);
        if(flag){
            attributes.addFlashAttribute("message", "添加成功!");
        }else{
            attributes.addFlashAttribute("error", "添加失败!");
        }
        return "redirect:/add";
    }

}
