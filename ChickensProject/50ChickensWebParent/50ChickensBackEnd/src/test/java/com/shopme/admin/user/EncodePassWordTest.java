package com.shopme.admin.user;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncodePassWordTest {

	@Test
	public void TestCodePassWord() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String pass = "teo12";
		String pass2= "$10$vRmlKerF1wbNmsVLpMEMB.dAhXOR7TPyGSjHbssTTAdeA7B0KJZyy";
	  String hi=	encoder.encode(pass);
	    boolean a = encoder.matches(pass, pass2);
	    assertThat(a).isTrue();
	}
}
