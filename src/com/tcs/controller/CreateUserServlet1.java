package com.tcs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.tcs.bean.Login;
import com.tcs.dao.MyLoginDao;



/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/CreateUserServlet1")
public class CreateUserServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUserServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
			boolean isMultipart=ServletFileUpload.isMultipartContent(request);
			if(!isMultipart)
			{
				//System.out.println("This is not a multi-part request");
				return;
			}
			try
			{
				//System.out.println("User-Creation");
				Login user=new Login();
				DiskFileItemFactory factory=new DiskFileItemFactory();
				ServletFileUpload upload=new ServletFileUpload(factory);
				/*@SuppressWarnings("unchecked");*/
				List<FileItem> items=upload.parseRequest(request);
				Iterator<FileItem> iterator=items.iterator();
				while(iterator.hasNext())    //reading the contents of the form
				{
					FileItem item=iterator.next();
					if(item.isFormField())
					{
						String name=item.getFieldName();
						String value=item.getString();
						if(name.equalsIgnoreCase("displayName"))
							user.setDisplayName(value);
						else if(name.equalsIgnoreCase("publicIdentity"))
							user.setPublicIdentity(value.toLowerCase());
						else if(name.equalsIgnoreCase("password"))
							user.setPassword(value);
						else if(name.equalsIgnoreCase("realm")){
							user.setRealm(value);
							user.setPrivateIdentity("sip:"+user.getPublicIdentity()+"@"+user.getRealm());
							System.out.println(user.getPrivateIdentity()+"privAte");
						}
						else if(name.equalsIgnoreCase("secretQuestion"))
							user.setSecretQuestion(value);
						else if(name.equalsIgnoreCase("secretAnswer"))
							user.setAnswer(value);
					}
					else
					{
						String name=item.getFieldName();
						if(name.equalsIgnoreCase("userPic"))
						{
							if(item.getName()=="")
							{
								FileInputStream fileInputStream=null;
								
								File file = new File(getServletContext().getRealPath("images\\Default.jpg"));
						        byte[] bFile = new byte[(int) file.length()];
						        try 
						        {
						        	fileInputStream = new FileInputStream(file);
						        	fileInputStream.read(bFile);
						        	fileInputStream.close();
						        	user.setProfilepic(bFile);
						        }
						        catch(Exception e){e.printStackTrace();}
							}
							else
							{
								String path=getServletContext().getRealPath("User-Images");
								path=path+"/"+user.getPublicIdentity()+user.getRealm().replace(".", "")+".png";
								FileOutputStream fout=new FileOutputStream(path);
								fout.write(item.get());
								fout.close();
								user.setProfilepic(item.get());
								user.setPicfile(item.getName());
							}
						}
					}
				}
				
				boolean resultOfInsert;
				resultOfInsert=new MyLoginDao().register(user);
				 if(resultOfInsert)
				 {	
					 System.out.println("The values were added Successfully");
					 request.setAttribute("messageToLogin", "You have successfully registered. Please click on Login link to continue..");
					 request.getRequestDispatcher("Registration.jsp").forward(request, response);
				 }
				 else{
					 System.out.println("");
					 request.setAttribute("messageToLogin", "A user with same private identity already exsits.");
					 request.getRequestDispatcher("Registration.jsp").forward(request, response);
				 }
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}
			
}		
		


