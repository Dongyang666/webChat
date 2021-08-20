package com.dyliu.webchat.websocket;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * NAME   :  WebChat/com.amayadream.webchat.websocket
 * Author :  Amayadream
 * Date   :  2016.01.23 17:20
 * TODO   :
 */
@ServerEndpoint(value = "/videoServer", configurator = HttpSessionConfigurator.class)
public class VideoServer extends ChatServer {

    private static final CopyOnWriteArraySet<ChatServer> webSocketSet = new CopyOnWriteArraySet<>();
       //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private String userid;      //用户名

    private static final List<String> list = new ArrayList<>();   //在线列表,记录用户名称
    private static final Map<String,Session> routetab = new HashMap<>();  //用户名和websocket的session绑定的路由表

    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session, EndpointConfig config){
        this.session = session;
        webSocketSet.add(this);     //加入set中
        addOnlineCount();           //在线数加1;
        //request的session
        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        this.userid=(String) httpSession.getAttribute("userid");    //获取当前用户
        list.add(userid);           //将用户名加入在线列表
        routetab.put(userid, session);   //将用户名和session绑定到路由表
        String message = getMessage("[" + userid + "]加入聊天室,当前在线人数为"+getOnlineCount()+"位", "notice",  list);
        broadcast(message);     //广播
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(){
        webSocketSet.remove(this);  //从set中删除
        subOnlineCount();           //在线数减1
        list.remove(userid);        //从在线列表移除这个用户
        routetab.remove(userid);
        String message = getMessage("[" + userid +"]离开了聊天室,当前在线人数为"+getOnlineCount()+"位", "notice", list);
        broadcast(message);         //广播
    }

    /**
     * 接收客户端的message,判断是否有接收人而选择进行广播还是指定发送
     */
    @OnMessage
    public void onMessage(ByteBuffer msg) {

        for(ChatServer chat: webSocketSet){
            try {
                chat.session.getBasicRemote().sendBinary(msg);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 发生错误时调用
     * @param error
     */
    @OnError
    public void onError(Throwable error){
        error.printStackTrace();
    }

    /**
     * 广播消息
     * @param message
     */
    public void broadcast(String message){
        for(ChatServer chat: webSocketSet){
            try {
                chat.session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 对特定用户发送消息
     * @param message
     * @param session
     */
    public void singleSend(String message, Session session){
        try {
            session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 组装返回给前台的消息
     * @param message   交互信息
     * @param type      信息类型
     * @param list      在线列表
     * @return
     */
    public String getMessage(String message, String type, List list){
        JSONObject member = new JSONObject();
        member.put("message", message);
        member.put("type", type);
        member.put("list", list);
        return member.toString();
    }

    public  int getOnlineCount() {
        //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
        return 0;
    }

    public  void addOnlineCount() {
        ChatServer.onlineCount++;
    }

    public  void subOnlineCount() {
        ChatServer.onlineCount--;
    }
}
