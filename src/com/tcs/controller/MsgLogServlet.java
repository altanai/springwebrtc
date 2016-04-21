package com.tcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;
@WebServlet("/MsgLogServlet")
public class MsgLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MsgLogServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean append_to_file=true;
		String path="C:/msgLog.txt";
		String textLine=request.getParameter("text");
		if(append_to_file){
			System.out.println("in msgLogServlet");
			FileWriter write=new FileWriter(path,append_to_file);
			PrintWriter print_Line=new PrintWriter(write);
			print_Line.printf("%s"+";", textLine);
			print_Line.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
