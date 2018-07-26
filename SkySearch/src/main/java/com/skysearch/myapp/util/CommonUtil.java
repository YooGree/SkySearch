package com.skysearch.myapp.util;

import java.util.UUID;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class CommonUtil {
	
	
	
	public String getUniqueSequence() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replaceAll("-", "");
	}
	
	public String PasswordEncoderGenerator(String password) {
    	String hashedPassword = "";
    	if(password != null){
        	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    		hashedPassword = passwordEncoder.encode(password);
    	}
		return hashedPassword;
    }
}
