package com.dyliu.webchat.controller;


import com.dyliu.webchat.pojo.ChatRoom;
import com.dyliu.webchat.pojo.User;
import com.dyliu.webchat.service.IChatRoomService;
import com.dyliu.webchat.service.ILogService;
import com.dyliu.webchat.service.IUserService;
import com.dyliu.webchat.utils.CommonDate;
import com.dyliu.webchat.utils.LogUtil;
import com.dyliu.webchat.utils.NetUtil;
import com.dyliu.webchat.utils.UploadUtil;
import com.dyliu.webchat.utils.WordDefined;
import java.io.FileInputStream;
import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Author :  Amayadream
 * TODO   :  用户控制器
 */
@Controller
@SessionAttributes("userid")
public class UserController {
    @Resource private User user;
    @Resource private IUserService userService;
    @Resource private ILogService logService;
    @Resource private IChatRoomService chatRoomService;

    /**
     * 聊天主页
     */
    @RequestMapping(value = "chat/{id}")
    public ModelAndView getIndex(@PathVariable("id") int id){
        ModelAndView view = new ModelAndView("index");
        ChatRoom chatRoom= chatRoomService.selectChatRoomById(id);
        view.addObject("chatRoom",chatRoom );
        return view;
    }

    /**
     * 显示个人信息页面
     */
    @RequestMapping(value = "{userid}", method = RequestMethod.GET)
    public ModelAndView selectUserByUserid(@PathVariable("userid") String userid, @ModelAttribute("userid") String sessionid){
        ModelAndView view = new ModelAndView("information");
        ModelAndView view1 = new ModelAndView("student/stu-information");
        user = userService.selectUserByUserid(userid);
        if(user.getIdentity()==1) {
            view.addObject("user", user);
            return view;
        }else {
            view1.addObject("user", user);
            return view1;
        }
    }

    /**
     * 显示个人信息编辑页面
     * @param userid
     * @param sessionid
     * @return
     */
    @RequestMapping(value = "{userid}/config")
    public ModelAndView setting(@PathVariable("userid") String userid, @ModelAttribute("userid") String sessionid){
        ModelAndView view = new ModelAndView("info-setting");
        ModelAndView view1 = new ModelAndView("student/stu-info-setting");
        user = userService.selectUserByUserid(userid);
        if(user.getIdentity()==1) {
            view.addObject("user", user);
            return view;
        }else {
            view1.addObject("user", user);
            return view1;
        }
    }


    /**
     * 更新用户信息
     * @param userid
     * @param sessionid
     * @param user
     * @return
     */
    @RequestMapping(value = "{userid}/update", method = RequestMethod.POST)
    public String  update(@PathVariable("userid") String userid, @ModelAttribute("userid") String sessionid, User user, RedirectAttributes attributes,
                          NetUtil netUtil, CommonDate date, WordDefined defined, HttpServletRequest request){
        boolean flag = userService.update(user);
        if(flag){
            logService.insert(LogUtil.setLog(userid, date.getTime24(), defined.LOG_TYPE_UPDATE, defined.LOG_DETAIL_UPDATE_PROFILE, netUtil.getIpAddress(request)));
            attributes.addFlashAttribute("message", "["+userid+"]资料更新成功!");
        }else{
            attributes.addFlashAttribute("error", "["+userid+"]资料更新失败!");
        }
        return "redirect:/{userid}/config";
    }

    /**
     * 修改密码
     * @param userid
     * @param oldpass
     * @param newpass
     * @return
     */
    @RequestMapping(value = "{userid}/pass", method = RequestMethod.POST)
    public String changePassword(@PathVariable("userid") String userid, String oldpass, String newpass, RedirectAttributes attributes,
                                 NetUtil netUtil, CommonDate date, WordDefined defined, HttpServletRequest request){
        user = userService.selectUserByUserid(userid);
        if(oldpass.equals(user.getPassword())){
            user.setPassword(newpass);
            boolean flag = userService.update(user);
            if(flag){
                logService.insert(LogUtil.setLog(userid, date.getTime24(), defined.LOG_TYPE_UPDATE, defined.LOG_DETAIL_UPDATE_PASSWORD, netUtil.getIpAddress(request)));
                attributes.addFlashAttribute("message", "["+userid+"]密码更新成功!");
            }else{
                attributes.addFlashAttribute("error", "["+userid+"]密码更新失败!");
            }
        }else{
            attributes.addFlashAttribute("error", "密码错误!");
        }
        return "redirect:/{userid}/config";
    }

    /**
     * 头像上传
     * @param userid
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "{userid}/upload")
    public String upload(@PathVariable("userid") String userid, HttpServletRequest request, UploadUtil uploadUtil,
                         RedirectAttributes attributes, NetUtil netUtil, CommonDate date, WordDefined defined){
        try{
            String fileurl = uploadUtil.upload(request, "upload", userid);
            user = userService.selectUserByUserid(userid);
            user.setProfilehead(fileurl);
            boolean flag = userService.update(user);
            if(flag){
                logService.insert(LogUtil.setLog(userid, date.getTime24(), defined.LOG_TYPE_UPDATE, defined.LOG_DETAIL_UPDATE_PROFILEHEAD, netUtil.getIpAddress(request)));
                attributes.addFlashAttribute("message", "["+userid+"]头像更新成功!");
            }else{
                attributes.addFlashAttribute("error", "["+userid+"]头像更新失败!");
            }
        } catch (Exception e){
            attributes.addFlashAttribute("error", "["+userid+"]头像更新失败!");
        }
        return "redirect:/{userid}/config";
    }
    /**
     * 获取用户头像
     * @param userid
     */

    @RequestMapping(value = "{userid}/head")
    public void head(@PathVariable("userid") String userid, HttpServletRequest request, HttpServletResponse response){
        try {
            user = userService.selectUserByUserid(userid);
            String path = user.getProfilehead();
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            String picturePath = rootPath + path;
            response.setContentType("image/jpeg; charset=UTF-8");
            ServletOutputStream outputStream = response.getOutputStream();
            FileInputStream inputStream = new FileInputStream(picturePath);
            byte[] buffer = new byte[1024];
            int i = -1;
            while ((i = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, i);
            }
            outputStream.flush();
            outputStream.close();
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
