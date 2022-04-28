package com.chickens.setting;

import org.springframework.data.repository.CrudRepository;

import com.chickens.common.entity.Currency;

public interface CurrencyRepository extends CrudRepository<Currency, Integer> {

}
