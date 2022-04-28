package com.chickens.admin.brand;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "Không tìm thấy Brand")
public class BrandNotFoundRestException extends Exception {

}
