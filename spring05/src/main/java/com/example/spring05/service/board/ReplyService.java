package com.example.spring05.service.board;

import java.util.List;

import com.example.spring05.model.board.dto.ReplyDTO;

public interface ReplyService {
	
	public List<ReplyDTO> list(int bno);
	public int count(int bno);
	public void create(ReplyDTO dto);

}
