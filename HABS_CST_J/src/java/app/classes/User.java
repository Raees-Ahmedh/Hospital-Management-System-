package app.classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User {

    private int id;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String phone;
    private String specialization;
    private String gender;
    private String dob;


    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = MD5.getMd5(password);
    }

    public User(String firstname, String lastname, String username, String password, String phone, String gender, String dob) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.password = MD5.getMd5(password);
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
    }

    public User(String firstname, String lastname, String specialization, String gender, String phone, String username) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.specialization = specialization;
        this.gender = gender;
        this.phone = phone;
    }
    
    public User(int id, String firstname, String lastname, String specialization, String gender, String phone, String username) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.specialization = specialization;
        this.gender = gender;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getPhone() {
        return phone;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSpecialization() {
        return specialization;
    }

    public String getUsername() {
        return username;
    }

    public String getGender() {
        return gender;
    }
    
    

    public boolean register(Connection con) {
        try {
            String query = "INSERT INTO patient(firstname, lastname, email, phone, password, gender, dob) VALUES(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.firstname);
            pstmt.setString(2, this.lastname);
            pstmt.setString(3, this.username);
            pstmt.setString(4, this.phone);
            pstmt.setString(5, this.password);
            pstmt.setString(6, this.gender);
            pstmt.setString(7, this.dob);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean authenticate(Connection con) {
        try {
            String query = "SELECT patient_id, password FROM patient WHERE email = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String db_password = rs.getString("password");
                if (db_password.equals(this.password)) {
                    int patient_id = rs.getInt("patient_id");
                    this.setId(patient_id);
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean authenticateAdmin(Connection con) {
        try {
            String query = "SELECT admin_id, password FROM admin WHERE username = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String db_password = rs.getString("password");
                if (db_password.equals(this.password)) {
                    int admin_id = rs.getInt("admin_id");
                    this.setId(admin_id);
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }


    public boolean adddoctor(Connection con) {
        try {
            String query = "INSERT INTO doctor(firstname, lastname, specialization, gender, phone, email ) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.firstname);
            pstmt.setString(2, this.lastname);
            pstmt.setString(3, this.specialization);
            pstmt.setString(4, this.gender);
            pstmt.setString(5, this.phone);
            pstmt.setString(6, this.username);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public List<User> getAllDoctors(Connection con) {
        List<User> doctorList = new ArrayList<>();

        
        try {
            String query = "SELECT * FROM doctor";
            PreparedStatement pstmt = con.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                User user = new User(rs.getInt("doctor_id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("specialization"), rs.getString("gender"), rs.getString("phone"), rs.getString("email"));
                doctorList.add(user);
            }

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

        return doctorList;
    }

}
