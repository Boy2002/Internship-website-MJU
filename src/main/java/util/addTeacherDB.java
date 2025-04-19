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

public class addTeacherDB {

	public addTeacherDB() {
		// TODO Auto-generated constructor stub
	}

	
	public int getMaxTeacher(){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		int result = 0;
		try {
		stmt = con.createStatement();
		String sql = "Select MAX(teacherid) from teacher";
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
		
	
	public int addTeacher(teacher Teacher){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("insert into teacher values('"+Teacher.getTeacherid()+"','"+Teacher.getTeachername()+"','"+Teacher.getTeacherlastname()+"','"+Teacher.getPhonenumber()+"','"+Teacher.getTeacheremail()+"','"+Teacher.getPassword()+"','"+Teacher.getTeachertype()+"','"+Teacher.getTeacherimg()+"','"+Teacher.getStatus()+"')");
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}
		}
	
	///////// new sysstem///// 
	public int assignSupervision(Assignsupervision As){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("insert into assignsupervision (date, time, methods, semester, status, companyid, teacherid) values('"+As.getDate()+"','"+As.getTime()+"','"+As.getMethods()+"','"+As.getSemester()+"','"+As.getStatus()+"','"+As.getCompanyid()+"','"+As.getTeacherid()+"')");
		
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}
		}
	

		public int EditassignSupervision(Assignsupervision As) {
		    ConnectionDB condb = new ConnectionDB();
		    Connection con = condb.getConnection();
		    try {
		        String sql = "UPDATE assignsupervision SET date=?, time=?, methods=?, semester=?, status=?, companyid=?, teacherid=? WHERE companyid=? AND semester=?";
		        PreparedStatement pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, As.getDate());
		        pstmt.setString(2, As.getTime());
		        pstmt.setString(3, As.getMethods());
		        pstmt.setString(4, As.getSemester());
		        pstmt.setString(5, As.getStatus());
		        pstmt.setString(6, As.getCompanyid());
		        pstmt.setString(7, As.getTeacherid());
		        pstmt.setString(8, As.getCompanyid());
		        pstmt.setString(9, As.getSemester());

		        pstmt.executeUpdate();

		        con.close();
		        return 1;
		    } catch (Exception e) {
		        System.out.println(e);
		        return -1;
		    }
		}

		
		public int ComfirmStatusDB(int comid,String semester,String  status) {
		    ConnectionDB condb = new ConnectionDB();
		    Connection con = condb.getConnection();
		    try {
		        String sql = "UPDATE assignsupervision SET status=? WHERE companyid=? AND semester=? ";
		        PreparedStatement pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, status);
		        pstmt.setInt(2, comid);
		        pstmt.setString(3,semester);


		        pstmt.executeUpdate();

		        con.close();
		        return 1;
		    } catch (Exception e) {
		        System.out.println(e);
		        return -1;
		    }
		}
		
		public int AutoChange(int comid,String semester) {
		    ConnectionDB condb = new ConnectionDB();
		    Connection con = condb.getConnection();
		    try {
		        String sql = "UPDATE assignsupervision SET status=? WHERE companyid=? AND semester=? ";
		        PreparedStatement pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, "กำลังดำเนินการ");
		        pstmt.setInt(2, comid);
		        pstmt.setString(3, semester);


		        pstmt.executeUpdate();

		        con.close();
		        return 1;
		    } catch (Exception e) {
		        System.out.println(e);
		        return -1;
		    }
		}


	//////// new system //// สร้างตัวใหม่เพราะตัวเก่าลิสต์แค่อาจารย์status=2 และไม่ควรมีอ.กำลังศึกษาต่อ for assignteacher
	public List<teacher> AllListTeachers(){
		List<teacher> listTeacher = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM teacher WHERE status LIKE '%อยู่%'";
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
				
				
				
				teacher Teacher = new teacher(teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
				listTeacher.add(Teacher);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listTeacher;
		
	}
	
	//////////////// end new system//////////////
	
	public List<teacher> AllListteacher(){
		List<teacher> listTeacher = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from teacher where teachertype = '2' and (status like 'อยู่' or status like 'กำลังศึกษาต่อ' )";
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
				
				
				
				teacher Teacher = new teacher(teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
				listTeacher.add(Teacher);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listTeacher;
		
	}
	
	
	public List<teacher> AllListteacherE(){
		List<teacher> listTeacher = new ArrayList<>();
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
				
				
				
				teacher Teacher = new teacher(teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
				listTeacher.add(Teacher);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listTeacher;
		
	}

	public int UPDATEStatusTeacher(String Teacherid , String status)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE teacher SET status = '"+status+"'  WHERE teacherid = '"+Teacherid+"'"); 
       conn.close();
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		} 
	
	
	public int UPDATEStatusTeacherposition(String Teacherid)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE teacher SET teachertype = '3'  WHERE teacherid = '"+Teacherid+"'"); 
       conn.close();
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		} 
	
	public int UPDATEStatusTeacheris2(String Teacherid)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE teacher SET teachertype = '2'  WHERE teacherid = '"+Teacherid+"'"); 
       conn.close();
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		} 
	
	
	public int UPDATEDETeacher(String Teacherid )    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE teacher SET status = 'ลาออก'  WHERE teacherid = '"+Teacherid+"'"); 
       conn.close();
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}

	
}
