package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class noticeDAO {
	public boolean insert(String uid, String atitle, String content, String ts) throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		try{
			String sql= "INSERT INTO quser(id, atitle, content, ts) VALUES (?,?,?,?)";
			stmt= conn.prepareStatement(sql);
			stmt.setString(1, uid);
			stmt.setString(2, atitle);
			stmt.setString(3, content);
			stmt.setString(4, ts);
			
			int count= stmt.executeUpdate();
			return(count== 1) ? true: false;
			
		} finally{
			if(stmt!= null) stmt.close();
			if(conn!= null) conn.close();
		}
	}
	
	public ArrayList<noticeObj> getList() throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
		String sql = "SELECT * FROM notice ORDER BY ts DESC";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		ArrayList<noticeObj> notices = new ArrayList<noticeObj>();
		while(rs.next()) {
			notices.add(new noticeObj(rs.getString("id"), rs.getString("atitle"), rs.getString("ts")));
			}
		return notices;
		
		} finally {
		if (rs != null) rs.close();
		if (stmt != null) stmt.close(); 
		if (conn != null) conn.close();
		}
	}
}
