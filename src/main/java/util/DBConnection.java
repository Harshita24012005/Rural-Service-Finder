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
                "Harshita123"   // password (empty if XAMPP)
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}