package util;
import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

public class UploadVDODB {

	public UploadVDODB() {
		// TODO Auto-generated constructor stub
	}

	public int getMaxVOD(){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		int result = 0;
		try {
		stmt = con.createStatement();
		String sql = "Select MAX(videoid) from video";
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
	
	public int getIDVOD(String idSTU){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		int result = 0;
		try {
		stmt = con.createStatement();
		String sql = "Select Video_videoid from evaluatevideo where Student_studentid = '"+idSTU+"' GROUP BY Student_studentid, Video_videoid";
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
	
	public VDO getVOD(int idVDO){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		VDO result = null;
		try {
		stmt = con.createStatement();
		String sql = "Select * from video where videoid = '"+idVDO+"'";
		ResultSet rs = stmt.executeQuery(sql);

		System.out.println(rs);
		while(rs.next()) {
		int id = rs.getInt(1);
		String filename = rs.getString(2);
		String sentdate = rs.getString(3);
		String status = rs.getString(4);
		String semester = rs.getString(5);
		int company_companyid = rs.getInt(6);
		result = new VDO(id,filename,sentdate,status,semester,company_companyid);
		}

		}catch(SQLException e) {
		e.printStackTrace();
		}

		return result ;

		}
	
	public int addvdo(VDO vdo){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("insert into video values('"+vdo.getVideoid()+"','"+vdo.getFilename()+"','"+vdo.getSentdate()+"','"+vdo.getStatus()+"','"+vdo.getSemester()+"','"+vdo.getCompany_companyid()+"')");
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}
		}
	
	
	public int Editvdo(VDO vdo){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("UPDATE video SET filename = '"+vdo.getFilename()+"' , sentdate = '"+vdo.getSentdate()+"' ,status = '"+vdo.getStatus()+"' where videoid = '"+vdo.getVideoid()+"' ");
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}
	}
	
	public int addevaluatevideo(evaluatevideo Evaluatevideo){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("insert into evaluatevideo values('"+Evaluatevideo.getStudent_studentid()+"','"+Evaluatevideo.getVideo_videoid()+"','-1',null,'"+Evaluatevideo.getTeacher_teacherid()+"')");
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}
		}
	
	public List<Student> Liststudentidcom(int idcom , String semester1, Date Startdate){
		List<Student> listStudent = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from student where Company_companyid = '"+idcom+"' and semester = '"+semester1+"' and startdate = '"+Startdate+"'";
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
				
				
				Student s = new Student (idstudent,studentname,studentlastname,password,workposition,startdate,enddate,semester,Teacher_teacherid,Company_companyid);
				listStudent.add(s);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listStudent;
		
	}
	
	public List<Student> Liststudentidvdo(int idvdo){
		List<Student> listStudent = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT student.* FROM student INNER JOIN evaluatevideo ON student.studentid = evaluatevideo.Student_studentid WHERE evaluatevideo.Video_videoid = '"+idvdo+"' GROUP BY student.studentid";
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
				
				
				Student s = new Student (idstudent,studentname,studentlastname,password,workposition,startdate,enddate,semester,Teacher_teacherid,Company_companyid);
				listStudent.add(s);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listStudent;
		
	}
	
	public List<teacher> ListTeacher(){
		List<teacher> ListTeacher = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from teacher ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				int teacherid = rs.getInt(1);
				String teachername = rs.getString(2);
				String teacherlastname = rs.getString(3);
				String phonenumber = rs.getString(4);
				String teacheremail = rs.getString(5);
				String password = rs.getString(6);
				String teachertype = rs.getString(7);
				String teacherimg = rs.getString(8);
				String status = rs.getString(9);
				
				teacher tt = new teacher(teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
				ListTeacher.add(tt);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ListTeacher;
		
	}
	
	}

		
