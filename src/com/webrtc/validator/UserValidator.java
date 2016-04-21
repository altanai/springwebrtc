package com.webrtc.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.webrtc.bean.UserdetailBean;

@Component
public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return UserdetailBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "privateIdentity", "privateIdentity.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "displayName", "displayName.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "publicIdentity", "publicIdentity.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "realm", "realm.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "secretQuestion", "secretQuestion.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "secretAnswer", "secretAnswer.required");
	
		
		
	}
	
}
