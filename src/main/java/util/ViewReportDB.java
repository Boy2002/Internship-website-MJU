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

public class ViewReportDB {

	public ViewReportDB() {
		// TODO Auto-generated constructor stub
	}

	public report Viewreport(String id){
		report v = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from report where Student_studentid = '"+id+"' and ReportName_reportnameid = '17';";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next() && rs.getRow()==1 ) {
				
				 int reportid = rs.getInt(1);
				 String filename = rs.getString(2);
				 String sentdate = rs.getString(3);
				 String status = rs.getString(4);
				 String Student_studentid = rs.getString(5);
				 int ReportName_reportnameid = rs.getInt(6);
				 
				 
			
				
				v = new report (reportid,filename,sentdate,status,Student_studentid,ReportName_reportnameid);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}
	
	
	public evaluatereport Viewreevaluatereport(int idR , int idT){
		evaluatereport v = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM evaluatereport where Report_reportid = '"+idR+"' and Teacher_teacherid = '"+idT+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next() && rs.getRow()==1 ) {
				
				 int Reportid = rs.getInt(1);
				 int teacherid = rs.getInt(2);
				 double score = rs.getDouble(3);
					
				v = new evaluatereport (Reportid,teacherid,score,null);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}
	
	
	public List<report> ViewreportDESC(){
		List<report> v = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT  reportid,filename,sentdate,status,Student_studentid,ReportName_reportnameid FROM report INNER JOIN evaluatereport ON report.reportid = evaluatereport.Report_reportid GROUP BY reportid ORDER BY score DESC LIMIT 0,3";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				 int reportid = rs.getInt(1);
				 String filename = rs.getString(2);
				 String sentdate = rs.getString(3);
				 String status = rs.getString(4);
				 String Student_studentid = rs.getString(5);
				 int ReportName_reportnameid = rs.getInt(6);
				 				
				 report v1 = new report (reportid,filename,sentdate,status,Student_studentid,ReportName_reportnameid);
				 v.add(v1);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}

	}

		
