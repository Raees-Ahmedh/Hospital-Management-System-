package app.classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Schedule {

    private int pid;
    private int schedule_id;
    private int doctor_id;
    private String title;
    private String scheduledate;
    private String scheduletime;
    private int nop;
    private float fee;
    
    private String firstname;
    private String lastname;
    private String specialization;
    private String gender;
    private String phone;
    private String email;

    public Schedule() {
    }

    public Schedule(int doctor_id, String title, String scheduledate, String scheduletime, int nop, float fee) {
        this.doctor_id = doctor_id;
        this.title = title;
        this.scheduledate = scheduledate;
        this.scheduletime = scheduletime;
        this.nop = nop;
        this.fee = fee;
    }

    public Schedule(int schedule_id, int doctor_id, String title, String scheduledate, String scheduletime, int nop, float fee, String firstname, String lastname, String specialization, String gender, String phone, String email) {
        this.schedule_id = schedule_id;
        this.doctor_id = doctor_id;
        this.title = title;
        this.scheduledate = scheduledate;
        this.scheduletime = scheduletime;
        this.nop = nop;
        this.fee = fee;
        this.firstname = firstname;
        this.lastname = lastname;
        this.specialization = specialization;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
    }

    public int getSchedule_id() {
        return schedule_id;
    }
    
    public String getTitle() {
        return title;
    }

    public String getScheduledate() {
        return scheduledate;
    }

    public String getScheduletime() {
        return scheduletime;
    }

    public float getFee() {
        return fee;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getEmail() {
        return email;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
    
    
    
    public boolean addSchedule(Connection con) {
        try {
            String query = "INSERT INTO schedule (doctor_id, title, scheduledate, scheduletime, nop, fee) VALUES(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, doctor_id);
            pstmt.setString(2, title);
            pstmt.setString(3, scheduledate);
            pstmt.setString(4, scheduletime);
            pstmt.setInt(5, nop);
            pstmt.setFloat(6, fee);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public List<Schedule> getAllSchedules(Connection con){
        List<Schedule> schedules = new ArrayList<>();

        try {
            String query = "SELECT * FROM schedule INNER JOIN doctor ON schedule.doctor_id=doctor.doctor_id";
            PreparedStatement pstmt = con.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Schedule schedule = new Schedule(rs.getInt("schedule_id"), rs.getInt("doctor_id"), rs.getString("title"), rs.getString("scheduledate"), rs.getString("scheduletime"), rs.getInt("nop"), rs.getFloat("fee"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("specialization"), rs.getString("gender"), rs.getString("phone"), rs.getString("email"));
                schedules.add(schedule);
            }

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return schedules;
    }
    
}
