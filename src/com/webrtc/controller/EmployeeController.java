package com.webrtc.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.webrtc.bean.AllinoneBean;
import com.webrtc.bean.CalllogBean;
import com.webrtc.bean.ConferenceDetailBean;
import com.webrtc.bean.ContactBean;
import com.webrtc.bean.EmployeeBean;
import com.webrtc.bean.OpenidBean;
import com.webrtc.bean.UserdetailBean;
import com.webrtc.bean.GeolocationBean;
import com.webrtc.bean.PresenceBean;
import com.webrtc.model.Calllog;
import com.webrtc.model.Contact;
import com.webrtc.model.Employee;
import com.webrtc.model.Notification;
import com.webrtc.model.Openid;
import com.webrtc.model.Userdetail;
import com.webrtc.model.Geolocation;
import com.webrtc.model.Presence;
import com.webrtc.service.CallLogService;
import com.webrtc.service.ConferenceDetailService;
import com.webrtc.service.ContactService;
import com.webrtc.service.EmailmappingService;
import com.webrtc.service.EmployeeService;
import com.webrtc.service.NotificationService;
import com.webrtc.service.OpenidService;
import com.webrtc.service.UserdetailService;
import com.webrtc.service.GeolocationService;
import com.webrtc.service.PresenceService;
import com.webrtc.service.gmail;
import com.webrtc.validator.LoginValidator;
import com.webrtc.validator.UserValidator;

import java.security.Principal;




@Controller
/*@RequestMapping("/addUserdetail.htm")
*/
@Scope("session")
//@SessionAttributes("userdetailBean")
public class EmployeeController  {


	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private OpenidService openidService;
	@Autowired
	private UserdetailService userdetailService;
	@Autowired
	private GeolocationService geolocationService;
	@Autowired
	private ContactService contactService;
	@Autowired
	private PresenceService presenceService;
	@Autowired
	private ConferenceDetailService conferenceDetailService;
	@Autowired
	private UserValidator userValidator;
	@Autowired 
	private NotificationService notificationSerivce;
	@Autowired 
	private CallLogService calllogService;
	@Autowired
	private EmailmappingService emailmappingService;
	
	
	AllinoneBean allinoneBean= new AllinoneBean();
	
