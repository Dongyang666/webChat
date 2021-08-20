package com.dyliu.webchat.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dyliu.webchat.pojo.ChatRoom;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IChatRoomDao extends BaseMapper<ChatRoom> {
    List<ChatRoom> selectAll();
    List<ChatRoom> selectChatRoomInAnswer();
    List<ChatRoom> selectChatRoomByChatName(String chat_name);
    List<ChatRoom> selectChatRoomBySpeakerName(String speaker_name);
    List<ChatRoom> selectChatRoomByChatNameAndUserid(String chat_name,String nickname);
    ChatRoom selectChatRoomById(int id);
}
