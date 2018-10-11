package com.example.spring05.model.memo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import com.example.spring05.model.memo.dto.MemoDTO;

public interface MemoDAO {
	
	@Select("select * from members m,memo e where m.userid=e.userid order by idx desc")
	public List<MemoDTO> list();//import java.util.List;
	
	//mybatis query에 전달할 변수는 @Param으로 처리
	@Insert("insert into memo (idx,userid,memo) values "
			+ "( (select nvl(max(idx)+1,1) from memo)"
			+ ", #{userid}, #{memo} )")
	public void insert(@Param("userid") String userid, 
			@Param("memo") String memo);
	
	@Select("select * from members m,memo e where m.userid=e.userid and idx=#{idx}")
	public MemoDTO memo_view(@Param("idx") int idx);
	
	@Update("update memo set userid=#{userid}, memo=#{memo}"
			+ " where idx=#{idx} ")
	public void update(MemoDTO dto);
	
	@Delete("delete from memo where idx=#{idx}")
	public void delete(@Param("idx") int idx);

}