	 /* Get actual class name to be printed on */
	  static Logger log = Logger.getLogger(
			  EmployeeController.class.getName());

	  
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("index");
	}
	
	
	@RequestMapping(value = "/advertisement", method = RequestMethod.GET)
	public ModelAndView advertisement() {
		return new ModelAndView("advertisement");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	
	/*
	 * ---------------------------------------------------section for employees-------------------------------------
	 */
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
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
	}
	
	/*
	 * ------------------------------------------------section for Openid----------------------------------------------
	 */
	//Save openid values to db
	@RequestMapping(value = "/saveopenid", method = RequestMethod.POST)
	public ModelAndView saveOpenid(@ModelAttribute("command") OpenidBean openidBean, 
			BindingResult result) {		
		Openid openid = prepareModelOpenid(openidBean);	
		openidService.addOpenid(openid);
		return new ModelAndView("redirect:/addopenid.html?sipuri="+openid.getOpenidsipuri());
	}

	@RequestMapping(value = "/deleteopenid", method = RequestMethod.GET)
	public ModelAndView editOpenid(@ModelAttribute("command")  OpenidBean openidBean,
			BindingResult result) {
		openidService.deleteOpenid(prepareModelOpenid(openidBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("openid", null);
		model.put("openids",  prepareListofBeanOpenid(openidService.listOpenidss()));
		return new ModelAndView("addOpenid", model);
	}

	@RequestMapping(value = "/editopenid", method = RequestMethod.GET)
	public ModelAndView deleteOpenid(@ModelAttribute("command")  OpenidBean openidBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("openid", prepareBeanOpenid(openidService.getOpenid(openidBean.getSipuri())));
		model.put("openids",  prepareListofBeanOpenid(openidService.listOpenidss()));
		return new ModelAndView("addOpenid", model);
	}

	//Open the openid page with existing values 
	@RequestMapping(value = "/addopenid", method = RequestMethod.GET)
	public ModelAndView addOpenid(@ModelAttribute("command")  OpenidBean openidBean,
			BindingResult result) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		if( openidBean.getSipuri()!=null ){
			model.put("openid", prepareBeanOpenid(openidService.getOpenid(openidBean.getSipuri())));
		}
		model.put("openids",  prepareListofBeanOpenid(openidService.listOpenidss()));
	
		return new ModelAndView("addOpenid", model);
	}
	
	
	
	/*---------------------------------------------User details ---------------------------------------------*/
	
	/*
	 * user details 
	 */
		@RequestMapping(value = "/deleteuserdetail", method = RequestMethod.GET)
	public ModelAndView editUserdetail(@ModelAttribute("command")  UserdetailBean userdetailBean,
				BindingResult result) {
			userdetailService.deleteUserdetail(prepareModelUserdetail(userdetailBean));
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("userdetail", null);
			model.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
			return new ModelAndView("adduserdetail", model);
		}

		@RequestMapping(value = "/edituserdetail", method = RequestMethod.GET)
	public ModelAndView deleteUserdetail(@ModelAttribute("command")  UserdetailBean userdetailBean,
				BindingResult result) {
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("userdetail", prepareBeanUserdetail(userdetailService.getUserdetail(userdetailBean.getPrivateIdentity())));
			model.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
			return new ModelAndView("adduserdetail", model);
		}
		
@RequestMapping(value = "/saveuserdetail", method = RequestMethod.POST)
	public ModelAndView saveUserdetail(@ModelAttribute("command") UserdetailBean userdetailBean, 
			BindingResult result) {
	UserValidator validator =new UserValidator();
	validator.validate(userdetailBean, result);
	
	if(result.hasErrors()){
		return new ModelAndView("addUserdetail","command",userdetailBean);
	}	
	
	else
	{
		Userdetail userdetail = prepareModelUserdetail(userdetailBean);
		userdetailService.addUserdetail(userdetail);
		return new ModelAndView("redirect:/adduserdetail.html?privateIdentity="+userdetailBean.getPrivateIdentity());
	}
}
	
	@RequestMapping(value="/userdetail", method = RequestMethod.GET)
	public ModelAndView listUserdetail() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("userdetail",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
		return new ModelAndView("userdetailList", model);
	}

	@RequestMapping(value = "/adduserdetail", method = RequestMethod.GET)
	public ModelAndView addUserdetail(@ModelAttribute("command")  UserdetailBean userdetailBean,
			BindingResult result) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		if( userdetailBean.getPrivateIdentity()==null ){
		model.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
		}
		else{
		model.put("userdetail", prepareBeanUserdetail(userdetailService.getUserdetail(userdetailBean.getPrivateIdentity())));
		model.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
		}
		return new ModelAndView("addUserdetail", model);

	}

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
	
	//perform login action
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
				//		modelAndView.addObject("where", "maindashboard");
				//		modelAndView.addObject("sipuri", userdetailBean.getPrivateIdentity());
				//		modelAndView.addObject("PrivateIdentity", userdetailBean.getPrivateIdentity());

						return modelAndView;

			//	return new ModelAndView("redirect:dashboard.html?sipuri="+userdetailBean.getPrivateIdentity()+"&PrivateIdentity="+userdetailBean.getPrivateIdentity(),model);
			//	dashboard_allinone("sipuri="+userdetailBean.getPrivateIdentity()+"&PrivateIdentity="+userdetailBean.getPrivateIdentity(),model);
			//	return new ModelAndView("redirect:dashboard.html??sipuri="+userdetailBean.getPrivateIdentity()+"&PrivateIdentity="+userdetailBean.getPrivateIdentity(),model);
			}
	
		}
		
		else{			
			log.info("login bean error- invalid user credentails ");
			return new ModelAndView("redirect:login.html", model);
		}
	}
	
	/*for validation of login*/
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
	
	/* show login page*/
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
	        
	        
		//	modelAndView.addObject("where", "maindashboard");
		//	modelAndView.addObject("sipuri", userdetailBean.getPrivateIdentity());
		//	modelAndView.addObject("PrivateIdentity", userdetailBean.getPrivateIdentity());
		//  request.getSession().setAttribute("PrivateIdentity", userdetailBean.getPrivateIdentity()); 

	    return modelAndView ;
		}
		else
		{
			System.out.println("**********login id and password do not match********");
			return new ModelAndView("redirect:loginError.html");
			
		}


	}

