package com.chickens.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan({"com.chickens.common.entity","com.chickens.admin.user"})
public class ChickensBackEndApplication {

	public static void main(String[] args) {
		SpringApplication.run(ChickensBackEndApplication.class, args);
	}

}
