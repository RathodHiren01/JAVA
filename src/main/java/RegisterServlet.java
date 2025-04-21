import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(RegisterServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Creating connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Forever", "root", "");

            // ✅ FIXED SQL Query (removed extra comma)
            String query = "INSERT INTO user (name, email, password) VALUES (?, ?, ?)";
            ps = con.prepareStatement(query);

            // Hash the password before inserting it into the database
            String hashedPassword = hashPassword(password);

            // ✅ FIXED Parameter Indexing
            ps.setString(1, name);
            ps.setString(2, email); // Changed from 3 to 2
            ps.setString(3, hashedPassword); // Changed from 4 to 3

            int count = ps.executeUpdate();
            if (count > 0) {
                out.println("<h3 style='color:green'>User registered successfully</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.forward(request, response); // No need for include()
            } else {
                out.println("<h3 style='color:red'>User not registered</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/sign.jsp");
                rd.include(request, response);
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Exception occurred during registration", e);
            out.println("<h3 style='color:red'>Exception Occurred: " + e.getMessage() + " </h3>");
            RequestDispatcher rd = request.getRequestDispatcher("/sign.jsp");
            rd.include(request, response);
        } finally {
            // Close resources
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Error closing resources", e);
            }
        }
    }

    // Method to hash the password using SHA-256
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashedBytes = md.digest(password.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hashedBytes) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }
}
