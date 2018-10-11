package com.example.spring05.service.message;

import com.example.spring05.model.message.dto.MessageDTO;

public interface MessageService {
	public void addMessage(MessageDTO dto);
	public MessageDTO readMessage(String userid, int mid);
}
