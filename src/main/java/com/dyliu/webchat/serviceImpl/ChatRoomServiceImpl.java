package com.dyliu.webchat.serviceImpl;


import com.dyliu.webchat.dao.IChatRoomDao;
import com.dyliu.webchat.pojo.ChatRoom;
import com.dyliu.webchat.service.IChatRoomService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * NAME   :  WebChat/com.amayadream.webchat.serviceImpl
 * Author :  Amayadream
 * Date   :  2016.01.08 14:37
 * TODO   :
 */
@Service(value = "chatRoomService")
public class ChatRoomServiceImpl implements IChatRoomService {

    @Autowired
    private IChatRoomDao chatRoomDao;

    @Override
    public List<ChatRoom> selectAll() {
        return chatRoomDao.selectAll();
    }

    @Override
    public List<ChatRoom> selectChatRoomInAnswer() {
        return chatRoomDao.selectChatRoomInAnswer();
    }

    @Override
    public List<ChatRoom> selectChatRoomByChatName(String chat_name) {
        return chatRoomDao.selectChatRoomByChatName(chat_name);
    }

    @Override
    public List<ChatRoom> selectChatRoomBySpeakerName(String speaker_name) {
        return chatRoomDao.selectChatRoomBySpeakerName(speaker_name);
    }

    @Override
    public List<ChatRoom> selectChatRoomByChatNameAndUserid(String chat_name, String nickname) {
        return chatRoomDao.selectChatRoomByChatNameAndUserid(chat_name,nickname);
    }

    @Override
    public ChatRoom selectChatRoomById(int id) {
        return chatRoomDao.selectChatRoomById(id);
    }

    @Override
    public boolean insert(ChatRoom chatRoom) {
        return chatRoomDao.insert(chatRoom) == 1;
    }

    @Override
    public boolean update(ChatRoom chatRoom) {
        return chatRoomDao.updateById(chatRoom) == 1;
    }

    @Override
    public boolean delete(int id) {
        return chatRoomDao.deleteById(id) == 1;
    }


}
