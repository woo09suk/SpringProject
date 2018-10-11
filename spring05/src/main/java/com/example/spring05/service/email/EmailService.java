package com.example.spring05.service.email;

import com.example.spring05.model.email.EmailDTO;

public interface EmailService {
	public void sendMail(EmailDTO dto);
}
