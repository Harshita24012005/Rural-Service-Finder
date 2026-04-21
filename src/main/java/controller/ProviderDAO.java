package controller;

import java.sql.*;
import java.util.*;

import util.DBConnection;

public class ProviderDAO {

    public List<Provider> getProviders(String village, String service) {

        List<Provider> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM providers WHERE LOWER(village)=LOWER(?) AND LOWER(service)=LOWER(?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, village.trim());
            ps.setString(2, service.trim());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Provider p = new Provider();

                // ✅ CHANGE HERE
                p.setName(rs.getString("full_name"));
                p.setMobile(rs.getString("mobile"));
                p.setVillage(rs.getString("village"));
                p.setService(rs.getString("service"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}