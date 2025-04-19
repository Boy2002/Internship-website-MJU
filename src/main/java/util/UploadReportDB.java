package util;
import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.*;
import util.HibernateConnection;

public class UploadReportDB {

	public UploadReportDB() {
		// TODO Auto-generated constructor stub
	}

	public int getMaxreport(){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		int result = 0;
		try {
		stmt = con.createStatement();
		String sql = "Select MAX(reportid) from report";
		ResultSet rs = stmt.executeQuery(sql);

		System.out.println(rs);
		while(rs.next()) {
		int id = rs.getInt(1);
		result = id;
		}

		}catch(SQLException e) {
		e.printStackTrace();
		}

		return result ;

		}
	
	public int addreport(report report){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("insert into report values('"+report.getReportid()+"','"+report.getFilename()+"','"+report.getSentdate()+"','"+report.getStatus()+"','"+report.getStudent_studentid()+"','"+report.getReportName_reportnameid()+"')");
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}


		}

	
	public int UPDATEreport(report report)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE report SET sentdate = '"+report.getSentdate()+"',filename = '"+report.getFilename()+"' WHERE Student_studentid = '"+report.getStudent_studentid()+"' and ReportName_reportnameid = '"+report.getReportName_reportnameid()+"'"); 
       conn.close();
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}   
	
	public int addevaluatereport(evaluatereport Evaluatereport){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("insert into evaluatereport values('"+Evaluatereport.getReport_reportid()+"','"+Evaluatereport.getTeacher_teacherid()+"','-1',null)");
	
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}
		}
	
	
	public report Viewreport(String idR , String stu){
		report filereport = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM report where ReportName_reportnameid = '"+idR+"' and Student_studentid = '"+stu+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next() && rs.getRow()==1 ) {
				
				 int reportid = rs.getInt(1);
				 String filename = rs.getString(2);
				 String sentdate = rs.getString(3);
				 String status = rs.getString(4);
				 String Student_studentid = rs.getString(5);
				 int ReportName_reportnameid = rs.getInt(6);
							
				 filereport = new report (reportid,filename,sentdate,status,Student_studentid,ReportName_reportnameid);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return filereport;
	}
	
	}

		
