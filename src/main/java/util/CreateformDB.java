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

public class CreateformDB {

	public CreateformDB() {
		// TODO Auto-generated constructor stub
	}

	
	

	public int addHeaderFormMentor(Mentorassessmentform mf) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();

	    if (con == null) {
	        System.err.println("Connection failed.");
	        return -1;
	    }

	    String query = "INSERT INTO mentorassessmentform (title, description, semester, date, totalscore) VALUES (?, ?, ?, ?, ?)";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        pstmt.setString(1, mf.getTitle());
	        pstmt.setString(2, mf.getDescription());
	        pstmt.setString(3, mf.getSemester());
	        pstmt.setString(4, mf.getDate()); 
	        pstmt.setDouble(5, mf.getTotalscore());

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
	
	public List<Mentorassessmentform> getMentorFormBySemester(String smt) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    List<Mentorassessmentform> mentorForms = new ArrayList<>();

	    if (con == null) {
	        System.err.println("Connection failed.");
	        return mentorForms;
	    }

	    String query = "SELECT * FROM mentorassessmentform WHERE semester = ?";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        pstmt.setString(1, smt);
	        
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                Mentorassessmentform mf = new Mentorassessmentform();
	                mf.setTitle(rs.getString("title"));
	                mf.setDescription(rs.getString("description"));
	                mf.setSemester(rs.getString("semester"));
	                mf.setDate(rs.getString("date"));
	                mf.setTotalscore(rs.getDouble("totalscore"));
	                
