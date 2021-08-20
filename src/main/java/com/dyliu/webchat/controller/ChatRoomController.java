package com.dyliu.webchat.controller;


import com.dyliu.webchat.pojo.ChatRoom;
import com.dyliu.webchat.pojo.User;
import com.dyliu.webchat.service.IChatRoomService;
import com.dyliu.webchat.service.IUserService;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Author :  Amayadream
 * Date   :  2016.01.09 17:54
 * TODO   :  聊天室控制器
 */
@Controller
@RequestMapping(value = "")
public class ChatRoomController {
    @Resource private IUserService userService;
    @Resource private IChatRoomService chatRoomService;

    //老师端显示所有答疑室
    @RequestMapping(value = "/queryChatList/{userid}")
    public ModelAndView queryChatList(@PathVariable("userid") String userid)
    {

        ModelAndView view = new ModelAndView("queryChatList");
        User user=userService.selectUserByUserid(userid);
        List<ChatRoom> list=chatRoomService.selectChatRoomBySpeakerName(user.getNickname());
        view.addObject("chatRoomList",list);
        return view;
    }
    //学生端显示所有答疑室
    @RequestMapping(value = "/stu-queryChatList")
    public ModelAndView stu_queryChatList()
    {

        ModelAndView view = new ModelAndView("student/stu-queryChatList");
        List<ChatRoom> list=chatRoomService.selectChatRoomInAnswer();
        view.addObject("stuchatRoomList",list);
        return view;
    }

    //答疑室插入控制
    @RequestMapping(value = "/insert-chat/{userid}", method = RequestMethod.POST)
    public String  insert(@ModelAttribute ChatRoom chatRoom,@PathVariable("userid") String userid,RedirectAttributes attributes, HttpServletRequest request){
        chatRoom.setSpeaker_name(userService.selectUserByUserid(userid).getNickname());
        boolean flag = chatRoomService.insert(chatRoom);
        if(flag){
            attributes.addFlashAttribute("message", "添加成功!");
        }else{
            attributes.addFlashAttribute("error", "添加失败!");
        }
        return "redirect:/queryChatList/"+userid;
    }


    //答疑室删除控制deleteChatRoom
    @RequestMapping(value = "/deleteChatRoom/{id}/{userid}")
    public String  deleteChatRoom(@PathVariable("id") int id,@PathVariable("userid") String userid,RedirectAttributes attributes, HttpServletRequest request){
        boolean flag = chatRoomService.delete(id);
        if(flag){
            attributes.addFlashAttribute("message", "添加成功!");
        }else{
            attributes.addFlashAttribute("error", "添加失败!");
        }
        return "redirect:/queryChatList/"+userid;
    }

    //修改答疑室状态changeStatus
    @RequestMapping(value = "/changeStatus/{id}/{userid}")
    public String changeStatus (@PathVariable("id") int id,@PathVariable("userid") String userid,RedirectAttributes attributes, HttpServletRequest request){
        ChatRoom chatRoom = chatRoomService.selectChatRoomById(id);
        if(chatRoom.getStatus()==1)
            chatRoom.setStatus(0);
        else
            chatRoom.setStatus(1);
        boolean flag=chatRoomService.update(chatRoom);
        if(flag){
            attributes.addFlashAttribute("message", "添加成功!");
        }else{
            attributes.addFlashAttribute("error", "添加失败!");
        }
        return "redirect:/queryChatList/"+userid;
    }


    //显示答疑室信息updateChatInfo
    @RequestMapping(value = "/updateChatInfo/{id}/{userid}")
    public ModelAndView updateChatInfo (@PathVariable("id") int id,@PathVariable("userid") String userid, RedirectAttributes attributes, HttpServletRequest request){
        ModelAndView view = new ModelAndView("info-chat-setting");
        ChatRoom chatRoom = chatRoomService.selectChatRoomById(id);
        view.addObject("chatRoom", chatRoom);
        return view;
    }


 //修改答疑室信息update-chat
 @RequestMapping(value = "/update-chat/{userid}",method = RequestMethod.POST)
 public String updateChat (ChatRoom chatRoom,@PathVariable("userid") String userid, RedirectAttributes attributes, HttpServletRequest request){
     boolean flag=chatRoomService.update(chatRoom);
     if(flag){
         attributes.addFlashAttribute("message", "修改成功!");
     }else{
         attributes.addFlashAttribute("error", "修改失败!");
     }
     return "redirect:/queryChatList/"+userid;
 }

 //通过答疑室的名称查找答疑室/selectByName
 @RequestMapping(value = "/selectByName/{userid}",method = RequestMethod.POST)
 public ModelAndView selectByName(@RequestParam("keyWord") String keyWord, @PathVariable("userid") String userid,RedirectAttributes attributes, HttpServletRequest request)
 {
     ModelAndView view = new ModelAndView("queryChatList");
     User user=userService.selectUserByUserid(userid);
     List<ChatRoom> list=chatRoomService.selectChatRoomByChatName(keyWord);
     //除去list集合中的不是当前用户的聊天室
     list.removeIf(chatRoom -> !chatRoom.getSpeaker_name().equals(user.getNickname()));
     view.addObject("chatRoomList",list);
     return view;
 }
    //通过答疑室的名称查找答疑室/selectByName
    @RequestMapping(value = "/stu-selectByName/{userid}",method = RequestMethod.POST)
    public ModelAndView stu_selectByName(@RequestParam("keyWord") String keyWord, @PathVariable("userid") String userid,RedirectAttributes attributes, HttpServletRequest request)
    {
        ModelAndView view = new ModelAndView("student/stu-queryChatList");
        List<ChatRoom> list=chatRoomService.selectChatRoomByChatName(keyWord);
        //除去list集合中的关闭答疑室
        list.removeIf(chatRoom -> chatRoom.getStatus() == 0);
        view.addObject("stuchatRoomList",list);
        return view;
    }
}
