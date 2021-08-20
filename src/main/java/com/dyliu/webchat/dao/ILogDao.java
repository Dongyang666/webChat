package com.dyliu.webchat.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dyliu.webchat.pojo.Log;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

/**
 * NAME   :  WebChat/com.amayadream.webchat.dao
 * Author :  Amayadream
 * Date   :  2016.01.09 16:39
 */
@Mapper
public interface ILogDao extends BaseMapper<Log> {
    List<Log> selectAll( int offset,  int limit);

    List<Log> selectLogByUserid( String userid,  int offset, int limit);

    Log selectCount();

    Log selectCountByUserid(String userid);

    boolean deleteThisUser(String userid);

    boolean deleteAll();
}
