package app.classes;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Function {

    private int id;
    private int doctor_id;
    

    public Function(int id) {
        this.id = id;
    }

    public boolean deleteappointment(Connection con) {
        try {
            String query = "DELETE FROM appoint WHERE appointment_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
}
