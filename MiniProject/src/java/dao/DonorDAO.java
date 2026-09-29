package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Donor;

public class DonorDAO {

    // CREATE
    public boolean registerDonor(Donor donor) {

    String sql = "INSERT INTO donors "
            + "(name, age, gender, blood_group, phone, email, address, password) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    try {

        Connection con = DBConnection.getConnection();

        if (con == null) {
            System.out.println("ERROR: Database connection is NULL");
            return false;
        }

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, donor.getName());
        ps.setInt(2, donor.getAge());
        ps.setString(3, donor.getGender());
        ps.setString(4, donor.getBloodGroup());
        ps.setString(5, donor.getPhone());
        ps.setString(6, donor.getEmail());
        ps.setString(7, donor.getAddress());
        ps.setString(8, donor.getPassword());

        int result = ps.executeUpdate();

        ps.close();
        con.close();

        return result > 0;

    } catch (Exception e) {

        e.printStackTrace();
        return false;
    }
}

    // LOGIN
    public Donor login(String email, String password) {

        String sql = "SELECT * FROM donors "
                + "WHERE email = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                return new Donor(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getString("blood_group"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("password")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // READ ALL DONORS
    public List<Donor> getAllDonors() {

        List<Donor> donors = new ArrayList<>();

        String sql = "SELECT * FROM donors ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Donor donor = new Donor(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getString("blood_group"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("password")
                );

                donors.add(donor);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return donors;
    }

    // SEARCH BY BLOOD GROUP
    public List<Donor> searchByBloodGroup(String bloodGroup) {

        List<Donor> donors = new ArrayList<>();

        String sql = "SELECT * FROM donors "
                + "WHERE blood_group = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, bloodGroup);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Donor donor = new Donor(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getString("blood_group"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("password")
                );

                donors.add(donor);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return donors;
    }

    // UPDATE
    public boolean updateDonor(Donor donor) {

        String sql = "UPDATE donors SET "
                + "name=?, age=?, gender=?, blood_group=?, "
                + "phone=?, email=?, address=? "
                + "WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, donor.getName());
            ps.setInt(2, donor.getAge());
            ps.setString(3, donor.getGender());
            ps.setString(4, donor.getBloodGroup());
            ps.setString(5, donor.getPhone());
            ps.setString(6, donor.getEmail());
            ps.setString(7, donor.getAddress());
            ps.setInt(8, donor.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteDonor(int id) {

        String sql = "DELETE FROM donors WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // GET DONOR BY ID
    public Donor getDonorById(int id) {

        String sql = "SELECT * FROM donors WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                return new Donor(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getString("blood_group"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("password")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}