/* do logout action*/

	@RequestMapping(value = "/dologout", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView dologout() {
		System.out.println(" Logging out of controller ");	
		log.info("logout user from webrtc client ");
		return new ModelAndView("Last");
	}
	
	
	/*
	 * -----------------------------Empty sipml5 code---------------------
	 */
	@RequestMapping(value = "/call", method = RequestMethod.GET)
	public ModelAndView call(@ModelAttribute("command") UserdetailBean userdetailBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("userdetail", prepareBeanUserdetail(userdetailService.getUserdetail(userdetailBean.getPrivateIdentity())));
		model.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));
		return new ModelAndView("call", model);
	}

	@RequestMapping(value = "/expert", method = RequestMethod.GET)
	public ModelAndView expert() {
		return new ModelAndView("expert");
	}
	
	/*
	 * -----------------------------Geolocation---------------------------
	 */
	@RequestMapping(value = "/geolocationtogether", method = RequestMethod.GET)
	public ModelAndView geolocationtogether() {
		return new ModelAndView("geolocationtogether");
	}

	@RequestMapping(value = "/savegeolocation", method = RequestMethod.POST)
	public ModelAndView saveGeolocation(@ModelAttribute("command") GeolocationBean geolocationBean, 
			BindingResult result) {
		
		Geolocation geolocation = prepareModelGeolocation(geolocationBean);
		geolocationService.addGeolocation(geolocation);
		return new ModelAndView("redirect:/addgeolocation.html?sipuri="+geolocation.getGeosipuri());

	}
	
	@RequestMapping(value="/geolocation", method = RequestMethod.GET)
	public ModelAndView listGeolocation() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("geolocation",  prepareListofBeanGeolocation(geolocationService.listGeolocations()));
		return new ModelAndView("geolocationList", model);
	}

	@RequestMapping(value = "/addgeolocation", method = RequestMethod.GET)
	public ModelAndView addGeolocation(@ModelAttribute("command")  GeolocationBean geolocationBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		if( geolocationBean.getSipuri()==null ){
			System.out.println("Geolocation  bean : sipuri is null  no records found ");
		model.put("geolocations",  prepareListofBeanGeolocation(geolocationService.listGeolocations()));
		}
		else{
			Geolocation geolocationTemp= geolocationService.getGeolocation(geolocationBean.getSipuri());
			if(geolocationTemp!=null){
				model.put("geolocation", prepareBeanGeolocation(geolocationTemp));
			}
		model.put("geolocations",  prepareListofBeanGeolocation(geolocationService.listGeolocations()));
		}

		return new ModelAndView("addGeolocation", model);
	}
		
	@RequestMapping(value = "/deletegeolocation", method = RequestMethod.GET)
	public ModelAndView editGeolocation(@ModelAttribute("command")  GeolocationBean geolocationBean,
			BindingResult result) {
		geolocationService.deleteGeolocation(prepareModelGeolocation(geolocationBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("geolocation", null);
		model.put("geolocation",  prepareListofBeanGeolocation(geolocationService.listGeolocations()));
		return new ModelAndView("addGeolocation", model);
	}
	
	@RequestMapping(value = "/editgeolocation", method = RequestMethod.GET)
	public ModelAndView deleteGeolocation(@ModelAttribute("command")  GeolocationBean geolocationBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("geolocation", prepareBeanGeolocation(geolocationService.getGeolocation(geolocationBean.getSipuri())));
		model.put("geolocations",  prepareListofBeanGeolocation(geolocationService.listGeolocations()));
		return new ModelAndView("addGeolocation", model);
	}
	
	/*
	 * ------------------------------Contact---------------------- 
	 */

	@RequestMapping(value = "/deletecontact", method = RequestMethod.GET)
	public ModelAndView editContact(@ModelAttribute("command")  ContactBean contactBean,
			BindingResult result) {
		contactService.deleteContact(prepareModelContact(contactBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("contact", null);
		model.put("contacts",  prepareListofBeanContact(contactService.listContactss()));
		return new ModelAndView("addContact", model);
	}

	@RequestMapping(value = "/editcontact", method = RequestMethod.GET)
	public ModelAndView deleteContact(@ModelAttribute("command")  ContactBean contactBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("contact", prepareBeanContact(contactService.getContact(contactBean.getSipuri())));
		model.put("contacts",  prepareListofBeanContact(contactService.listContactss()));
		return new ModelAndView("addContact", model);
	}
	
@RequestMapping(value = "/savecontact", method = RequestMethod.POST)
public ModelAndView saveContact(@ModelAttribute("command") ContactBean contactBean, 
		BindingResult result) {
	Contact contact = prepareModelContact(contactBean);
	contactService.addContact(contact);
	return new ModelAndView("redirect:/addcontact.html?sipuri="+contactBean.getSipuri());
}

@RequestMapping(value="/contact", method = RequestMethod.GET)
public ModelAndView listContact() {
	Map<String, Object> model = new HashMap<String, Object>();
	model.put("contact",  prepareListofBeanContact(contactService.listContactss()));
	return new ModelAndView("ContactsList", model);
}

@RequestMapping(value = "/addcontact", method = RequestMethod.GET)
public ModelAndView addContact(@ModelAttribute("command")  ContactBean contactBean,
		BindingResult result) {
	Map<String, Object> model = new HashMap<String, Object>();
	
	if( contactBean.getSipuri()==null ){
		System.out.println("Contact bean : sipuri is null  no records found ");
	model.put("contacts",  prepareListofBeanContact(contactService.listContactss()));
	}
	else{
	model.put("contact",  prepareBeanContact(contactService.getContact(contactBean.getSipuri())));
	model.put("contacts",  prepareListofBeanContact(contactService.listContactss()));
	}
	
	return new ModelAndView("addContact", model);	
}
	

/*------------------------------------------Conferencing---------------------------------------*/	
@RequestMapping(value = "/conferencing", method = RequestMethod.GET)
public ModelAndView conference(@ModelAttribute("command")  ContactBean contactBean,
		BindingResult result) {
Map<String, Object> model = new HashMap<String, Object>();
	
	if( contactBean.getSipuri()==null ){
	model.put("contacts",  prepareListofBeanContact(contactService.listContactss()));
	}
	else{
	model.put("contact",  prepareBeanContact(contactService.getContact(contactBean.getSipuri())));
	model.put("contacts",  prepareListofBeanContact(contactService.listContactss()));
	}
	
	return new ModelAndView("conferencing", model);	

}

@RequestMapping(value = "/addConference", method = RequestMethod.POST)
public @ResponseBody String confInvite(@RequestParam("members") String members,@RequestParam("conferenceName") String conferenceName,@RequestParam("hostName") String hostName)
{
	System.out.println(members+" nnmae"+ conferenceName);
	ConferenceDetailBean confDetail = new ConferenceDetailBean();
	confDetail.setMembers(members.split("$"));
	confDetail.setConferenceName(conferenceName);
	confDetail.setHost(hostName);
	conferenceDetailService.addConferenceDetail(confDetail);
	return "Success";
	
}


/*
 * -----------------------------Offline mail module---------------------
 * 
 */

@RequestMapping(value = "/offlinemailgmail", method = RequestMethod.POST)
public  @ResponseBody String gmail(@RequestParam("sipuri") String sipuri,@RequestParam("message") String message)
	 {
	System.out.println("sipuri++"+sipuri+"message"+message);
	
	Openid openid=new Openid();
	openid=emailmappingService.getopenidDetails(sipuri);
	
	String gmailidreceiver=openid.getOpenidgoogle();
	
	String gmailidsender="tcscns@gmail.com";
	String gmailidpassword="tcs@123456";
	String gmailsubject = "WebRTC offline message ";
	gmail gm=new gmail();
	gm.sendemail(gmailidsender,gmailidpassword, gmailidreceiver,gmailsubject , message);
	return "Success";
}

/*---------------------------------------Presence----------------------------------------------*/
@RequestMapping(value = "/editepresence", method = RequestMethod.GET)
public ModelAndView editPresence(@ModelAttribute("command")  PresenceBean presenceBean,
		BindingResult result) {
	presenceService.deletePresence(prepareModelPresence(presenceBean));
	Map<String, Object> model = new HashMap<String, Object>();
	model.put("presence", null);
	model.put("presences",  prepareListofBeanPresence(presenceService.listPresencess()));
	return new ModelAndView("addPresence", model);
}

@RequestMapping(value = "/deletepresence", method = RequestMethod.GET)
public ModelAndView deletePresence(@ModelAttribute("command")  PresenceBean presenceBean,
		BindingResult result) {
	Map<String, Object> model = new HashMap<String, Object>();
	model.put("presence", prepareBeanPresence(presenceService.getPresence(presenceBean.getSipuri())));
	model.put("presences",  prepareListofBeanPresence(presenceService.listPresencess()));
	return new ModelAndView("addPresence", model);
}

//add presnece values to backend database
@RequestMapping(value = "/savepresence", method = RequestMethod.POST)
public ModelAndView savePresence(@ModelAttribute("command") PresenceBean presenceBean, 
	BindingResult result) {
	Presence presence = prepareModelPresence(presenceBean);
	
	if( presenceBean.getSipuri()!=null ){
	presenceService.addPresence(presence);
	}
	
return new ModelAndView("redirect:/addpresence.html?sipuri="+presenceBean.getSipuri());
}

@RequestMapping(value="/presence", method = RequestMethod.GET)
public ModelAndView listPresence() {
Map<String, Object> model = new HashMap<String, Object>();
model.put("contact",  prepareListofBeanContact(contactService.listContactss()));
return new ModelAndView("PresencesList", model);
}

@RequestMapping(value = "/addpresence", method = RequestMethod.GET)
public ModelAndView addPresence(@ModelAttribute("command")  PresenceBean presenceBean,
	BindingResult result) {
Map<String, Object> model = new HashMap<String, Object>();

if( presenceBean.getSipuri()==null ){
	System.out.println("Presenec bean : sipuri is null  no records found ");
model.put("presences",  prepareListofBeanPresence(presenceService.listPresencess()));
}
else{
	System.out.println("Presenec bean : sipuri "+presenceBean.getSipuri());
model.put("presence",  prepareBeanPresence(presenceService.getPresence(presenceBean.getSipuri())));
model.put("presences",  prepareListofBeanPresence(presenceService.listPresencess()));
}
return new ModelAndView("addPresence", model);	
}

/* ----------------------------------------------Notification -----------------------*/
@RequestMapping(value="Notifier.html",method=RequestMethod.GET)
public String showNotification()
{
	return "Notifier";
}
@RequestMapping(value="getFreshNotifications.html", method=RequestMethod.POST)
public @ResponseBody String getNotifications(@RequestParam("userId") String userId){

	List<Notification> notificationList =notificationSerivce.getAllNotifications(userId);
	JSONObject jsonResponse=new JSONObject();
	try {
		jsonResponse.put("Result", "OK");
		ArrayList<JSONObject> jsonNotifications= new ArrayList<JSONObject>();
		for(Notification notify: notificationList)
		{
			String notificationDetail="";
			JSONObject jsonNotification=new JSONObject();
			jsonNotification.put("ID",notify.getNotificationId());
			jsonNotification.put("TYPE",notify.getNotificationType());
			if(notify.getNotificationType().equalsIgnoreCase("VoiceMail")){
				notificationDetail=" left a new Voice-Mail for you at "+notify.getNotificationTON();
			}
			else if(notify.getNotificationType().equalsIgnoreCase("Conference")){
				notificationDetail=" has invited you to join a Conference at "+notify.getNotificationTON();
			}
			jsonNotification.put("DETAILS",notify.getNotificationSender()+notificationDetail);
			
			jsonNotifications.add(jsonNotification);
		}
		jsonResponse.accumulate("Notifications", jsonNotifications);
		
	}catch (JSONException e) {
		e.printStackTrace();
	}
	return jsonResponse.toString();
}


/*
 * ------------------------------------------------section for CallLog----------------------------------------------
 */
//Open the calllog page with existing values 
@RequestMapping(value = "/savecalllog", method = RequestMethod.POST)
public ModelAndView savecalllog(@ModelAttribute("command") CalllogBean calllogBean, 
		BindingResult result) {		
	Calllog calllog = prepareModelCalllog(calllogBean);	
	calllogService.addCall(calllog);
	return new ModelAndView("redirect:/addcalllog.html");
}

//Save calllog values to db
@RequestMapping(value = "/addcalllog", method = RequestMethod.GET)
public ModelAndView addCalllog(@ModelAttribute("command")  CalllogBean calllogBean,
		BindingResult result) {
	
	Map<String, Object> model = new HashMap<String, Object>();
	
	if( !(calllogBean.getCallee()==null || calllogBean.getCaller()==null || calllogBean.getDate()==null) ){
		model.put("calllog", prepareBeanCalllog(calllogService.getCall(calllogBean.getId())));
	}
	model.put("calllogs",  prepareListofBeanCalllog(calllogService.listCalls()));

	return new ModelAndView("addCallLog", model);
}


/*------------------------------------------------Dashboard----------------------------------*/
	@RequestMapping(value = "/dashboard", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView dashboard_allinone(@ModelAttribute("command") AllinoneBean allinoneBean2,
			BindingResult result ) {
	
		
		Map<String, Object> model = new HashMap<String, Object>();
        //allinoneBean.setSipuri(allinoneBean.getPrivateIdentity());
        System.out.println("Allinone bean sipuri "+ allinoneBean.getSipuri());

        //userdetail
		Userdetail userdetailTemp= userdetailService.getUserdetail(allinoneBean.getPrivateIdentity());
		if(userdetailTemp!=null){
			model.put("userdetail", prepareBeanUserdetail(userdetailTemp));
			System.out.println("Userdetails  "+userdetailTemp.getUserdetaildisplayName()+userdetailTemp.getUserdetailprivateIdentity()+userdetailTemp.getUserdetailpublicIdentity()+userdetailTemp.getUserdetailrealm()+ userdetailTemp.getUserdetailpassword());
		}
		model.put("userdetails",  prepareListofBeanUserdetail(userdetailService.listUserdetailss()));

		//openid
		Openid openidTemp= openidService.getOpenid(allinoneBean.getSipuri());
		if(openidTemp!=null){
			model.put("openid", prepareBeanOpenid(openidTemp));
		    System.out.println(" Openid "+ openidTemp.getOpenidfacebook()+ openidTemp.getOpenidgoogle()+ openidTemp.getOpenidyahoo());
		}
		model.put("openids",  prepareListofBeanOpenid(openidService.listOpenidss()));
 		
        //geolocation		
		Geolocation geolocationTemp= geolocationService.getGeolocation(allinoneBean.getSipuri());
		if(geolocationTemp!=null){
			model.put("geolocation", prepareBeanGeolocation(geolocationTemp));
	        System.out.println(	" Geolocation "+ geolocationTemp.getGeoLatitude()+ geolocationTemp.getGeoLongitude());
		}		
		model.put("geolocations",  prepareListofBeanGeolocation(geolocationService.listGeolocations()));
		
        //contact		
		Contact contactTemp= contactService.getContact(allinoneBean.getSipuri());
		if(contactTemp!=null){
			model.put("contact", prepareBeanContact(contactTemp));
			System.out.println(" Contact "+contactTemp.getContactfriend());
		}		
		model.put("contacts",  prepareListofBeanContact(contactService.listContactss()));	
		
		return new ModelAndView("Dashboard",model);
	}
		
	
	/*-------------------------------Ajax content for Openid ---------------------------*/
	@RequestMapping(value="/addopenidajax",method=RequestMethod.POST)
	public @ResponseBody String addOpenidAjax(@ModelAttribute(value="openidBean") OpenidBean openidBean, BindingResult result ){

		String returnText;	
  
		log.info("Openid  ajax request "+ openidBean.getSipuri()+ 
				openidBean.getFacebook()+ openidBean.getGoogle()+ openidBean.getYahoo());
		
        if(!result.hasErrors()){

        	Openid openid = prepareModelOpenid(openidBean);	
    		openidService.addOpenid(openid);	
			returnText="sucessfully updated "+ openidBean.getSipuri()+ " !";

        }else{
			returnText = "Sorry, an error has occur. User has not been added to list.";
		}
		return returnText;
	}

	
	/*---------------------------------Ajax content for contacts----------------------------*/
		@RequestMapping(value="/addcontactajax",method=RequestMethod.POST)
	public @ResponseBody String addContactAjax(@ModelAttribute(value="contactBean") ContactBean contactBean, BindingResult result ){
			
			String returnText;
			System.out.println(" Conatct ajax request "+ contactBean.getSipuri()+ " "+ contactBean.getFriend());
			if(!result.hasErrors()){

				Contact contact = prepareModelContact(contactBean);
				contactService.addContact(contact);
				
				returnText = "User has been added to the list, for "+ contactBean.getSipuri()+ " ! ";
			}else{
				returnText = "Sorry, an error has occur. User has not been added to list.";
			}
			return returnText;
		}

		/*---------------------------------Ajax content for Profile-Pic----------------------------*/
		@RequestMapping(value="/updateProfilePic",method=RequestMethod.POST)
	public @ResponseBody String addContactAjax(HttpServletRequest request,HttpServletResponse response ) throws IOException{
		System.out.println("function called");
			InputStream input=request.getInputStream();
		ArrayList<Byte> listOfBytes=new ArrayList<Byte>();
		int i=0;
		do{
			i=input.read();
			if(i!=-1)
			{
				listOfBytes.add((byte) i);
			}
		}while(i!=-1);
		System.out.println(listOfBytes.size());
		
		byte[] picBytes=new byte[listOfBytes.size()];
		for (int j = 0; j < listOfBytes.size(); j++) {
			picBytes[j]=listOfBytes.get(j);
		}
		input.close();
		String pathOfFile=request.getServletContext().getRealPath("User-Images");
		System.out.println(" File stored at -> "+pathOfFile);
		pathOfFile=pathOfFile+"/userImage.png";
		FileOutputStream fout=new FileOutputStream(pathOfFile);
		fout.write(picBytes);
		fout.flush();
		fout.close();
		return "Profile-Pic updated Successfully";
		}

	
		
		
	/*-------------------------------Ajax content for Geolocation---------------------------*/
			@RequestMapping(value="/addgeolocationajax",method=RequestMethod.POST)
	public @ResponseBody String addGeolocationAjax(@ModelAttribute(value="geolocationBean") GeolocationBean geolocationBean,
					BindingResult result ){
				
				String returnText;		
				if(!result.hasErrors()){
				
					Geolocation geolocation = prepareModelGeolocation(geolocationBean);
					geolocationService.addGeolocation(geolocation);
					
					returnText = "Geolocation added for  "+ geolocationBean.getSipuri();
				}else{
					returnText = "Sorry, an error has occur. Geolocation has not been added.";
				}
				return returnText;
			}


    /*-------------------------------Ajax content for Presence---------------------------*/			
			@RequestMapping(value="/addpresenceajax",method=RequestMethod.POST)
	public @ResponseBody String addPresenceAjax(@ModelAttribute(value="presenceBean") PresenceBean presenceBean, BindingResult result ){

		        log.info("Presence ajax request "+ presenceBean.getSipuri()+ 
		        		presenceBean.getStatus()+ presenceBean.getLoggedin());
		       
		        System.out.println("Presence ajax request "+ presenceBean.getSipuri()+ 
		        		presenceBean.getStatus()+ presenceBean.getLoggedin());

		        if(!result.hasErrors()){		        	
		    		Presence presence = prepareModelPresence(presenceBean);	
		    		presenceService.addPresence(presence);		    		
				}
				return "done";
			}
	
    /*-------------------------------Ajax content for Callogs--------------------------*/			
	@RequestMapping(value="/addcalllogajax",method=RequestMethod.POST)
	public @ResponseBody String addCalllogAjax(@ModelAttribute(value="calllogBean") CalllogBean calllogBean, BindingResult result ){

        log.info("Calllog ajax request "+ calllogBean.getCaller()+ calllogBean.getCallee()
        		+calllogBean.getDate());
       
        System.out.println("Calllog ajax request "+ calllogBean.getCaller()+ calllogBean.getCallee()
        		+calllogBean.getDate());

		    		Calllog calllog= prepareModelCalllog(calllogBean);	
		    		calllogService.addCall(calllog);		    		

		    		
		    		JSONObject jsonResponseLogs=new JSONObject();
		    		ArrayList<JSONObject> logs=new ArrayList<JSONObject>();
		    				    			
		    			Map<String, Object> model = new HashMap<String, Object>();
		    			List<CalllogBean> listcalllogbeanTemp = prepareListofBeanCalllog(calllogService.listCalls());

		    				try {
								jsonResponseLogs.put("Result","OK");
								
			    				for ( int i=0;i<=listcalllogbeanTemp.size();i++)
		    					  {
			    					System.out.println(" values returning to jsp from controller "
			    						+ listcalllogbeanTemp.get(i).getCaller() 
			    						+ listcalllogbeanTemp.get(i).getCallee()
			    						+ listcalllogbeanTemp.get(i).getDate());
		    						  JSONObject obj=new JSONObject();
		    						  obj.put("caller",listcalllogbeanTemp.get(i).getCaller());				  			  			 
		    						  obj.put("callee",listcalllogbeanTemp.get(i).getCallee());
		    						  obj.put("date",listcalllogbeanTemp.get(i).getDate());
		    						  i++;
		    						  logs.add(obj);
		    					  }
		    				jsonResponseLogs.accumulate("logs", logs);
		    				
		    				} catch (JSONException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
		    				//response.setContentType("text/json");
		    				//response.getWriter().println(jsonResponseLogs.toString());
		    				
		return jsonResponseLogs.toString();
	}

	/*
	 * ------------------------------------------Model maker --------------------------------------------------
	 */


	/*
	 * model maker for employee
	 */
	private Employee prepareModel(EmployeeBean employeeBean){
		Employee employee = new Employee();
		employee.setEmpAddress(employeeBean.getAddress());
		employee.setEmpAge(employeeBean.getAge());
		employee.setEmpName(employeeBean.getName());
		employee.setSalary(employeeBean.getSalary());
		employee.setEmpId(employeeBean.getId());
		employeeBean.setId(null);
		return employee;
	}
	
	private List<EmployeeBean> prepareListofBean(List<Employee> employees){
		List<EmployeeBean> beans = null;
		if(employees != null && !employees.isEmpty()){
			beans = new ArrayList<EmployeeBean>();
			EmployeeBean bean = null;
			for(Employee employee : employees){
				bean = new EmployeeBean();
				bean.setName(employee.getEmpName());
				bean.setId(employee.getEmpId());
				bean.setAddress(employee.getEmpAddress());
				bean.setSalary(employee.getSalary());
				bean.setAge(employee.getEmpAge());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private EmployeeBean prepareEmployeeBean(Employee employee){
		EmployeeBean bean = new EmployeeBean();
		bean.setAddress(employee.getEmpAddress());
		bean.setAge(employee.getEmpAge());
		bean.setName(employee.getEmpName());
		bean.setSalary(employee.getSalary());
		bean.setId(employee.getEmpId());
		return bean;
	}
	
	/*
	 * model maler for openid
	 */
	private Openid prepareModelOpenid(OpenidBean openidBean){
		Openid openid = new Openid();
		
		openid.setOpenidfacebook(openidBean.getFacebook());
		openid.setOpenidgoogle(openidBean.getGoogle());
		openid.setOpenidyahoo(openidBean.getYahoo());
		openid.setOpenidsipuri(openidBean.getSipuri());
		//openidBean.setSipuri(null);
		
		return openid;
	}
	
	private List<OpenidBean> prepareListofBeanOpenid(List<Openid> openids){
		List<OpenidBean> beans = null;
		if(openids != null && !openids.isEmpty()){
			beans = new ArrayList<OpenidBean>();
			OpenidBean bean = null;
			for(Openid openid : openids){
				bean = new OpenidBean();
			
				bean.setFacebook(openid.getOpenidfacebook());
				bean.setGoogle(openid.getOpenidgoogle());
				bean.setYahoo(openid.getOpenidyahoo());
				bean.setSipuri(openid.getOpenidsipuri());
				
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private OpenidBean prepareBeanOpenid(Openid openid){
		OpenidBean bean = new OpenidBean();

		bean.setFacebook(openid.getOpenidfacebook());
		bean.setGoogle(openid.getOpenidgoogle());
		bean.setYahoo(openid.getOpenidyahoo());
		bean.setSipuri(openid.getOpenidsipuri());
		
		return bean;
	}
	
	/*
	 * Userdeatils objects 
	 */
	
	private Userdetail prepareModelUserdetail(UserdetailBean userdetailBean){
		Userdetail userdetail = new Userdetail();
		
		userdetail.setUserdetaildisplayName(userdetailBean.getDisplayName());
		userdetail.setUserdetailprivateIdentity(userdetailBean.getPrivateIdentity());
		userdetail.setUserdetailpublicIdentity(userdetailBean.getPublicIdentity());
		userdetail.setUserdetailpassword(userdetailBean.getPassword());
		userdetail.setUserdetailrealm(userdetailBean.getRealm());
		userdetail.setUserdetailsecretQuestion(userdetailBean.getSecretQuestion());
		userdetail.setUserdetailsecretAnswer(userdetailBean.getSecretAnswer());

		//	userdetailsBean..setId(null);
		return userdetail;
	}
	
	private List<UserdetailBean> prepareListofBeanUserdetail(List<Userdetail> userdetails){
		
		List<UserdetailBean> beans = null;
		
		if(userdetails != null && !userdetails.isEmpty()){
			beans = new ArrayList<UserdetailBean>();
			UserdetailBean bean = null;
			for(Userdetail userdetail : userdetails){
				bean = new UserdetailBean();

				bean.setDisplayName(userdetail.getUserdetaildisplayName());
				bean.setPrivateIdentity(userdetail.getUserdetailprivateIdentity());
				bean.setPublicIdentity(userdetail.getUserdetailpublicIdentity());
				bean.setPassword(userdetail.getUserdetailpassword());
				bean.setRealm(userdetail.getUserdetailrealm());
				bean.setSecretQuestion(userdetail.getUserdetailsecretAnswer());
				bean.setSecretAnswer(userdetail.getUserdetailsecretQuestion());
				
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private UserdetailBean prepareBeanUserdetail(Userdetail userdetail){
		UserdetailBean bean = new UserdetailBean();
		
		bean.setDisplayName(userdetail.getUserdetaildisplayName());
		bean.setPrivateIdentity(userdetail.getUserdetailprivateIdentity());
		bean.setPublicIdentity(userdetail.getUserdetailpublicIdentity());
		bean.setPassword(userdetail.getUserdetailpassword());
		bean.setRealm(userdetail.getUserdetailrealm());
		bean.setSecretQuestion(userdetail.getUserdetailsecretAnswer());
		bean.setSecretAnswer(userdetail.getUserdetailsecretQuestion());
		
		return bean;
	}
	
	/*
	 * prepare model for geolocation
	 */
	private Geolocation prepareModelGeolocation(GeolocationBean geolocationBean){
		Geolocation geolocation = new Geolocation();
		geolocation.setGeoLatitude(geolocationBean.getLatitude());
		geolocation.setGeoLongitude(geolocationBean.getLongitude());
		geolocation.setGeodate(geolocationBean.getDate());
		geolocation.setGeotime(geolocationBean.getTime());
		geolocation.setGeosipuri(geolocationBean.getSipuri());
		return geolocation;
	}
	
	private List<GeolocationBean> prepareListofBeanGeolocation(List<Geolocation> geolocations){
		List<GeolocationBean> beans = null;
		if(geolocations != null && !geolocations.isEmpty()){
			beans = new ArrayList<GeolocationBean>();
			GeolocationBean bean = null;
			for(Geolocation geolocation : geolocations){
				bean = new GeolocationBean();
				bean.setSipuri(geolocation.getGeosipuri());
				bean.setLatitude(geolocation.getGeoLatitude());
				bean.setLongitude(geolocation.getGeoLongitude());
				bean.setDate(geolocation.getGeodate());
				bean.setTime(geolocation.getGeotime());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private GeolocationBean prepareBeanGeolocation(Geolocation geolocation){
		GeolocationBean bean = new GeolocationBean();
		bean.setLatitude(geolocation.getGeoLatitude());
		bean.setLongitude(geolocation.getGeoLongitude());
		bean.setDate(geolocation.getGeodate());
		bean.setTime(geolocation.getGeotime());
		bean.setSipuri(geolocation.getGeosipuri());
		return bean;
	}
	
/*
 * contact objects
 */
	private Contact prepareModelContact(ContactBean contactBean){
		Contact contact = new Contact();
		
		contact.setContactsipuri(contactBean.getSipuri());
		contact.setContactfriend(contactBean.getFriend());
		
		return contact;
	}
	
	private List<ContactBean> prepareListofBeanContact(List<Contact> contacts){
		List<ContactBean> beans = null;
		if(contacts != null && !contacts.isEmpty()){
			beans = new ArrayList<ContactBean>();
            ContactBean bean = null;
			for(Contact contact : contacts){
				bean = new ContactBean();
			
				bean.setFriend(contact.getContactfriend());
				bean.setSipuri(contact.getContactsipuri());
				
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private ContactBean prepareBeanContact(Contact contact){
		ContactBean bean = new ContactBean();

		bean.setFriend(contact.getContactfriend());
		bean.setSipuri(contact.getContactsipuri());
		
		return bean;
	}	
	
	/*--------------presence object----------------------*/
	
	private Presence prepareModelPresence(PresenceBean presenceBean){
		Presence presence = new Presence();
		
		presence.setPresencesipuri(presenceBean.getSipuri());
		presence.setPresencestatus(presenceBean.getStatus());
		presence.setPresenceloggedin(presenceBean.getLoggedin());
		return presence;
	}
	
	private List<PresenceBean> prepareListofBeanPresence(List<Presence> presences){
		List<PresenceBean> beans = null;
		if(presences != null && !presences.isEmpty()){
			beans = new ArrayList<PresenceBean>();
			PresenceBean bean = null;
			for(Presence presence : presences){
				bean = new PresenceBean();
			
				bean.setStatus(presence.getPresencestatus());
				bean.setSipuri(presence.getPresencesipuri());
				bean.setLoggedin(presence.getPresenceloggedin());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private PresenceBean prepareBeanPresence(Presence presence){
		PresenceBean bean = new PresenceBean();

		bean.setStatus(presence.getPresencestatus());
		bean.setSipuri(presence.getPresencesipuri());
		bean.setLoggedin(presence.getPresenceloggedin());
		return bean;
	}	
	
	/*
	 * model maker for calllog
	 */
	private Calllog prepareModelCalllog(CalllogBean calllogBean){
		Calllog calllog = new Calllog();
		
		calllog.setCalllogcaller(calllogBean.getCaller());
		calllog.setCalllogcallee(calllogBean.getCallee());
		calllog.setCalllogdate(calllogBean.getDate());
		return calllog;
	}
	
	private List<CalllogBean> prepareListofBeanCalllog(List<Calllog> calllogs){
		List<CalllogBean> beans = null;
		
		if(calllogs != null && !calllogs.isEmpty()){
			beans = new ArrayList<CalllogBean>();
			CalllogBean bean = null;
			for(Calllog calllog : calllogs){
				bean = new CalllogBean();
			
				bean.setCallee(calllog.getCalllogcallee());
				bean.setCaller(calllog.getCalllogcaller());
				bean.setDate(calllog.getCalllogdate());
				
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private CalllogBean prepareBeanCalllog(Calllog calllog){
		CalllogBean bean = new CalllogBean();

		bean.setCallee(calllog.getCalllogcallee());
		bean.setCaller(calllog.getCalllogcaller());
		bean.setDate(calllog.getCalllogdate());
	
		return bean;
	}

	/*
	 * security setetings for springs ecurity	
	 */
	
	@RequestMapping(value="/secureindex", method = RequestMethod.GET)
	public String executeSecurity(ModelMap model, Principal principal ) {
 
		System.out.println(" secure index");
		String name = principal.getName();
		model.addAttribute("author", name);
		model.addAttribute("message", "Welcome To Login Form Based Spring Security Example!!!");
		return "welcome";
 
	}
 
	@RequestMapping(value="/securelogin", method = RequestMethod.GET)
	public String login(ModelMap model) {
     System.out.println(" secure login");
		return "securelogin";
 
	}
 
	@RequestMapping(value="/securefail2login", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		System.out.println(" fail2login ");
		model.addAttribute("error", "true");
		return "securelogin";
 
	}
 
	@RequestMapping(value="/securelogout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
 
		return "securelogin";
 
	}
	
}
