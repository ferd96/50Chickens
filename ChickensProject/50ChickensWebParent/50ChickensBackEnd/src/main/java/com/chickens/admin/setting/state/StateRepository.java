package com.chickens.admin.setting.state;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.chickens.common.entity.Country;
import com.chickens.common.entity.State;

public interface StateRepository extends CrudRepository<State, Integer> {
	
	public List<State> findByCountryOrderByNameAsc(Country country);
}
