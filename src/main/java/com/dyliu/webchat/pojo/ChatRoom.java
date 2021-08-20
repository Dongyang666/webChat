package com.dyliu.webchat.pojo;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;


@TableName("chatroom")
public class ChatRoom {

    @TableId(type = IdType.AUTO)
    private int id;      //id
    private String chat_name;    //聊天室名称
    private String speaker_name;    //主讲人
    private String profile;    //简介
    private int status;            //状态


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getChat_name() {
        return chat_name;
    }

    public void setChat_name(String chat_name) {
        this.chat_name = chat_name;
    }

    public String getSpeaker_name() {
        return speaker_name;
    }

    public void setSpeaker_name(String speaker_name) {
        this.speaker_name = speaker_name;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ChatRoom{" +
                "id=" + id +
                ", chat_name='" + chat_name + '\'' +
                ", speaker_name='" + speaker_name + '\'' +
                ", profile='" + profile + '\'' +
                ", status=" + status +
                '}';
    }
}
