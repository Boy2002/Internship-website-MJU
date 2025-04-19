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

public class AddQuestionDB {

	public AddQuestionDB() {
		// TODO Auto-generated constructor stub
	}

	
	

	public int addQuestion(question qt) {
        ConnectionDB condb = new ConnectionDB();
        Connection con = condb.getConnection();

        try {
            Statement statement = con.createStatement();
            String query = "INSERT INTO question (questiontext, questiontype, score) VALUES ('" +
                           qt.getQuestiontext() + "', '" +
                           qt.getQuestiontype() + "', " +
                           qt.getScore() + ")";
            statement.executeUpdate(query);
            con.close();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
	
	public int CheckDoubleQuestion(String Qtext) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();

	    try {
	        String query = "SELECT * FROM question WHERE questiontext = ?";
	        PreparedStatement preparedStatement = con.prepareStatement(query);
	        preparedStatement.setString(1, Qtext);

	        ResultSet resultSet = preparedStatement.executeQuery();

	        // ตรวจสอบว่ามีผลลัพธ์หรือไม่
	        if (resultSet.next()) {
	            con.close();
	            return 1; // คำถามซ้ำ
	        } else {
	            con.close();
	            return 0; // ไม่มีคำถามซ้ำ
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return -1; // เกิดข้อผิดพลาด
	    }
	}

	
	public List<question> ListAllQuestion(){
		
		List<question> ListQuestion = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM question ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
	
				String questionid = rs.getString(1);
				String questiontext = rs.getString(2);
				String questiontype = rs.getString(3);
				double score = rs.getDouble(4);
				
				question cp = new question(questionid,questiontext,questiontype,score);
				ListQuestion.add(cp);
			}
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ListQuestion;
		
	}
	
public question getQuestionbyID(String qid){
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		question cp = null;
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM question where questionid ='"+qid+"'";
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

	public int editQuestion(question qt)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
	   Connection conn = dbcon.getConnection();   
	   Statement statment = conn.createStatement(); 
	
	   statment.execute("UPDATE question SET questiontext = '"+qt.getQuestiontext()+"',questiontype = '"+qt.getQuestiontype()+"',score ='"+qt.getScore()+"' WHERE questionid = '"+qt.getQuestionid()+"'"); 
	   conn.close(); 
	   return 1; 
	   }catch(Exception e){          
		   return -1; }   
		
		}   
	
	public int DeleteQuestion(int qtid) {  
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {  
	        ConnectionDB dbcon = new ConnectionDB();
	        conn = dbcon.getConnection();   
	        
	        String sql = "DELETE FROM question WHERE questionid = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, qtid);
	        
	        pstmt.executeUpdate();
	        
	        return 1;  // Return success status
	    } catch(Exception e) {          
	        e.printStackTrace();
	        return -1;  // Return error status
	    } finally {
	        // ปิด PreparedStatement และ Connection เพื่อป้องกันการรั่วไหลของทรัพยากร
	        try {
	            if (pstmt != null && !pstmt.isClosed()) {
	                pstmt.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        try {
	            if (conn != null && !conn.isClosed()) {
	                conn.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	
	public List<formmenterdetail> CheckQuestionInFormMentor(int qtid) {
	    List<formmenterdetail> ListformQuestion = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    try {
	        // ใช้ PreparedStatement เพื่อเตรียมคำสั่ง SQL ที่มีพารามิเตอร์
	        String sql = "SELECT * FROM formmenterdetail WHERE questionid_detail = ?";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, qtid);
	        
	        // ใช้ pstmt เพื่อ executeQuery แทนการใช้ Statement
	        ResultSet rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            int mentorformid_detail = rs.getInt(1);
	            int questionid_detail = rs.getInt(2);
	            
	            formmenterdetail fmd = new formmenterdetail(mentorformid_detail, questionid_detail);
	            ListformQuestion.add(fmd);
	        }
	        
	        // ปิด ResultSet และ PreparedStatement เพื่อป้องกันการรั่วไหลของทรัพยากร
	        rs.close();
	        pstmt.close();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // ปิด Connection ใน block finally เพื่อให้แน่ใจว่าจะถูกปิดในทุกกรณี
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return ListformQuestion;
	}

	
	public List<formteacherdetail> CheckQuestionInFormTeacher(int qtid) {
	    List<formteacherdetail> ListformQuestion = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    try {
	        // ใช้ PreparedStatement เพื่อเตรียมคำสั่ง SQL ที่มีพารามิเตอร์
	        String sql = "SELECT * FROM formteacherdetail WHERE questionid_detail = ?";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, qtid);
	        
	        // ใช้ pstmt เพื่อ executeQuery แทนการใช้ Statement
	        ResultSet rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            int teacherformid_detail = rs.getInt(1);
	            int questionid_detail = rs.getInt(2);
	            
	            formteacherdetail ftd = new formteacherdetail(teacherformid_detail, questionid_detail);
	            ListformQuestion.add(ftd);
	        }
	        
	        // ปิด ResultSet และ PreparedStatement เพื่อป้องกันการรั่วไหลของทรัพยากร
	        rs.close();
	        pstmt.close();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // ปิด Connection ใน block finally เพื่อให้แน่ใจว่าจะถูกปิดในทุกกรณี
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return ListformQuestion;
	}


}
	
	

