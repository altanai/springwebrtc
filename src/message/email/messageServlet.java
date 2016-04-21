package message.email;



import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Security;
import java.util.Properties;

import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Servlet implementation class message
 */

public class messageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SMTP_HOST_NAME = "smtp.gmail.com";
	private static final String SMTP_PORT = "465";
	private static final String emailSubjectTxt = "A test from gmail";
	private static final String emailFromAddress = "tcscns@gmail.com";//Your mail-id which goes as From Address
	private static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	private static final String sendTo =  "tcnscns1@gmail.com";//Addresses of recipients
	String result = null;
    String urlStr="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public messageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
    	Emailclass ec= new Emailclass();
    	ec.sendemail();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
    	Emailclass ec= new Emailclass();
    	ec.sendemail();
		
		
    	//HttpServletResponse.sendRedirect("pageone/index.jsp");
    	response.sendRedirect("pageone/index.jsp");
    	
	}
	
	
public void sendemail(){
    	
    	
		/*sending an email*/
		boolean debug = true;

           Properties props = new Properties();
           props.put("mail.smtp.host", SMTP_HOST_NAME);
           props.put("mail.smtp.auth", "true");
           props.put("mail.debug", "true");
           props.put("mail.smtp.port", SMTP_PORT);
           props.put("mail.smtp.socketFactory.port", SMTP_PORT);
           props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
           props.put("mail.smtp.socketFactory.fallback", "false");



           Session session = Session.getDefaultInstance
           (	props,new javax.mail.Authenticator()
           	{

        	protected PasswordAuthentication getPasswordAuthentication()
        		{
        	   	    return new PasswordAuthentication("tcscns@gmail.com", "tcs@123456");//Mail-id and password
        		}
           	}
           );


           Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
           session.setDebug(debug);

           Message msg = new MimeMessage(session);
           InternetAddress addressFrom = null;
           InternetAddress addressTo=null;

           try{
					addressFrom = new InternetAddress(emailFromAddress );
					msg.setFrom(addressFrom);

			        addressTo = new InternetAddress();
			        addressTo = new InternetAddress(sendTo);

					msg.setRecipient(Message.RecipientType.TO,addressTo);
					msg.setSubject(emailSubjectTxt);
					msg.setContent("call me back asap ", "text/html");

					Transport.send(msg);

			        
           		}

         catch(MessagingException e)
         		{
        	 		e.printStackTrace();
         		}
		/*Finish email code*/
    	   	
    }
	



}
