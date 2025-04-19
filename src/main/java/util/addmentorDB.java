package util;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import bean.*;
import util.HibernateConnection;

public class addmentorDB {

	public addmentorDB() {
		// TODO Auto-generated constructor stub
	}

	
	public int getMaxMentor(){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		int result = 0;
		try {
		stmt = con.createStatement();
		String sql = "select MAX(mentorid) from mentor";
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
		
	
	public int addMentor(Mentor mentor){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("insert into mentor values('"+mentor.getMentorid()+"','"+mentor.getMentorprefix()+"','"+mentor.getMentorname()+"','"+mentor.getMentorlastname()+"','"+mentor.getMentornickname()+"','"+mentor.getMentorposition()+"','"+mentor.getMetoremail()+"','"+mentor.getMentorline()+"','"+mentor.getMentorfacebook()+"','"+mentor.getPhonenumber()+" ','"+mentor.getMentorimg()+"','"+mentor.getPassword()+"')");
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}
		}
	
	public int addmentor_student(String sid , int mid){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("insert into mentor_student values('"+mid+"','"+sid+"')");
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}
		}


public Mentor SearchMentorname (String name ,String lastname1){
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Mentor mentor = null;
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from mentor where mentorname like '"+name+"' and mentorlastname like '"+lastname1+"' ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				int mentorid = rs.getInt(1);
				String mentorprefix = rs.getString(2);
				String mentorname = rs.getString(3);
				String lastname = rs.getString(4);	
				String mentornickname = rs.getString(5);
				String mentorposition = rs.getString(6);
				String metoremail = rs.getString(7);
				String mentorline = rs.getString(8);
				String mentorfacebook = rs.getString(9);
				String phonenumber = rs.getString(10);
				String mentorimg = rs.getString(11);	
				
				
				mentor = new Mentor(mentorid,mentorprefix,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,mentorfacebook,phonenumber,mentorimg);
		
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			mentor = null;
		}
		return mentor;
		
	}




	
}
