package com.dyliu.webchat.service;


import com.dyliu.webchat.pojo.ChatRoom;
import java.util.List;

/**
 * NAME   :  WebChat/com.amayadream.webchat.service
 * Author :  Amayadream
 * Date   :  2016.01.08 14:36
 * TODO   :
 */
public interface IChatRoomService {
    List<ChatRoom> selectAll();
    List<ChatRoom> selectChatRoomInAnswer();
    List<ChatRoom> selectChatRoomByChatName(String chat_name);
    List<ChatRoom> selectChatRoomBySpeakerName(String speaker_name);
    List<ChatRoom> selectChatRoomByChatNameAndUserid(String chat_name,String nickname);
    ChatRoom selectChatRoomById(int id);
    boolean insert(ChatRoom chatRoom);
    boolean update(ChatRoom chatRoom);
    boolean delete(int id);
}
