package com.dyliu.webchat.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dyliu.webchat.pojo.User;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserDao extends BaseMapper<User> {
    List<User> selectAll(int offset,int limit);

    User selectUserByUserid(String userid);

    User selectCount();
}
