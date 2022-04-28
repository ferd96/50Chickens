package com.shopme.admin.user;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.chickens.admin.user.RoleRepository;
import com.chickens.common.entity.Role;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false) // k k thực thi lại để tạo bảng mới
public class RoleRepositoryTests {
	@Autowired
	private RoleRepository repository;

	
	  @Test public void testCreateFirstRole() { Role roleAdmin = new Role("Admin",
	  "manager everything"); Role saveRole = repository.save(roleAdmin);
	  
	  assertThat(saveRole.getId()).isGreaterThan(0); }
	 

	@Test
	public void testCreateRestRoles() {

		Role roleSalesperson = new Role("Salesperson",
				"manage product price, customers, shipping, orders and sales report");
		Role roleEditor = new Role("Editor", "manage categories,brands,products, adrticles and menus");
		Role roleShipper = new Role("Shipper", "new products, view order, update order status");
		Role roleAssistant = new Role("Assistant", "manage questions and reviews");
		repository.saveAll(List.of(roleAssistant, roleEditor, roleSalesperson, roleShipper));
	}

}
