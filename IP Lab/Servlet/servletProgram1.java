
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class servletProgram1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String name = req.getParameter("empName");
        int id = Integer.parseInt(req.getParameter("empId"));
        float basicPay = Float.parseFloat(req.getParameter("bPay"));
        float hra = Float.parseFloat(req.getParameter("hra"));
        float GrossSalary = basicPay + hra;
        out.println("Name : " + name + "<br>"
                + "ID : " + id + "<br>"
                + "Basic Pay : " + basicPay + "<br>"
                + "HRA : " + hra + "<br>"
                + "Gross Salary :" + GrossSalary);
    }

}
