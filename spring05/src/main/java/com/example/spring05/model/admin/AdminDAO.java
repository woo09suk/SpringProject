package com.example.spring05.model.admin;

import com.example.spring05.model.member.dto.MemberDTO;

public interface AdminDAO {
	public String loginCheck(MemberDTO dto);

}
