package com.webrtc.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.webrtc.bean.UserdetailBean;

@Component
public class LoginValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return UserdetailBean.class.isAssignableFrom(clazz);
	}

	
	public void validateLogin(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "privateIdentity", "privateIdentity.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.required");
		
		
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		
	}

	
	
}
