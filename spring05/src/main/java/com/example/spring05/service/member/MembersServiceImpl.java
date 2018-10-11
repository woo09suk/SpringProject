package com.example.spring05.service.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.spring05.model.member.dao.MembersDAO;
import com.example.spring05.model.member.dto.FriendListDTO;
import com.example.spring05.model.member.dto.MembersDTO;

@Service
public class MembersServiceImpl implements MembersService {
	
	@Inject
	MembersDAO membersDao;

	@Override
	public boolean loginCheck(MembersDTO dto, HttpSession session) {
		boolean result=membersDao.loginCheck(dto);
		if(result) { //로그인 성공
			//세션변수에 값 저장
			MembersDTO dto2=viewMembers(dto.getUserid());
			//setAttribute(변수명,값)
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto2.getName());
			session.setAttribute("image",dto2.getImage());
			System.out.println(session.getAttribute("userid"));
			System.out.println(session.getAttribute("name"));
		} 
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();

	}

	@Override
	public MembersDTO viewMembers(String userid) {
		return membersDao.viewMembers(userid);
	}

	@Override
	public void insertMembers(MembersDTO dto) {
		membersDao.insertMembers(dto);

	}

	@Override
	public List<MembersDTO> list(String users_id) {
		return membersDao.list(users_id);
	}

	@Override
	public List<MembersDTO> list_man(String users_id) {
		return membersDao.list_man(users_id);
	}

	@Override
	public List<MembersDTO> list_woman(String users_id) {
		return membersDao.list_woman(users_id);
	}

	@Override
	public MembersDTO detailMembers(String userid) {
		return membersDao.detailMembers(userid);
	}

	@Override
	public void friendInsert(FriendListDTO dto) {
		membersDao.friendList(dto);
		
	}

	@Override
	public List<FriendListDTO> friendRequest(String users_id) {
		return membersDao.friendRequest(users_id);
	}

	@Override
	public int friendCount(String users_id) {
		return membersDao.friendCount(users_id);
	}

	@Override
	public void friendDelete(FriendListDTO dto) {
		membersDao.friendDelete(dto);			
	}

	@Override
	public void updateMembers(MembersDTO dto,HttpSession session) {
		session.setAttribute("image",dto.getImage());
		membersDao.updateMembers(dto);
		
	}

	@Override
	public List<MembersDTO> adminList(String userid) {
		return membersDao.adminList(userid);
	}

	@Override
	public void delete(MembersDTO dto) {
		membersDao.delete(dto);
		
	}

	@Override
	public List<MembersDTO> listAll(String keyword) {
		return membersDao.listAll(keyword);
	}

	@Override
	public int useridCheck(MembersDTO dto) {
		return membersDao.useridCheck(dto);
	}

	@Override
	public List<MembersDTO> findId(MembersDTO dto) {
		return membersDao.findId(dto);
	}

	@Override
	public int findIdCount(MembersDTO dto) {
		return membersDao.findIdCount(dto);
	}

	@Override
	public List<MembersDTO> findPw(MembersDTO dto) {
		return membersDao.findPw(dto);
	}

	@Override
	public int findPwCount(MembersDTO dto) {
		return membersDao.findPwCount(dto);
	}

	@Override
	public List<MembersDTO> list2(String users_id) {
		return membersDao.list2(users_id);
	}

	@Override
	public int countList(String users_id) {
		return membersDao.countList(users_id);
	}


}
