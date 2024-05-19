import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.*;

public class servletProgram3 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String dateString = req.getParameter("birthDate");
        LocalDate birthDate = LocalDate.parse(dateString);
        LocalDate currentDate = LocalDate.now();
        Period age = Period.between(birthDate, currentDate);
        out.println("Birth Date: " + birthDate + "<br>");
        out.println("Current Date: " + currentDate + "<br>");
        out.println("Age: " + age.getYears() + " years");        
    }
}
