package db.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnector {

	// DBConnector는 Connection을 생성
	private Connection con;
	private DBConnector() {
		try {
			// ojdbc6.jar 메모리 로드
			Class.forName(DBConfig.DRIVER);
			con = DriverManager.getConnection(DBConfig.URL, DBConfig.USER, DBConfig.PASSWORD);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	};
	
	private static DBConnector instance = new DBConnector();
	// Connection을 가지고 있는 instance 반환
	public static DBConnector getInstance() {
		if(instance == null)
			instance = new DBConnector();
		return instance;
	}

	public Connection getConnection() {
		if(con == null)
			instance = new DBConnector();
		return con;
	}
	
	public static void close(PreparedStatement ps, ResultSet rs) {
		try {
			if(ps != null) ps.close();
			if(rs != null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
}
