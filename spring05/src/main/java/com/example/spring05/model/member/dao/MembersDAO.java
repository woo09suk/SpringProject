package com.example.spring05.model.member.dao;

import java.util.List;

import com.example.spring05.model.member.dto.FriendListDTO;
import com.example.spring05.model.member.dto.MembersDTO;

public interface MembersDAO {
	
	public boolean loginCheck(MembersDTO dto);
	public MembersDTO viewMembers(String userid);
	public void insertMembers(MembersDTO dto);
	public List<MembersDTO> list(String users_id);
	public List<MembersDTO> list_man(String users_id);
	public List<MembersDTO> list_woman(String users_id);
	public MembersDTO detailMembers(String userid);
	public void friendList(FriendListDTO dto);
	public List<FriendListDTO> friendRequest(String users_id);
	public int friendCount(String users_id);
	public void friendDelete(FriendListDTO dto);
	public void updateMembers(MembersDTO dto);
	public List<MembersDTO> adminList(String userid);
	public void delete(MembersDTO dto);
	public List<MembersDTO> listAll(String keyword);
	public int useridCheck(MembersDTO dto);
	public List<MembersDTO> findId(MembersDTO dto);
	public int findIdCount(MembersDTO dto);
	public List<MembersDTO> findPw(MembersDTO dto);
	public int findPwCount(MembersDTO dto);
	public List<MembersDTO> list2(String users_id);
	public int countList(String users_id);

}
