import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class servletProgram2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        float p = Float.parseFloat(req.getParameter("pAmt"));
        float annualRate = Float.parseFloat(req.getParameter("rate")); 
        float monthlyRate = annualRate / 12;
        float n = Float.parseFloat(req.getParameter("loanPeriod")) * 12; 
        float ratePow = (float) Math.pow(1 + monthlyRate, n);
        float mp = (p * monthlyRate * ratePow) / (ratePow - 1);
        out.println("Principal Amount : " + p + "<br>"
                + "Annual Interest Rate : " + annualRate + "<br>"
                + "Monthly Interest Rate : " + monthlyRate + "<br>"
                + "Loan Period (in months) : " + n + "<br>"
                + "Monthly Payment : " + mp + "<br>");
    }
}
