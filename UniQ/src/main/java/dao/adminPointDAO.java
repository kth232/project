package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class adminPointDAO {
	
	public boolean update(int pno, String item, int ea, int price) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		try {
				String sql = "update pointshop set item = ?, ea = ?, price = ? where pno = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, item);
				stmt.setInt(2, ea);
				stmt.setInt(3, price);
				stmt.setInt(4, pno);
				
				int count = stmt.executeUpdate();
				
				return (count ==1) ? true : false;
		}
		finally {
			if(stmt != null) stmt.close();
			if(conn != null)conn.close();
		}
	}	
}
