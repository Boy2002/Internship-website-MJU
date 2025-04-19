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

public class AssessmentDB {

	public AssessmentDB() {
		// TODO Auto-generated constructor stub
	}

	public List<Student> ListStuMentor(int mid,String smter) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    List<Student> ListStu = new ArrayList<>();
	    String sql = "SELECT * FROM Student S INNER JOIN mentor_student m ON S.studentid = m.student_studentid WHERE m.mentor_mentorid = ? AND S.semester = ?; ";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, mid);
	        pstmt.setString(2, smter);
	        System.out.println("ListStuMentor Menterid ="+mid +"semester = "+smter);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
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
	
	
	
	public int AssessmentMentorAnswer(mentoranswer ma) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();

	    if (con == null) {
	        System.err.println("Connection failed.");
	        return -1;
	    }

	    String query = "INSERT INTO mentoranswer (mentorformid_ans,questionid_ans,mentorid_ans,studentid_ans,mentoranswertext,score,edited,evalutiontime) VALUES (?, ?,?,?,?,?,?,?)";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        pstmt.setInt(1, ma.getMentorformid_ans() );
	        pstmt.setInt(2, ma.getQuestionid_ans() );
	        pstmt.setInt(3, ma.getMentorid_ans());
	        pstmt.setString(4, ma.getStudentid_ans());
	        pstmt.setString(5, ma.getMentoranswertext());
	        pstmt.setDouble(6, ma.getScore());
	        pstmt.setDouble(7, ma.getEdited());
	        pstmt.setString(8, ma.getEvalutiontime());

	        pstmt.executeUpdate();
	        return 1;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	public int AssessmentTeacherAnswer(teacheranswer ta) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();

	    if (con == null) {
	        System.err.println("Connection failed.");
	        return -1;
	    }

	    String query = "INSERT INTO teacheranswer (teacherformid_answer,questionid_answer,teacherid_answer,studentid_answer,teacheranswertext,score,edited,evalutiontime) VALUES (?, ?,?,?,?,?,?,?)";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        pstmt.setInt(1, ta.getTeacherformid_answer() );
	        pstmt.setInt(2, ta.getQuestionid_answer() );
	        pstmt.setInt(3, ta.getTeacherid_answer());
	        pstmt.setString(4, ta.getStudentid_answer());
	        pstmt.setString(5, ta.getTeacheranswertext());
	        pstmt.setDouble(6, ta.getScore());
	        pstmt.setDouble(7, ta.getEdited());
	        pstmt.setString(8, ta.getEvalutiontime());
    	
	        pstmt.executeUpdate();
	        return 1;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	
	public int editMentorAnswer(mentoranswer ma) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();

	    if (con == null) {
	        System.err.println("Connection failed.");
	        return -1;
	    }

	    // Assuming `id` is the primary key or unique identifier for the record
	    String query = "UPDATE mentoranswer SET mentoranswertext = ? , score = ? , edited = ? , evalutiontime = ? WHERE mentorformid_ans = ? AND questionid_ans = ? AND mentorid_ans = ? AND studentid_ans = ?";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	    	pstmt.setString(1, ma.getMentoranswertext());
	    	pstmt.setDouble(2, ma.getScore());
	    	pstmt.setDouble(3, ma.getEdited());
	    	pstmt.setString(4, ma.getEvalutiontime()); 
	    	
	        pstmt.setInt(5, ma.getMentorformid_ans());
	        pstmt.setInt(6, ma.getQuestionid_ans());
	        pstmt.setInt(7, ma.getMentorid_ans());
	        pstmt.setString(8, ma.getStudentid_ans());        
	               
   
	      

	        int rowsUpdated = pstmt.executeUpdate();
	        return rowsUpdated > 0 ? 1 : -1; // Return 1 if update was successful, -1 otherwise
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	public int editTeacherAnswer(teacheranswer ta) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();

	    if (con == null) {
	        System.err.println("Connection failed.");
	        return -1;
	    }

	    // Assuming `id` is the primary key or unique identifier for the record
	    String query = "UPDATE teacheranswer SET teacheranswertext = ? , score = ? , edited = ? , evalutiontime = ? WHERE teacherformid_answer = ? AND questionid_answer = ? AND teacherid_answer = ? AND studentid_answer = ?";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	    	pstmt.setString(1, ta.getTeacheranswertext());
	    	pstmt.setDouble(2, ta.getScore());
	    	pstmt.setInt(3, ta.getEdited());
	    	pstmt.setString(4, ta.getEvalutiontime());
	    	
	        pstmt.setInt(5, ta.getTeacherformid_answer());
	        pstmt.setInt(6, ta.getQuestionid_answer());
	        pstmt.setInt(7, ta.getTeacherid_answer());
	        pstmt.setString(8, ta.getStudentid_answer());
	        

	    	

	        int rowsUpdated = pstmt.executeUpdate();
	        return rowsUpdated > 0 ? 1 : -1; // Return 1 if update was successful, -1 otherwise
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	

	
	public List<mentoranswer> CheckAssessmentMentorAnswer(int mid, String stuid) {
	    List<mentoranswer> listmentoranswer = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    
	    String sql = "SELECT * FROM mentoranswer WHERE mentorid_ans = ? AND studentid_ans = ?";
	    
	    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
	        // ตั้งค่าพารามิเตอร์
	        pstmt.setInt(1, mid);
	        pstmt.setString(2, stuid);
	        
	        ResultSet rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            int mentorformid_ans = rs.getInt("mentorformid_ans"); 
	            int questionid_ans = rs.getInt("questionid_ans"); 
	            int mentorid_ans = rs.getInt("mentorid_ans"); 
	            String studentid_ans = rs.getString("studentid_ans"); 
	            String mentoranswertext = rs.getString("mentoranswertext");
	            Double Score = rs.getDouble("score");
	            int edited = rs.getInt("edited");
	            String evalutiontime = rs.getString("evalutiontime");
	            
	            mentoranswer mentoranswer = new mentoranswer(mentorformid_ans, questionid_ans, mentorid_ans, studentid_ans, mentoranswertext,Score,edited,evalutiontime);
	            listmentoranswer.add(mentoranswer);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return listmentoranswer;
	}
	
	public List<teacheranswer> CheckAssessmentTeacherAnswer(int tid, String stuid) {
	    List<teacheranswer> listteacheranswer = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    
	    String sql = "SELECT * FROM teacheranswer WHERE teacherid_answer = ? AND studentid_answer = ?";
	    
	    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
	        // ตั้งค่าพารามิเตอร์
	        pstmt.setInt(1, tid);
	        pstmt.setString(2, stuid);
	        
	        ResultSet rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	        	    
	        	int teacherformid_answer = rs.getInt("teacherformid_answer");
	        	int questionid_answer = rs.getInt("questionid_answer"); 
	        	int teacherid_answer = rs.getInt("teacherid_answer");
	        	String studentid_answer = rs.getString("studentid_answer");
	        	String teacheranswertext = rs.getString("teacheranswertext");
	        	Double Score = rs.getDouble("score");
	        	int edited = rs.getInt("edited");
	        	String  evalutiontime = rs.getString("evalutiontime");
	        	
	            
	            teacheranswer teacheranswer = new teacheranswer(teacherformid_answer, questionid_answer, teacherid_answer, studentid_answer, teacheranswertext,Score,edited,evalutiontime);
	            listteacheranswer.add(teacheranswer);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return listteacheranswer;
	}
	
	
	public List<Student> getAllStudentsBySemester(String semester, String idStu, int mid) {
	    List<Student> studentList = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    
	    String sql = "SELECT * FROM Student S INNER JOIN mentor_student m ON S.studentid = m.student_studentid " +
	                 "WHERE m.mentor_mentorid = ?";
	    
	    if (semester != null && !semester.isEmpty()) {
	        sql += " AND S.semester LIKE ?";
	    }
	    if (idStu != null && !idStu.isEmpty()) {
	        sql += " AND S.studentid LIKE ?";
	    }

	    try (Connection con = condb.getConnection();
	         PreparedStatement stmt = con.prepareStatement(sql)) {

	        stmt.setInt(1, mid);

	        int paramIndex = 2;
	        if (semester != null && !semester.isEmpty()) {
	            stmt.setString(paramIndex++, "%" + semester + "%");
	        }
	        if (idStu != null && !idStu.isEmpty()) {
	            stmt.setString(paramIndex++, "%" + idStu + "%");
	        }

	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                String idStudent = rs.getString("studentid");
	                String studentName = rs.getString("studentname");
	                String studentLastName = rs.getString("studentlastname");
	                String password = rs.getString("password");
	                String workPosition = rs.getString("workposition");
	                Date startDate = rs.getDate("startdate");
	                Date endDate = rs.getDate("enddate");
	                String semesterResult = rs.getString("semester");
	                int teacherId = rs.getInt("Teacher_teacherid");
	                int companyId = rs.getInt("Company_companyid");

	                Student student = new Student(idStudent, studentName, studentLastName, password, workPosition, 
	                                              startDate, endDate, semesterResult, teacherId, companyId);
	                studentList.add(student);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return studentList;
	}
	
	
	public List<Company> searchCompanyStuTeacher(String semester, int tid) {
	    List<Company> listCompany = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    String sql = "SELECT c.companyid, c.companyname, c.companyaddress, c.coordinatorname, c.phonenumber, c.email, c.website, c.facebook, c.average "
	               + "FROM company c "
	               + "INNER JOIN assignsupervision a ON c.companyid = a.companyid "
	               + "WHERE a.semester LIKE ? AND a.teacherid = ? AND a.status = ?";
	    
	    try {
	        con = condb.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, "%" + semester + "%");
	        pstmt.setInt(2, tid);
	        pstmt.setString(3, "เสร็จสิ้น");
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            int companyid = rs.getInt("companyid");
	            String companyname = rs.getString("companyname");
	            String companyaddress = rs.getString("companyaddress");
	            String coordinatorname = rs.getString("coordinatorname");
	            String phonenumber = rs.getString("phonenumber");
	            String email = rs.getString("email");
	            String website = rs.getString("website");
	            String facebook = rs.getString("facebook");
	            double average = rs.getDouble("average");

	            Company cp = new Company(companyid, companyname, companyaddress, coordinatorname, phonenumber, email, website, facebook, average);
	            listCompany.add(cp);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return listCompany;
	}

	public Mentorassessmentform formMentorBySemester(String semester) {
		ConnectionDB condb = new ConnectionDB();
		Connection con = null;
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
    	Mentorassessmentform maf = new Mentorassessmentform();
	    
	    String sql = "Select * from mentorassessmentform where semester like ?";
	    try {
	        con = condb.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, "%" + semester + "%");
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	        	int mentorassessmentformid = rs.getInt("mentorassessmentformid");
	        	String title = rs.getString("title");
	        	String description = rs.getString("description");
	        	String Semester = rs.getString("semester");
	        	String date = rs.getString("date");
	        	double totalscore = rs.getInt("totalscore");

	        	maf = new Mentorassessmentform(mentorassessmentformid, title, description, Semester, date, totalscore);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return maf;
	}
	
	public Teacherassessmentform formTeacherBySemester(String semester) {
		ConnectionDB condb = new ConnectionDB();
		Connection con = null;
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    Teacherassessmentform taf = new Teacherassessmentform();
	    
	    String sql = "Select * from teacherassessmentform where semester like ?";
	    try {
	        con = condb.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, "%" + semester + "%");
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	        	int teacherassessmentformid = rs.getInt("teacherassessmentformid");
	        	String title = rs.getString("title");
	        	String description = rs.getString("description");
	        	String Semester = rs.getString("semester");
	        	String date = rs.getString("date");
	        	double totalscore = rs.getInt("totalscore");

	        	taf = new Teacherassessmentform(teacherassessmentformid, title, description, Semester, date, totalscore);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return taf;
	}



}
