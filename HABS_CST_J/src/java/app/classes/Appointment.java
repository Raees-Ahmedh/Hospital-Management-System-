package app.classes;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Appointment {

    private int schedule_id;
    private int patient_id;
    private String date;

    public Appointment(int schedule_id, int patient_id, String date) {
        this.schedule_id = schedule_id;
        this.patient_id = patient_id;
        this.date = date;
    }

    public int addAppointment(Connection con) {
        int appointNum = setApointNumber(con, this.schedule_id);
        //int appointNum = 10;
        if (appointNum != -1) {
            try {
                String query = "INSERT INTO appoint (patient_id,schedule_id,appoint_num,date) VALUES(?,?,?,?)";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setInt(1, this.patient_id);
                pstmt.setInt(2, this.schedule_id);
                pstmt.setInt(3, appointNum);
                pstmt.setString(4, this.date);

                if(pstmt.executeUpdate() > 0){
                    return appointNum;
                }else{
                    return -1;
                }
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
                return -1;
            }
        } else {
            return -1;
        }

    }

    private int setApointNumber(Connection con, int shedule_id) {
        String sql = "select appoint_num from appoint where schedule_id = ?";
        String sql1 = "select nop from schedule where schedule_id = ?";
        PreparedStatement pstmt;
        PreparedStatement pstmt1;
        int[] nums = null;
        int max = 0;
        try {
            pstmt = con.prepareStatement(sql);
            pstmt1 = con.prepareStatement(sql1);
            pstmt.setInt(1, shedule_id);
            pstmt1.setInt(1, shedule_id);
            ResultSet rs = pstmt.executeQuery();
            ResultSet rs1 = pstmt1.executeQuery();

            int count = 0;
            if (rs1.next()) {
                max = rs1.getInt("nop");
            }
            nums = new int[max];
            while (rs.next()) {
                nums[count] = rs.getInt("appoint_num");
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        int num = 1;
        int flag = 0;
        for (int i = 0; i <= max; i++) {
            for (int j = 0; j < nums.length; j++) {
                if (num == nums[j]) {
                    flag++;
                }
            }
            if (flag == 0) {
                flag = 2;
                break;
            } else {
                flag = 0;
                num++;
            }

        }
        if (flag == 2) {
            return num;
        } else {
            return -1;
        }
    }
}
