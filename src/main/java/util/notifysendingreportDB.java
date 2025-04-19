package util;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import bean.*;
import util.HibernateConnection;


public class notifysendingreportDB {
	public notifysendingreportDB() {
		// TODO Auto-generated constructor stub
	}
	
	public List<reportname> AllListreportname(){
		List<reportname> listreportname = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from reportname";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				int reportnameid = rs.getInt(1);
				String reportname = rs.getString(2);
				int delivery = rs.getInt(3);
				
				
				
				reportname Reportname = new reportname(reportnameid,reportname,delivery);
				listreportname.add(Reportname);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listreportname;
		
	}
	
	public int AllListreportid(String idstu , int id){
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		int reportnameid = 0;
		try {
			Statement stmt = con.createStatement();
			String sql = "select ReportName_reportnameid from report where ReportName_reportnameid = "+id+" and Student_studentid = '"+idstu+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				 reportnameid = rs.getInt(1);
						
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reportnameid;
		
	}
	public report AllListmyreport(String id , int idR){
		report listreport = null;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from report where Student_studentid = '"+id+"' and ReportName_reportnameid = '"+idR+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				int reportid = rs.getInt(1);
				String filename = rs.getString(2);
				String sentdate = rs.getString(3);
				String status = rs.getString(4);
				String Student_studentid = rs.getString(5);
				int Name_reportnameid = rs.getInt(6);
				
				
		
				listreport = new report(reportid,filename,sentdate,status,Student_studentid,Name_reportnameid);
				
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listreport;
		
	}
	
	public evaluatevideo AllListVDO(String id){
		evaluatevideo EVvdo = null;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from evaluatevideo where Student_studentid = '"+id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				String Student_studentid = rs.getString(1);
				int Video_videoid = rs.getInt(2);
				double score = rs.getDouble(3);
				String evaluatedate = rs.getString(4);
				int Teacher_teacherid = rs.getInt(5);
				
				 EVvdo = new evaluatevideo(Student_studentid,Video_videoid,score,evaluatedate,Teacher_teacherid);
				
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return EVvdo;
		
	}
}
