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

public class ScoreAssessmentDB {

	public ScoreAssessmentDB() {
		// TODO Auto-generated constructor stub
	}

	public List<teacheranswer> Allteacheranswer(String id){
		List<teacheranswer> Listtans = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from teacheranswer where studentid_answer = '"+id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
					int teacherformid_answer = rs.getInt(1);
					int questionid_answer = rs.getInt(2); 
					int teacherid_answer = rs.getInt(3);
					String studentid_answer = rs.getString(4);
					String teacheranswertext = rs.getString(5);
					Double score = rs.getDouble(6);
				 
			
				
					teacheranswer tans = new teacheranswer (teacherformid_answer,questionid_answer,teacherid_answer,studentid_answer,teacheranswertext,score);
					Listtans.add(tans);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Listtans;
	}
	
	public List<mentoranswer> Allmentoranswer(String id){
		List<mentoranswer> Listmans = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from mentoranswer where studentid_ans = '"+id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
					int mentorformid_ans = rs.getInt(1);
					int questionid_ans = rs.getInt(2); 
					int mentorid_ans = rs.getInt(3);
					String studentid_ans = rs.getString(4);
					String mentoranswertext = rs.getString(5);
					Double score = rs.getDouble(6);	
				
					mentoranswer mans = new mentoranswer (mentorformid_ans,questionid_ans,mentorid_ans,studentid_ans,mentoranswertext,score);
					Listmans.add(mans);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Listmans;
	}
	
	public List<mentoranswer> countmentoranswer(String id){
		List<mentoranswer> Listmans = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select distinct mentorid_ans from mentoranswer where studentid_ans = '"+id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
					int mentorid_ans = rs.getInt(1);

				
					mentoranswer mans = new mentoranswer (mentorid_ans);
					Listmans.add(mans);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Listmans;
	}
	
	
//	public List<teacheranswer> Listteacheranswer(String stuid , int teaid){
//		List<teacheranswer> Listteacheranswer = new ArrayList<>();
//		ConnectionDB condb = new ConnectionDB();
//		Connection con = condb.getConnection();
//		try {
//			Statement stmt = con.createStatement();
//			String sql = "select * from teacheranswer inner join question on questionid_answer = questionid where studentid_answer = '"+stuid+"' and teacherid_answer = "+teaid+"";
//			ResultSet rs = stmt.executeQuery(sql);
//			while(rs.next()) {
//				
//				int teacherformid_answer = rs.getInt(1);
//				int questionid_answer = rs.getInt(2); 
//				int teacherid_answer = rs.getInt(3);
//				String studentid_answer = rs.getString(4);
//				String teacheranswertext = rs.getString(5);
//				int teachertotalscore = rs.getInt(6);
//				String questionid = rs.getString(7);
//				String questiontext = rs.getString(8);
//				String questiontype = rs.getString(9);
//				double score = rs.getDouble(10);
//			 
//				question q = new question(questionid,questiontext,questiontype,score);
//				teacheranswer ta = new teacheranswer (teacherformid_answer,questionid_answer,teacherid_answer,studentid_answer,teacheranswertext,teachertotalscore);
//				Listteacheranswer.add(ta);
//			}
//			
//			con.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return Listteacheranswer;
//		
//	}

	}

		
