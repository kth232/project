package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class JoinedDAO {
	public ArrayList<JoinedObj> getList(String uid) throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		ResultSet rs= null;
		try{
		String sql= "SELECT * FROM joinquest where id = ?";
		stmt= conn.prepareStatement(sql);
		stmt.setString(1, uid);
		rs= stmt.executeQuery(); 
		
		ArrayList<JoinedObj> quests = new ArrayList<JoinedObj>();
		while(rs.next()) {
			quests.add(new JoinedObj(rs.getString("uid"), rs.getInt("target"), rs.getInt("jointime")));
			
		}
		return quests;
		} finally{
		if(rs!= null) rs.close();
		if(stmt!= null) stmt.close();
		if(conn!= null) conn.close();
		}
	}
}
