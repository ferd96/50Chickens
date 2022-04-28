package com.shopme.admin.user;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.chickens.admin.user.UserRepository;
import com.chickens.common.entity.Role;
import com.chickens.common.entity.User;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class UserRepositoryTests {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private TestEntityManager entityManager;

	
	  
	  @Test public void testCreateUser() { Role roleAdmin=
	  entityManager.find(Role.class, 2); User userTanTdUser = new
	  User("vu@fpt.com","vu2001","vu","phan van");
	  userTanTdUser.addRole(roleAdmin);
	  
	  User saveUser= userRepository.save(userTanTdUser);
	  assertThat(saveUser.getId()).isGreaterThan(0); }
	  
	 
	@Test
	public void testCreateUserwithTwoRoles() {
		User TeodUser = new User("tan@fpt.com", "tam2222", "teo", "tran van");

		Role roleEditoRole = new Role(3);
		Role roleAssistant = new Role(2);

		TeodUser.addRole(roleAssistant);
		TeodUser.addRole(roleEditoRole);

		User saveUser = userRepository.save(TeodUser);
		assertThat(saveUser.getId()).isGreaterThan(0);
	}

	
	  @Test public void testListAllUsers() { Iterable<User> listUsers =
	  userRepository.findAll(); listUsers.forEach(user ->System.out.println(user));
	  
	  }
	 

	
	  @Test public void testGetUserId() { User userTan =
	  userRepository.findById(5).get(); System.out.println(userTan);
	  assertThat(userTan).isNotNull();
	  
	  }
	 

	  @Test public void testUpdateDetails() { User user =
	  userRepository.findById(5).get(); user.setEnabled(true);
	  user.setEmail("tantdps12@fpt.con"); userRepository.save(user); }
	 

	
	  @Test public void testUpdateUserRoles() { User user =
	  userRepository.findById(8).get(); Role roleEditor = new Role(2); Role
	  roleSelespreson = new Role(4);
	  
	  user.getRoles().remove(roleEditor); user.addRole(roleSelespreson);
	  userRepository.save(user); }
	 
	
	  @Test public void testDeleteUser() { Integer id = 5;
	  userRepository.deleteById(id); }
	 
}
