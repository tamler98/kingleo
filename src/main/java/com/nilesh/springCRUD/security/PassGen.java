package com.nilesh.springCRUD.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PassGen {
	public static void main(String[] args) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		System.out.println(encoder.encode("123"));
		System.out.println(encoder.encode("456"));
	}
}

//$2a$10$bZMN/.2EtAr3R/Q4Qv5QH.HOkFIjZ5HUWUDvVysKeccETeLYZJSBu
//$2a$10$o17vDWmUp63GQPuWMhTbxeY9woH/gdLfokhYmsQRMdVlOX9ul8dgm