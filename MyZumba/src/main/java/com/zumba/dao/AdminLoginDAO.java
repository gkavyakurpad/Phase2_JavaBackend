package com.zumba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zumba.db.DBConnection;
import com.zumba.model.AdminData;

public class AdminLoginDAO {

	Connection con;
	
	public List<AdminData> loginAdmin (String username, String password)
	{
		List<AdminData> userList = new ArrayList<AdminData>();
		
		try {
			con = DBConnection.getDbConn();
			
			if(con!=null)
			{
				String sql = "select * from Admin where username=? and password=?";
				
				PreparedStatement ps;
				
				ps = con.prepareStatement(sql);
				ps.setString(1, username);
				ps.setString(2, password);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					AdminData admin = new AdminData();
					admin.setUsername(rs.getString("username"));
					admin.setPassword(rs.getString("password"));
					
					userList.add(admin);
				}
				
			}else {
				System.out.println("Db Connection failed");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userList;
	}
	
}
