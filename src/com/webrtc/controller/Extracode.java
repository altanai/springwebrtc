
/*
altanai
2014
 */
package com.webrtc.controller;

/**
 * @author altanai
 *
 */
public class Extracode {

	

	// redirect to login page  	
/*	@RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView addlogin(@ModelAttribute("command")  UserdetailBean userdetailBean,
			BindingResult result) {
		
	Map<String, Object> model = new HashMap<String, Object>();	
	if( userdetailBean.getPrivateIdentity()==null ){
	model.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
	}
	else{
	model.put("userdetail", prepareBeanUserdetail(userdetailService.getUserdetail(userdetailBean.getPrivateIdentity())));
	model.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
	}
	return new ModelAndView("login", model);
	}*/
	
	/*//perform login action
	@RequestMapping(value = "/dologin", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView dologin(@ModelAttribute("command")  UserdetailBean userdetailBean,
			BindingResult result) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<Userdetail> bean= userdetailService.loginUserdetail(userdetailBean.getPrivateIdentity(), userdetailBean.getPassword());
		
		if(bean != null)
		{
			//check with presnece for session( presence and loggein ) information
			log.info("checking presence status and loggein before signin ");
			Presence presencebean_login =  presenceService.getPresence(userdetailBean.getPrivateIdentity());
			
			if(presencebean_login!=null){
				String p_status=presencebean_login.getPresencestatus();
				String p_loggedin=presencebean_login.getPresenceloggedin();
				
				System.out.println(" Presenec status  "+ p_status + " "+ p_loggedin );
				
				if(p_status.equalsIgnoreCase("online") && p_loggedin.equalsIgnoreCase("yes")){
					log.info("login bean error- session already active in another tab ");
					return new ModelAndView("redirect:confirmlogin.html");
				}
				else if(p_status.equalsIgnoreCase("online") && p_loggedin.equalsIgnoreCase("no")){
					log.info("login bean error- presnece online ");
					return new ModelAndView("redirect:confirmlogin.html");
				}
				else if(p_status.equalsIgnoreCase("offline") && p_loggedin.equalsIgnoreCase("yes")){
					log.info("login bean error- presnec not working  ");
					return new ModelAndView("redirect:confirmlogin.html");
				}
				else{
					log.info("presnece offline and loggedin = no ; login bean =  ok ");
					model.put("login", prepareListofBeanUserdetail(userdetailService.loginUserdetail(userdetailBean.getPrivateIdentity(), userdetailBean.getPassword())));
					return new ModelAndView("redirect:confirmlogin.html");
				}
			}
			
			else{
				log.info("presence information doesnt exists");
				System.out.println(" Presence information doesnt exists ");
				model.put("login", prepareListofBeanUserdetail(userdetailService.loginUserdetail(userdetailBean.getPrivateIdentity(), userdetailBean.getPassword())));
				
				ModelAndView modelAndView = new ModelAndView();
				        modelAndView.setViewName("dashboard.html");
						return modelAndView;
			}
	
		}
		
		else{			
			log.info("login bean error- invalid user credentails ");
			return new ModelAndView("redirect:login.html", model);
		}
	}
	
	for validation of login
	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public ModelAndView loginError(@ModelAttribute("command")  UserdetailBean userdetailBean,
			BindingResult result,Model model) {
		
	Map<String, Object> modelMap = new HashMap<String, Object>();
	Map<String, String> modelError = new HashMap<String, String>();
	
	if( userdetailBean.getPrivateIdentity()==null ){
		modelMap.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
		modelError.put("errorMsg","Login id and Password do not match.");
	}
	else{
		modelMap.put("userdetail", prepareBeanUserdetail(userdetailService.getUserdetail(userdetailBean.getPrivateIdentity())));
		modelMap.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
		modelError.put("errorMsg","Login id and Password do not match.");
	}
	model.addAttribute("Details", modelMap);
	model.addAttribute("errorDetails", modelError);
	return new ModelAndView("login", "loginDetails", model);

	
	}
	*/
	/* validate login 
	@RequestMapping(value = "/dologinvalidate", method = RequestMethod.GET)
	public ModelAndView loginvalidate(@ModelAttribute("command")  UserdetailBean userdetailBean,
			BindingResult result , HttpServletRequest request) {
		
		LoginValidator validator =new LoginValidator();
		validator.validateLogin(userdetailBean, result);
		Map<String, Object> model = new HashMap<String, Object>();
		
		if(result.hasErrors()){
			System.out.println("*********Login and password input error**************************");		
			return new ModelAndView("login","command",userdetailBean);
		}
		List<Userdetail> bean= userdetailService.loginUserdetail(userdetailBean.getPrivateIdentity(), userdetailBean.getPassword());
	    
		if(bean != null)
		{
	    	System.out.println("********Login and password match ***********");
	    	//return new ModelAndView("redirect:dashboard.html?sipuri="+userdetailBean.getPrivateIdentity()+"&PrivateIdentity="+userdetailBean.getPrivateIdentity(),model);
	    	//return new ModelAndView("redirect:dashboard.html",model);
	
	    	allinoneBean.setSipuri(userdetailBean.getPrivateIdentity());
	    	allinoneBean.setPrivateIdentity(userdetailBean.getPrivateIdentity());
	    	
			ModelAndView modelAndView = new ModelAndView();
	        modelAndView.setViewName("redirect:dashboard.html");

	        return modelAndView ;
		}
		else
		{
			System.out.println("**********login id and password do not match********");
			return new ModelAndView("redirect:loginError.html");
			
		}


	}*/
	
	
	
	
	/*
	 * ---------------------------------------------------section for employees-------------------------------------
	 */
	
/*	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveEmployee(@ModelAttribute("command") EmployeeBean employeeBean, 
			BindingResult result) {	
		Employee employee = prepareModel(employeeBean);
		employeeService.addEmployee(employee);
		return new ModelAndView("redirect:/add.html");
	}

	@RequestMapping(value="/employees", method = RequestMethod.GET)
	public ModelAndView listEmployees() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("employees",  prepareListofBean(employeeService.listEmployeess()));
		return new ModelAndView("employeesList", model);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addEmployee(@ModelAttribute("command")  EmployeeBean employeeBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("employees",  prepareListofBean(employeeService.listEmployeess()));
		return new ModelAndView("addEmployee", model);
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView editEmployee(@ModelAttribute("command")  EmployeeBean employeeBean,
			BindingResult result) {
		employeeService.deleteEmployee(prepareModel(employeeBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("employee", null);
		model.put("employees",  prepareListofBean(employeeService.listEmployeess()));
		return new ModelAndView("addEmployee", model);
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(@ModelAttribute("command")  EmployeeBean employeeBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("employee", prepareEmployeeBean(employeeService.getEmployee(employeeBean.getId())));
		model.put("employees",  prepareListofBean(employeeService.listEmployeess()));
		return new ModelAndView("addEmployee", model);
	}*/
	
	
	
}

