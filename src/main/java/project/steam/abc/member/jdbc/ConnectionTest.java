package project.steam.abc.member.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConnectionTest {

	@Autowired
	
	DataSource dataSource;
	
	public void connection() {
		
		Connection connection = null;
		
		try {
			
			connection = dataSource.getConnection();
			System.out.println(connection + "과의 데이터베이스 연결에 성공했습니다.");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		}
		
		
	}
	
}
