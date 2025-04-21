import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.nio.file.*;

@WebServlet("/AddItemServlet")
@MultipartConfig
public class AddItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // 1. Get form data
            String productName = request.getParameter("name");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            String subCategory = request.getParameter("subcategory");
            double price = Double.parseDouble(request.getParameter("price"));
            String[] sizes = request.getParameterValues("size");
            boolean bestseller = request.getParameter("bestseller") != null;

            // 2. Process image upload
            Part filePart = request.getPart("image");
            String imageFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Save image to "uploads" folder in webapp directory
            String uploadsDirPath = getServletContext().getRealPath("/") + "uploads";
            File uploadsDir = new File(uploadsDirPath);
            if (!uploadsDir.exists()) uploadsDir.mkdir();
            String imagePath = uploadsDirPath + File.separator + imageFileName;
            filePart.write(imagePath);

            // 3. Prepare sizes as CSV string
            String productSizes = (sizes != null) ? String.join(",", sizes) : "";

            // 4. Connect to database
            String jdbcURL = "jdbc:mysql://localhost:3306/forever";
            String dbUser = "root";
            String dbPass = "";

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

            // ✅ Make sure your 'products' table has a column named 'sizes'
            String query = "INSERT INTO products (name, description, category, subcategory, price, sizes, bestseller, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, productName);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, category);
            preparedStatement.setString(4, subCategory);
            preparedStatement.setDouble(5, price);
            preparedStatement.setString(6, productSizes);
            preparedStatement.setBoolean(7, bestseller);
            preparedStatement.setString(8, imageFileName);

            // 5. Execute and redirect
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("✅ Product added successfully.");
                response.sendRedirect("listitem.jsp");
            } else {
                out.println("<h2>❌ Failed to add product.</h2>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error occurred: " + e.getMessage() + "</h2>");
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: Show info or redirect to form
        response.sendRedirect("additem.jsp");  // or change to homepage
    }
}
