import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;

public class servletProgram4and5 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String[] selectedBooks = req.getParameterValues("books");
        if (selectedBooks != null && selectedBooks.length > 0) {
            StringBuilder booksBuilder = new StringBuilder();
            for (String book : selectedBooks) {
                booksBuilder.append(book).append(",");
            }
            String selectedBooksStr = booksBuilder.deleteCharAt(booksBuilder.length() - 1).toString(); 
            
            Cookie selectedBooksCookie = new Cookie("selectedBooks", selectedBooksStr);
            selectedBooksCookie.setMaxAge(60 * 60 * 24);
            res.addCookie(selectedBooksCookie);
            
            res.sendRedirect("books.jsp");
        } else {
            res.getWriter().println("Please select at least one book.");
        }
    }
}

<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jakarta.servlet.http.Cookie"%>
<%@page import="java.util.Arrays"%>
<%@page language="java"contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Selected Books</title>
    </head>
    <body>
        <h1>Selected Books</h1>
        <%
            // Retrieve the selected books from the cookie
            String selectedBooksStr = null;
            Cookie[] cookies = request.getCookies();if(cookies!=null)
            {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("selectedBooks")) {
                        selectedBooksStr = cookie.getValue();
                        break;
                    }
                }
            }
            // Display the selected books
            if(selectedBooksStr!=null&&!selectedBooksStr.isEmpty())
            {
                String[] selectedBooks = selectedBooksStr.split(",");
            %>
                <ul>
                    <% for (String book : selectedBooks) { %>
                        <li><%= book %></li>
                    <% } %>
                </ul>
            <% 
            } else {
                out.println("<p>No books selected.</p>");
            }
            %>
        </body>
    </html>
