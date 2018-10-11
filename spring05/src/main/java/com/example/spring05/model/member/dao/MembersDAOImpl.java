package com.example.spring05.model.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring05.model.member.dto.FriendListDTO;
import com.example.spring05.model.member.dto.MembersDTO;
@Repository
public class MembersDAOImpl implements MembersDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public boolean loginCheck(MembersDTO dto) {
		String name = 
				sqlSession.selectOne("members.login_check", dto);
		return (name==null) ? false : true;
	}

	@Override
	public MembersDTO viewMembers(String userid) {
		return sqlSession.selectOne("members.viewMember", userid);
	}

	@Override
	public void insertMembers(MembersDTO dto) {
		sqlSession.insert("members.insertMember",dto);

	}

	@Override
	public List<MembersDTO> list(String users_id) {
		return sqlSession.selectList("members.list",users_id);
	}

	@Override
	public List<MembersDTO> list_man(String users_id) {
		return sqlSession.selectList("members.list_man",users_id);
	}

	@Override
	public List<MembersDTO> list_woman(String users_id) {
		return sqlSession.selectList("members.list_woman",users_id);
	}

	@Override
	public MembersDTO detailMembers(String userid) {
		return sqlSession.selectOne("members.detail",userid);
	}

	@Override
	public void friendList(FriendListDTO dto) {
		sqlSession.insert("members.friendInsert",dto);
		
	}

	@Override
	public List<FriendListDTO> friendRequest(String users_id) {
		return sqlSession.selectList("members.friendRequest",users_id);
	}

	@Override
	public int friendCount(String users_id) {
		return sqlSession.selectOne("members.friendCount",users_id);
	}

	@Override
	public void friendDelete(FriendListDTO dto) {
		sqlSession.delete("members.friendDelete",dto);
	}

	@Override
	public void updateMembers(MembersDTO dto) {
		sqlSession.update("members.updateMembers",dto);
	}

	@Override
	public List<MembersDTO> adminList(String userid) {
		return sqlSession.selectList("members.adminList",userid);
	}

	@Override
	public void delete(MembersDTO dto) {
		sqlSession.delete("members.delete",dto);
	}

	@Override
	public List<MembersDTO> listAll(String keyword) {
		String key="%"+keyword+"%";
		return sqlSession.selectList("members.listAll",key);
	}

	@Override
	public int useridCheck(MembersDTO dto) {
		return sqlSession.selectOne("members.useridCheck",dto);
	}

	@Override
	public List<MembersDTO> findId(MembersDTO dto) {
		return sqlSession.selectList("members.findId",dto);
	}

	@Override
	public int findIdCount(MembersDTO dto) {
		return sqlSession.selectOne("members.findIdCount",dto);
	}

	@Override
	public List<MembersDTO> findPw(MembersDTO dto) {
		return sqlSession.selectList("members.findPw",dto);
	}

	@Override
	public int findPwCount(MembersDTO dto) {
		return sqlSession.selectOne("members.findPwCount",dto);
	}

	@Override
	public List<MembersDTO> list2(String users_id) {
		return sqlSession.selectList("members.list2",users_id);
	}

	@Override
	public int countList(String users_id) {
		return sqlSession.selectOne("members.countList",users_id);
	}

}