	                mentorForms.add(mf);
	            }
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
	    return mentorForms;
	}
	public List<Teacherassessmentform> getTeacherFormBySemester(String smt) {
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		List<Teacherassessmentform> teacherForms = new ArrayList<>();
		
		if (con == null) {
			System.err.println("Connection failed.");
			return teacherForms;
		}
		
		String query = "SELECT * FROM teacherassessmentform WHERE semester = ?";
		try (PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setString(1, smt);
			
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					Teacherassessmentform tf = new Teacherassessmentform();
					tf.setTitle(rs.getString("title"));
					tf.setDescription(rs.getString("description"));
					tf.setSemester(rs.getString("semester"));
					tf.setDate(rs.getString("date"));
					tf.setTotalscore(rs.getDouble("totalscore"));
					
					teacherForms.add(tf);
				}
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
		return teacherForms;
	}

	
	public int addHeaderFormTeacher(Teacherassessmentform mf) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();

	    if (con == null) {
	        System.err.println("Connection failed.");
	        return -1;
	    }

	    String query = "INSERT INTO teacherassessmentform (title, description, semester, date, totalscore) VALUES (?, ?, ?, ?, ?)";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        pstmt.setString(1, mf.getTitle());
	        pstmt.setString(2, mf.getDescription());
	        pstmt.setString(3, mf.getSemester());
	        pstmt.setString(4, mf.getDate()); 
	        pstmt.setDouble(5, mf.getTotalscore());

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

	
	public question getQuestionbyName(String questionTexts){	
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	question cp = null;
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM question where questiontext ='"+questionTexts+"'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {

			String questionid = rs.getString(1);
			String questiontext = rs.getString(2);
			String questiontype = rs.getString(3);
			double score = rs.getDouble(4);
			
			cp = new question(questionid,questiontext,questiontype,score);
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return cp;
	
}	
	
	public Mentorassessmentform getMentorFormById(int fid){	
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Mentorassessmentform mf = null;
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM mentorassessmentform where mentorassessmentformid ='"+fid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {

				int mentorassessmentformid = rs.getInt(1);
				String title = rs.getString(2);
				String description = rs.getString(3);
				String semester = rs.getString(4);
				String date = rs.getString(5);
				double totalscore = rs.getDouble(6);
				
				mf = new Mentorassessmentform(mentorassessmentformid,title,description,semester,date,totalscore);
			}
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mf;
		
	}	
	
	public Teacherassessmentform getTeacherFormById(int fid){	
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Teacherassessmentform mf = null;
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM teacherassessmentform where teacherassessmentformid ='"+fid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {

				int teacherassessmentformid = rs.getInt(1);
				String title = rs.getString(2);
				String description = rs.getString(3);
				String semester = rs.getString(4);
				String date = rs.getString(5);
				double totalscore = rs.getDouble(6);
				
				mf = new Teacherassessmentform(teacherassessmentformid,title,description,semester,date,totalscore);
			}
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mf;
		
	}	
	
	public List<formmenterdetail> getformmenterdetailById(int fid){	
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		List<formmenterdetail> Listfd =new ArrayList<>();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM formmenterdetail where mentorformid_detail ='"+fid+"' ORDER BY question_no";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {

				int mentorformid_detail = rs.getInt(1);
				int questionid_detail = rs.getInt(2);
				int question_no = rs.getInt("question_no");
				
				formmenterdetail fd = new formmenterdetail(mentorformid_detail,questionid_detail,question_no);
				Listfd.add(fd);
			}
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Listfd;
		
	}	
	
	public List<formteacherdetail> getformteacherdetailById(int fid){	
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    List<formteacherdetail> Listfd = new ArrayList<>();
	    try {
	        Statement stmt = con.createStatement();
	        // เพิ่ม ORDER BY question_no ใน SQL เพื่อเรียงลำดับตาม question_no
	        String sql = "SELECT * FROM formteacherdetail WHERE teacherformid_detail = '"+fid+"' ORDER BY question_no";
	        ResultSet rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	            int teacherformid_detail = rs.getInt("teacherformid_detail"); // ใช้ชื่อคอลัมน์เพื่อความชัดเจน
	            int questionid_detail = rs.getInt("questionid_detail");
	            int question_no = rs.getInt("question_no"); // ดึงข้อมูล question_no เพิ่มมาใช้หากจำเป็น

	            formteacherdetail fd = new formteacherdetail(teacherformid_detail, questionid_detail, question_no); // สมมุติว่า constructor ของ formteacherdetail มี 3 พารามิเตอร์
	            Listfd.add(fd);
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return Listfd;
	}
	
	

	
	public int getMaxIdMentorForm(){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		int result = 0;
		try {
		stmt = con.createStatement();
		String sql = "Select MAX(mentorassessmentformid) from mentorassessmentform";
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
	
	public int getMaxIdTeacherForm(){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		int result = 0;
		try {
		stmt = con.createStatement();
		String sql = "Select MAX(teacherassessmentformid) from teacherassessmentform";
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
	
	public int getMaxIdQuestion(){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		int result = 0;
		try {
		stmt = con.createStatement();
		String sql = "Select MAX(questionid) from question";
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
	
	public int addformmenterdetail(formmenterdetail fmd) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();

	    if (con == null) {
	        System.err.println("Connection failed.");
	        return -1;
	    }

	    String query = "INSERT INTO formmenterdetail (mentorformid_detail,questionid_detail,question_no) VALUES (?, ?,?)";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        pstmt.setInt(1, fmd.getMentorformid_detail());
	        pstmt.setInt(2, fmd.getQuestionid_detail());
	        pstmt.setInt(3, fmd.getQuestion_no());

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
	
	public int addformteacherdetail(formteacherdetail fmd) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();

	    if (con == null) {
	        System.err.println("Connection failed.");
	        return -1;
	    }

	    String query = "INSERT INTO formteacherdetail (teacherformid_detail,questionid_detail,question_no) VALUES (?, ?,?)";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        pstmt.setInt(1, fmd.getTeacherformid_detail());
	        pstmt.setInt(2, fmd.getQuestionid_detail());
	        pstmt.setInt(3, fmd.getQuestion_no());

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




	
	public List<Mentorassessmentform> ListAllMentorassessmentform() {
	    List<Mentorassessmentform> ListMentorform = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    try {
	        Statement stmt = con.createStatement();
	        String sql = "SELECT * FROM mentorassessmentform";
	        ResultSet rs = stmt.executeQuery(sql);
	        while (rs.next()) {

	        	int mentorassessmentformid= rs.getInt(1);
	        	String title= rs.getString(2);
	        	String description= rs.getString(3);
	        	String semester= rs.getString(4);
	        	String date= rs.getString(5);
	        	double totalscore= rs.getDouble(6);

	            Mentorassessmentform mf = new Mentorassessmentform(mentorassessmentformid,title, description, semester, date, totalscore);
	            ListMentorform.add(mf);
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return ListMentorform;
	}
	
	public List<Teacherassessmentform> ListAllTeacherassessmentform() {
	    List<Teacherassessmentform> ListTeacherform = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    try {
	        Statement stmt = con.createStatement();
	        String sql = "SELECT * FROM teacherassessmentform";
	        ResultSet rs = stmt.executeQuery(sql);
	        while (rs.next()) {

	        	int teacherassessmentformid= rs.getInt(1);
	        	String title= rs.getString(2);
	        	String description= rs.getString(3);
	        	String semester= rs.getString(4);
	        	String date= rs.getString(5);
	        	double totalscore= rs.getDouble(6);

	            Teacherassessmentform tf = new Teacherassessmentform(teacherassessmentformid,title, description, semester, date, totalscore);
	            ListTeacherform.add(tf);
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return ListTeacherform;
	}

	


	public int editFormMentor(Mentorassessmentform mf,int fid)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
	   Connection conn = dbcon.getConnection();   
	   Statement statment = conn.createStatement(); 
	
	   statment.execute("UPDATE mentorassessmentform SET title = '"+mf.getTitle()+"',description = '"+mf.getDescription()+"',semester ='"+mf.getSemester()+"',date ='"+mf.getDate()+"',totalscore ='"+mf.getTotalscore()+"' WHERE mentorassessmentformid = '"+fid+"'"); 
	   conn.close(); 
	   return 1; 
	   }catch(Exception e){          
		   return -1; }   
		
		}   
	
	public int DeleteQuestionFormMentorForAddNew(int fid) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	        ConnectionDB dbcon = new ConnectionDB();
	        conn = dbcon.getConnection();

	        // ลบคำถามทั้งหมดใน formmenterdetail ที่มี mentorformid_detail เท่ากับ fid
	        String deleteQuery = "DELETE FROM formmenterdetail WHERE mentorformid_detail = ?";
	        pstmt = conn.prepareStatement(deleteQuery);
	        pstmt.setInt(1, fid);
	        pstmt.executeUpdate();
	        
	        conn.close();
	        return 1;
	        
	    } catch (Exception e) {
	        e.printStackTrace(); // สำหรับดีบักและตรวจสอบข้อผิดพลาด
	        return -1;
	    } finally {
	        // ปิดการเชื่อมต่อฐานข้อมูลและ statement
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	public int editFormTeacher(Teacherassessmentform tf,int fid)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
	   Connection conn = dbcon.getConnection();   
	   Statement statment = conn.createStatement(); 
	
	   statment.execute("UPDATE teacherassessmentform SET title = '"+tf.getTitle()+"',description = '"+tf.getDescription()+"',semester ='"+tf.getSemester()+"',date ='"+tf.getDate()+"',totalscore ='"+tf.getTotalscore()+"' WHERE teacherassessmentformid = '"+fid+"'"); 
	   conn.close(); 
	   return 1; 
	   }catch(Exception e){          
		   return -1; }   
		
		}   
	
	public int DeleteQuestionFormTeacherForAddNew(int fid) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	        ConnectionDB dbcon = new ConnectionDB();
	        conn = dbcon.getConnection();

	        // ลบคำถามทั้งหมดใน formmenterdetail ที่มี mentorformid_detail เท่ากับ fid
	        String deleteQuery = "DELETE FROM formteacherdetail WHERE teacherformid_detail = ?";
	        pstmt = conn.prepareStatement(deleteQuery);
	        pstmt.setInt(1, fid);
	        pstmt.executeUpdate();
	        
	        conn.close();
	        return 1;
	        
	    } catch (Exception e) {
	        e.printStackTrace(); // สำหรับดีบักและตรวจสอบข้อผิดพลาด
	        return -1;
	    } finally {
	        // ปิดการเชื่อมต่อฐานข้อมูลและ statement
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	public List<mentoranswer> checkFormInMentorAnswer(int id) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    List<mentoranswer> menotorAnswers = new ArrayList<>();
	    try {
	        Statement stmt = con.createStatement();
	        // Query to select from teacheranswer table
	        String sql = "SELECT * FROM mentoranswer WHERE mentorformid_ans = " + id;
	        ResultSet result = stmt.executeQuery(sql);

	        while (result.next()) {
	            // Creating a TeacherAnswer object to store each row
	        	mentoranswer answer = new mentoranswer();
	        	answer.setMentorformid_ans(result.getInt("mentorformid_ans"));
	            answer.setQuestionid_ans(result.getInt("questionid_ans"));
	            answer.setMentorid_ans(result.getInt("mentorid_ans"));
	            answer.setStudentid_ans(result.getString("studentid_ans"));
	            answer.setMentoranswertext(result.getString("mentoranswertext"));
	            answer.setScore(result.getDouble("score"));
	            answer.setEdited(result.getInt("edited"));
	            answer.setEvalutiontime(result.getString("evalutiontime"));
	            
	            // Add each answer to the list
	            menotorAnswers.add(answer);
	        }

	        result.close();
	        stmt.close();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return menotorAnswers;
	}
	
	public List<teacheranswer> checkFormInTeacherAnswer(int id) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    List<teacheranswer> teacherAnswers = new ArrayList<>();
	    try {
	        Statement stmt = con.createStatement();
	        // Query to select from teacheranswer table
	        String sql = "SELECT * FROM teacheranswer WHERE teacherformid_answer = " + id;
	        ResultSet result = stmt.executeQuery(sql);

	        while (result.next()) {
	            // Creating a TeacherAnswer object to store each row
	        	teacheranswer answer = new teacheranswer();
	        	answer.setTeacherformid_answer(result.getInt("teacherformid_answer"));
	            answer.setQuestionid_answer(result.getInt("questionid_answer"));
	            answer.setTeacherid_answer(result.getInt("teacherid_answer"));
	            answer.setStudentid_answer(result.getString("studentid_answer"));
	            answer.setTeacheranswertext(result.getString("teacheranswertext"));
	            answer.setScore(result.getDouble("score"));
	            answer.setEdited(result.getInt("edited"));
	            answer.setEvalutiontime(result.getString("evalutiontime"));
	            
	            // Add each answer to the list
	            teacherAnswers.add(answer);
	        }

	        result.close();
	        stmt.close();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return teacherAnswers;
	}
	
	public int deleteFormMentorCASCADE(String id) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    try {
	        Statement stmt = con.createStatement();
	        // Delete from mentor table only
	        String sql = "DELETE FROM mentorassessmentform WHERE mentorassessmentformid = '" + id + "'";
	        int result = stmt.executeUpdate(sql);
	        con.close();
	        return result;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return -1; // Indicate an error
	}
	
	public int deleteFormTeacherCASCADE(String id) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    try {
	        Statement stmt = con.createStatement();
	        // Delete from teacher table only
	        String sql = "DELETE FROM teacherassessmentform WHERE teacherassessmentformid = '" + id + "'";
	        int result = stmt.executeUpdate(sql);
	        con.close();
	        return result;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return -1; // Indicate an error
	}

	
}
	
	

