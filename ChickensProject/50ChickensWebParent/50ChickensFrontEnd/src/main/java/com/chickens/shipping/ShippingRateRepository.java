package com.chickens.shipping;

import org.springframework.data.repository.CrudRepository;

import com.chickens.common.entity.Country;
import com.chickens.common.entity.ShippingRate;

public interface ShippingRateRepository extends CrudRepository<ShippingRate, Integer> {
	
	public ShippingRate findByCountryAndState(Country country, String state);
}
