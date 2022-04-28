package com.shopme.paypal;

import java.util.Arrays;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.chickens.checkout.paypal.PayPalOrderResponse;

public class PayPalApiTests {
	private static final String BASE_URL = "https://api.sandbox.paypal.com";
	private static final String GET_ORDER_API = "/v2/checkout/orders/";
	private static final String CLIENT_ID = "AeX-bW2FEN5TV_NY58rv_f-XAbikmco3W18gcG_0WLYqQQUyTglbtfevf8zf9AwMAZ1dpjrq5FBCGuUy";
	private static final String CLIENT_SECRET = "ELliZ3cTmKzd0FMTNJ72PioLErC5tySvSYa6iXMKUCefq25-SXoV76hgUfYLvk-nYmdnY_uIc3F2q0lx";
	
	@Test
	public void testGetOrderDetails() {
		String orderId = "3L073630YA589164Y";
	
		String requestURL = BASE_URL + GET_ORDER_API + orderId;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.add("Accept-Language", "en_US");
		headers.setBasicAuth(CLIENT_ID, CLIENT_SECRET);
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(headers);
		RestTemplate restTemplate = new RestTemplate();
		
		ResponseEntity<PayPalOrderResponse> response = restTemplate.exchange(
				requestURL, HttpMethod.GET, request, PayPalOrderResponse.class);
		PayPalOrderResponse orderResponse = response.getBody();

		System.out.println("Order ID: " + orderResponse.getId());
		System.out.println("Validated: " + orderResponse.validate(orderId));
		
	}
	
}
