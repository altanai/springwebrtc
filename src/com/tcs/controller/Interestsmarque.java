package com.tcs.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.bean.Login;
import com.tcs.dao.InterestDao;


public class Interestsmarque extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Interestsmarque() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		Login userDetails=((Login)session.getAttribute("data"));
		String id=userDetails.getPrivateIdentity();
		
		System.out.println("Fetching inetrest data ");
		InterestDao intdao=new InterestDao();
		Map<String, String> map=(Map<String, String>)intdao.getallinterests(id);
		
		for (Map.Entry<String, String> entry : map.entrySet())
		{
			System.out.println("--------------"+entry.getKey() +" :"+ entry.getValue()+"-------------");
			
			if(entry.getKey().equalsIgnoreCase("realm")){
				
				String imagekeyfull=entry.getValue();
				System.out.println(" imagekey full "+ imagekeyfull);
				
				//splitting the realm name like tcs.com into tc and com 
				String[] parts = imagekeyfull.split(".com");
				String part1 = parts[0]; System.out.println("part1 "+part1);
				//String part2 = parts[1]; System.out.println("part2 "+part2);
				
				// assigning value to new string for image serach 
				String imagekey=part1;
				System.out.println(" imagekey  "+ imagekey);
		        
		        //set attribute for realm
				request.setAttribute("realm", imagekey);
				 
			}// close realm 
			
            if(entry.getKey().equalsIgnoreCase("jobtitle")){
				
				String imagekey=entry.getValue();
				System.out.println(" imagekey with spaces "+ imagekey);

				if(imagekey.contains(" ")){
				//splitting the value and removing the space . joing them again 
				String[] parts = imagekey.split(" ");
				String part1 = parts[0]; System.out.println("part1 "+part1);
			
				String part2 = parts[1]; System.out.println("part2 "+part2);
				imagekey=part1.concat(part2);
				System.out.println(" imagekey without spaces "+ imagekey);
				}
		        //set attribute for realm
				request.setAttribute("jobtitle", imagekey);
		  
			}// close jobtitle
            
            if(entry.getKey().equalsIgnoreCase("industry")){
				
				String imagekey=entry.getValue();
				System.out.println(" imagekey with spaces "+ imagekey);

				if(imagekey.contains(" ")){
				//splitting the value and removing the space . adding the first part
				String[] parts = imagekey.split(" ");
				String part1 = parts[0]; System.out.println("part1 "+part1);
				String part2 = parts[1]; System.out.println("part2 "+part2);
				imagekey=part1;
				System.out.println(" imagekey without spaces "+ imagekey);
				}
		        //set attribute for realm
				request.setAttribute("industry", imagekey);
		  
			}// close realm 				
		}
			request.getRequestDispatcher("interestsmarque.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
