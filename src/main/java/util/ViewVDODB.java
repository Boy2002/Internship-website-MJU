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

public class ViewVDODB {

	public ViewVDODB() {
		// TODO Auto-generated constructor stub
	}

	public VDO Viewvideo(String id){
		VDO v = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from video INNER JOIN evaluatevideo  ON video.videoid = evaluatevideo.Video_videoid where Student_studentid = '"+id+"'  ";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next() && rs.getRow()==1 ) {
				
				 int videoid = rs.getInt(1);
				 String filename = rs.getString(2);
				 String sentdate = rs.getString(3);
				 String status = rs.getString(4);
				 String semester = rs.getString(5);
				 int Company_companyid = rs.getInt(6);
				 
			
				
				v = new VDO (videoid,filename,sentdate,status,semester,Company_companyid);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}
	
	
	public List<Student> AllListStuvdo(int id){
		List<Student> ListStu = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM student INNER JOIN evaluatevideo ON student.studentid = evaluatevideo.Student_studentid where Video_videoid = '"+id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				 String idstudent = rs.getString(1);
				 String studentname = rs.getString(2);
				 String studentlastname = rs.getString(3);
				 String password = rs.getString(4);
				 String workposition = rs.getString(5);
				 Date startdate = rs.getDate(6);
			     Date enddate = rs.getDate(7);
				 String semester = rs.getString(8);
				 int Teacher_teacherid = rs.getInt(9);
				 int Company_companyid = rs.getInt(10);
			
				
				 Student Stu = new Student (idstudent,studentname,studentlastname,password,workposition,startdate,enddate,semester,Teacher_teacherid,Company_companyid);
			     ListStu.add(Stu);
			}
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ListStu;
		
	}
	
	
	
	public evaluatevideo scoreSTU(String id , int Teacherid){
		evaluatevideo v = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM evaluatevideo where Student_studentid = '"+id+"' and Teacher_teacherid = '"+Teacherid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next() && rs.getRow()==1 ) {
				
				 String Student_studentid = rs.getString(1);
				 int Video_videoid = rs.getInt(2);
				 double score = rs.getDouble(3);
				 String evaluatedate = rs.getString(4);
				 int Teacher_teacherid = rs.getInt(5);
				 
				
				
				v = new evaluatevideo (Student_studentid,Video_videoid,score,evaluatedate,Teacher_teacherid);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}
	

	

public List<VDO> AllListStuvdoDESC(){
	List<VDO> Listvdo = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT videoid,filename,sentdate,status,semester,company_companyid FROM video INNER JOIN evaluatevideo ON video.videoid = evaluatevideo.Video_videoid where status = 'ผ่าน' GROUP BY videoid ORDER BY SUM(score) DESC LIMIT 0,3";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			int videoid = rs.getInt(1);
			 String filename = rs.getString(2);
			 String sentdate = rs.getString(3);
			 String status = rs.getString(4);
			 String semester = rs.getString(5);	 
			 int Company_companyid = rs.getInt(6);
			 
		
			
			 VDO v = new VDO (videoid,filename,sentdate,status,semester,Company_companyid);
			 Listvdo.add(v);
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return Listvdo;
}	

public List<VDO> AllListStuvdoDESC1(){
	List<VDO> Listvdo = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT videoid,filename,sentdate,status,semester,company_companyid FROM video INNER JOIN evaluatevideo ON video.videoid = evaluatevideo.Video_videoid where status = 'ผ่าน'  GROUP BY videoid";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			int videoid = rs.getInt(1);
			 String filename = rs.getString(2);
			 String sentdate = rs.getString(3);
			 String status = rs.getString(4);
			 String semester = rs.getString(5);	 
			 int Company_companyid = rs.getInt(6);
			 
		
			
			 VDO v = new VDO (videoid,filename,sentdate,status,semester,Company_companyid);
			 Listvdo.add(v);
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return Listvdo;
}	


public List<VDO> AllListStuvdoDESC2(String Semester){
	List<VDO> Listvdo = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT videoid,filename,sentdate,status,semester,company_companyid FROM video INNER JOIN evaluatevideo ON video.videoid = evaluatevideo.Video_videoid where semester like '"+Semester+"' and status = 'ผ่าน'  GROUP BY videoid;";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			int videoid = rs.getInt(1);
			 String filename = rs.getString(2);
			 String sentdate = rs.getString(3);
			 String status = rs.getString(4);
			 String semester = rs.getString(5);	 
			 int Company_companyid = rs.getInt(6);
			 
		
			
			 VDO v = new VDO (videoid,filename,sentdate,status,semester,Company_companyid);
			 Listvdo.add(v);
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return Listvdo;
}	
}
