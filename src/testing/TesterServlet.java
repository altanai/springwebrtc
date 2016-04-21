package testing;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class TesterServlet
 */
@WebServlet("/TesterServlet")
public class TesterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TesterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("getProfilePic"))
		{
			System.out.println(action);
			byte []p=new DAO().getImage();
			response.getOutputStream().write(p);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String action=request.getParameter("action");
			String fileName=request.getParameter("fileName");
			String privateIdentity=request.getParameter("privateIdentity");
			System.out.println("private Identity====================="+privateIdentity);
			System.out.println(action+" "+ fileName );
		/*	Part file=request.getPart("pPic");*/
			String nameOfFile=privateIdentity.replaceAll("sip:", "");
			nameOfFile=nameOfFile.replace("@", "");
			nameOfFile=nameOfFile.replace(".", "");
			System.out.println(nameOfFile);
		
			InputStream input=request.getInputStream();
			int i=0,count=0;
			ArrayList<Byte> listOfBytes=new ArrayList<Byte>();
			
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
			String pathOfFile=getServletContext().getRealPath("User-Images");
			pathOfFile=pathOfFile+"/"+nameOfFile+".png";
			FileOutputStream fout=new FileOutputStream(pathOfFile);
			fout.write(picBytes);
			fout.flush();
			fout.close();
			/*System.out.println(action +" hey "+ fileName);
			Part file=request.getPart("pPic");
			
			
			InputStream input=file.getInputStream();
			//File file1=new File("F:/"+fileName);
	*/		
			System.out.println("Ahoy your task completed Successfully!!count is"+count);
			
			//System.out.println(input.read(picBytes));
			/*while ((count = input.read(picBytes)) != -1){
			}*/
			//boolean operation=new DAO().demoFunction(picBytes,privateIdentity);
			boolean operation=true;
			/*
			FileOutputStream fout=new FileOutputStream(file);
			byte[] buffer = new byte[1024 * 1024];
			int data;
			while ((data = input.read(buffer)) != -1){
				fout.write(buffer, 0, data);
			}
			fout.close();*/
			response.setContentType("text/html");
			if(operation){
				response.getWriter().println("true");	
			}
			else {
				response.getWriter().println("false");
			}
			
			
			/*boolean isMultipart=ServletFileUpload.isMultipartContent(request);
			if(!isMultipart)
			{
				System.out.println("This is not a multi-part request");
				return;
			}*/
	}

}
