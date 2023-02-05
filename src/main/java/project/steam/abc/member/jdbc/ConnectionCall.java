package project.steam.abc.member.jdbc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class ConnectionCall {

	private static final Logger logger = LoggerFactory.getLogger(ConnectionCall.class);

	public static void main(String[] args) {
		
		ApplicationContext applicationContext = new GenericXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/root-context.xml");
		logger.info("information", applicationContext);
		
		ConnectionTest connectionTest = applicationContext.getBean(ConnectionTest.class);
		logger.info("" + connectionTest);
		
		connectionTest.connection();
	}
	
}
