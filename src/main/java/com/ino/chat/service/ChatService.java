package com.ino.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.chat.dao.ChatDAO;

@Service
public class ChatService {
	
	@Autowired ChatDAO dao;

}
