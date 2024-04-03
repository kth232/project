package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class AdminUserDAO {
	public ArrayList<AdminUserObj> getList() throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		ResultSet rs= null;
		try{
		String sql= "SELECT * FROM quser ORDER BY name";
		stmt= conn.prepareStatement(sql);
		rs= stmt.executeQuery(); 
		
		ArrayList<AdminUserObj> users = new ArrayList<AdminUserObj>();
		while(rs.next()) {
			users.add(new AdminUserObj(rs.getString("id"), rs.getString("name"), rs.getString("univ"), rs.getString("depart"), rs.getInt("point"), rs.getInt("ticket")));
			
		}
		return users;
		} finally{
		if(rs!= null) rs.close();
		if(stmt!= null) stmt.close();
		if(conn!= null) conn.close();
		}
	}
}
