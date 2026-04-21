package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/rural_service_finder",
                "root",
                "Harshita2311"
            );

        } catch (Exception e) {
            e.printStackTrace();  // VERY IMPORTANT (shows real error)
        }

        return con;
    }
}