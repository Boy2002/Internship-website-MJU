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

import bean.*;
import util.HibernateConnection;

public class ListStudentDB {

	public ListStudentDB() {
		// TODO Auto-generated constructor stub
	}

	
	public List<String> AllListsemester(){
		List<String> listsemester = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT semester FROM student group by semester ORDER BY MAX(startdate) DESC";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
						
				String semester = rs.getString(1);
				
				listsemester.add(semester);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listsemester;
		
	}
	
	public List<Student> AllListStu(String id , String Semester){
		List<Student> ListStu = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM student where Company_companyid = '"+id+"' and semester like '%"+Semester+"%'";
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
	
	
	public List<Student> AllListStuE(String Semester){
		List<Student> ListStu = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM student where semester like '%"+Semester+"%'";
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
	
	
	public List<Student> AllListStuE(String id , String Semester){
		List<Student> ListStu = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM student where Company_companyid = '"+id+"' and semester = '"+Semester+"'";
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
	
	
	public List<Student> AllListStuid(String id , String Semester,String idstu){
		List<Student> ListStu = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM student where Company_companyid = '"+id+"' and semester like '%"+Semester+"' and studentid = '"+idstu+"'";
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
	
	
	public List<Student> AllListStuidE(String Semester,String idstu){
		List<Student> ListStu = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM student where semester like '%"+Semester+"' and studentid like '%"+idstu+"%'";
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

	public List<Student> AllListStuname(String id , String Semester,String Namestu){
		List<Student> ListStu = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM student where Company_companyid = '"+id+"' and semester like '%"+Semester+"' and studentname like '%"+Namestu+"%'";
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
	
	
	public List<Student> AllListStunameE(String Semester,String Namestu ){
		List<Student> ListStu = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM student where semester like '%"+Semester+"' and studentname like '%"+Namestu+"%'";
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
	
	
	public List<Student> AllListStuscore(String id , String Semester){
		List<Student> ListStu = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM student INNER JOIN report on report.Student_studentid = student.studentid INNER JOIN evaluatevideo on evaluatevideo.Student_studentid = student.studentid INNER JOIN video on video.videoid = evaluatevideo.Video_videoid where (report.status = 'ยังไม่ได้ให้คะแนนเอกสาร' and report.ReportName_reportnameid = '17' or video.status = 'ไม่ได้ให้คะแนนวิดีโอ') and  student.semester = '"+Semester+"' and student.Company_companyid = "+id+" GROUP BY student.studentid" ;
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
	
	public int UPDATEscoreStudent(int teacherid,int id ,String questionIdList ,String Date)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE evaluatereport SET score = '"+questionIdList+"', evaluatedate = '"+Date+"' WHERE Teacher_teacherid = '"+teacherid+"' and Report_reportid = '"+id+"'"); 
       conn.close(); 
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}  
	
	public int UPDATEreportstatus(int reportid)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE report SET status = 'ให้คะแนนแล้ว' WHERE reportid = '"+reportid+"' "); 
       conn.close(); 
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}  
	public int UPDATEVDOstatus(int vdoid)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE video SET status = 'ให้คะแนนแล้ว' WHERE videoid = '"+vdoid+"' "); 
       conn.close(); 
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}  
	
	
	public int Sidvdo(String idSTU){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		int vdoid = 0;
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT Video_videoid from evaluatevideo where Student_studentid = '"+idSTU+"' GROUP BY Video_videoid";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				vdoid = rs.getInt(1);
			}
			con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vdoid;
			
		}

	
	public int UPDATEscoreevaluatevideo(int teacherid,String STUid ,String questionIdList ,String Date)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE evaluatevideo SET score = '"+questionIdList+"', evaluatedate = '"+Date+"' WHERE Teacher_teacherid = '"+teacherid+"' and Student_studentid = '"+STUid+"'"); 
       conn.close(); 
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}  
	
public int Searchreportid(String id){
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		int reportid = 0;
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT reportid FROM report where Student_studentid = '"+id+"' and ReportName_reportnameid = '17'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				 reportid = rs.getInt(1);
			
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reportid;
		
	}


public List<Student> AllListStuSemester(String Semester){
	List<Student> ListStu = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM student where  semester like '"+Semester+"%'";
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

public String AllReportStuid(String id){
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	String Rid = null;
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT Report_reportid FROM evaluatereport INNER JOIN report ON report.reportid=evaluatereport.Report_reportid where Student_studentid = '"+id+"' GROUP BY Report_reportid;";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			
			  Rid = rs.getString(1);
			
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return Rid;
	
}


public List<teacher> AllReportTname(String id){
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	List<teacher> ListTname = new ArrayList<>();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status FROM teacher INNER JOIN evaluatereport on evaluatereport.Teacher_teacherid = teacher.teacherid where Report_reportid = "+id+" ";
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
			
			teacher T = new teacher(teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
			ListTname.add(T);
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return ListTname;
	
}


public double scoreSTU(String idSTU , int idTC){
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	double scoreSTU = -1;
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT score from evaluatereport where Report_reportid = "+idSTU+" and Teacher_teacherid = "+idTC+"";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {		
			scoreSTU = rs.getDouble(1);			
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return scoreSTU;
	
}

public double scoreSTUVDO(String idSTU , int idTC){
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	double scoreSTUVDO = -1;
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT score from evaluatevideo where Student_studentid = '"+idSTU+"' and Teacher_teacherid = "+idTC+"";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			
			scoreSTUVDO = rs.getDouble(1);
			
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return scoreSTUVDO;
	
}


public int addStudent(Student S){
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
	Statement statment = con.createStatement();
	statment.execute("insert into student values('"+S.getIdstudent()+"','"+S.getStudentname()+"','"+S.getStudentlastname()+"','"+S.getPassword()+"','"+S.getWorkposition()+"','"+S.getStartdate()+"','"+S.getEnddate()+"','"+S.getSemester()+" ','"+S.getTeacher_teacherid()+"','"+S.getCompany_companyid()+"')");
	con.close();
	return 1;
	
	}catch(Exception e){
	System.out.println(e);
	
	return -1;
	}
	}


public Student SStuid(String id){
	Student ListStu = null;
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM student where studentid = '"+id+"'";
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
		
			
			 ListStu = new Student (idstudent,studentname,studentlastname,password,workposition,startdate,enddate,semester,Teacher_teacherid,Company_companyid);
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return ListStu;
	
}


public boolean isDeleteStudent(String student_id,int Rid) {
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();

	boolean result = false;

		try {
			CallableStatement stmt = con.prepareCall("{call isDeleteStudent(?,?)}");
			stmt.setString(1, student_id);
			stmt.setInt(2, Rid);
			stmt.execute();
			result = true;
			con.close();
			stmt.close();
		} catch (SQLException er) {
			er.printStackTrace();
		}
	
	return result;
}

public boolean isDeleteStudent1(String student_id) {
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();

	boolean result = false;

		try {
			CallableStatement stmt = con.prepareCall("{call isDeleteStudent1(?)}");
			stmt.setString(1, student_id);
			stmt.execute();
			result = true;
			con.close();
			stmt.close();
		} catch (SQLException er) {
			er.printStackTrace();
		}
	
	return result;
}

public List<report> AllListreportname(String id){
	List<report> listreportname = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "select * from report where Student_studentid = '"+id+"'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			
			int reportid = rs.getInt(1);
			String filename = rs.getString(2);
			String sentdate = rs.getString(3);
			String status = rs.getString(4);
			String Student_studentid = rs.getString(5);
			int ReportName_reportnameid = rs.getInt(6);
		
			
			report Report = new report(reportid,filename,sentdate,status,Student_studentid,ReportName_reportnameid);
			listreportname.add(Report);
		}
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return listreportname;
	
}
}
