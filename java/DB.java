import java.sql.*;

public class DB {

    public static Connection connect(String url, String user, String pass) {
	try {
	    DriverManager.registerDriver((Driver)Class.forName("org.apache.hive.jdbc.HiveDriver").newInstance());
	    return DriverManager.getConnection(url, user, pass);
	} catch(Throwable t) {
	    throw new RuntimeException(t);
	}
    }
}
