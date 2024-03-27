package com.zumba.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.zumba.dbUtil.DBHelperConstant;

public class DBConnection {

	Connection connection;
	
	private static DBConnection db = new DBConnection();
	
	public static Connection getDbConn() throws ClassNotFoundException, SQLException {
		
		Class.forName(DBHelperConstant.DRIVER_CLASS);
		
		Connection con = DriverManager.getConnection(
				DBHelperConstant.DB_URL,
				DBHelperConstant.USERNAME,
				DBHelperConstant.PASSWORD
				);
		
		return con;
	}
	
}
