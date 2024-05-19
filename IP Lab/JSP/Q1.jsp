<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Records</title>
</head>
<body>
    <h2>Employee Records</h2>
    <a href="add_employee.jsp">New Employee</a>
    <br><br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Position</th>
            <th>Salary</th>
            <th>Edit</th>
        </tr>
        <% 

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
       
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM employee");
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><a href="employee.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("name") %></a></td>
            <td><%= rs.getString("department") %></td>
            <td><%= rs.getString("position") %></td>
            <td><%= rs.getFloat("salary") %></td>
            <td><a href="edit_employee.jsp?id=<%= rs.getInt("id") %>">Edit</a></td>
        </tr>
        <% 
            }
            rs.close();
            stmt.close();
            conn.close();
        %>
    </table>
    <br>
    Total number of employees: 
    <% 
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
        stmt = c.createStatement();
        rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM employee");
        rs.next();
        int totalEmployees = rs.getInt("total");
        rs.close();
        stmt.close();
        c.close();
        out.print(totalEmployees);
    %>
</body>
</html>

employee.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Details</title>
</head>
<body>
    <h2>Employee Details</h2>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
            
        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM employee WHERE id=?");
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()) {
    %>
    <table>
        <tr>
            <td>ID:</td>
            <td><%= rs.getInt("id") %></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><%= rs.getString("name") %></td>
        </tr>
        <tr>
            <td>Department:</td>
            <td><%= rs.getString("department") %></td>
        </tr>
        <tr>
            <td>Position:</td>
            <td><%= rs.getString("position") %></td>
        </tr>
        <tr>
            <td>Salary:</td>
            <td><%= rs.getFloat("salary") %></td>
        </tr>
    </table>
    <%
        }
        rs.close();
        pstmt.close();
        conn.close();
    %>
</body>
</html>

addemployee,jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.io.*, java.nio.file.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add Employee</h2>
    <form action="add_employee_process.jsp" method="post">
        <label for="id">Id:</label>
        <input type="text" id="id" name="id" required><br><br>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" required><br><br>

        <label for="position">Position:</label>
        <input type="text" id="position" name="position" required><br><br>

        <label for="salary">Salary:</label>
        <input type="number" id="salary" name="salary" required><br><br>

        <input type="submit" value="Add Employee">
    </form>
</body>
</html>


edit employee.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.io.*, java.nio.file.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Employee</title>
</head>
<body>
    <h2>Edit Employee</h2>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
            pstmt = conn.prepareStatement("SELECT * FROM employee WHERE id=?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
    %>
    <form action="edit_employee_process.jsp" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= rs.getString("name") %>" required><br><br>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" value="<%= rs.getString("department") %>" required><br><br>

        <label for="position">Position:</label>
        <input type="text" id="position" name="position" value="<%= rs.getString("position") %>" required><br><br>

        <label for="salary">Salary:</label>
        <input type="number" id="salary" name="salary" value="<%= rs.getFloat("salary") %>" required><br><br>

        <input type="submit" value="Save Changes">
    </form>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
</body>
</html>


add_employee_process
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee Process</title>
</head>
<body>
    <%
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        float salary = Float.parseFloat(request.getParameter("salary"));

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
            pstmt = conn.prepareStatement("INSERT INTO employee (id,name, department, position, salary) VALUES (?,?, ?, ?, ?)");
            pstmt.setString(1,id);
            pstmt.setString(2, name);
            pstmt.setString(3, department);
            pstmt.setString(4, position);
            pstmt.setFloat(5, salary);
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
    %>
    <h2>Employee added successfully</h2>
    <%
            } else {
    %>
    <h2>Error adding employee</h2>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
    <h2>Error adding employee</h2>
    <%
        } finally {
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
    <a href="index.jsp">Back to Employee Records</a>
</body>
</html>

edit_employee_process
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Employee Process</title>
</head>
<body>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        float salary = Float.parseFloat(request.getParameter("salary"));

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
            pstmt = conn.prepareStatement("UPDATE employee SET name=?, department=?, position=?, salary=? WHERE id=?");
            pstmt.setString(1, name);
            pstmt.setString(2, department);
            pstmt.setString(3, position);
            pstmt.setFloat(4, salary);
            pstmt.setInt(5, id);
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
    %>
    <h2>Employee updated successfully</h2>
    <%
            } else {
    %>
    <h2>No changes made to employee record</h2>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
    <h2>Error updating employee</h2>
    <%
        } finally {
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
    <a href="index.jsp">Back to Employee Records</a>
</body>
</html>
