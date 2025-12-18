package crud;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoFactory {
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/sistemacompravenda"; 
	private static final String USER = "root"; 
	private static final String PASSWORD = ""; 
	
	public static Connection conectar() throws SQLException {  
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
}
