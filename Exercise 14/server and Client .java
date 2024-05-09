package expriment14app;
public class Expriment14App {
    public static void main(String[] args) {
        // TODO code application logic here
        if(checkValidUser("admin","admin")){
            System.out.println("Valid Username and Password");
        } else {
            System.out.println("InValid Username and Password");
        }  
    }

    private static Boolean checkValidUser(java.lang.String username, java.lang.String password) {
        servicepackage.MyService_Service service = new servicepackage.MyService_Service();
        servicepackage.MyService port = service.getMyServicePort();
        return port.checkValidUser(username, password);
    }   
}
package servicePackage;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
@WebService(serviceName = "myService")
public class myService {
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    @WebMethod(operationName = "add")
    public int add(@WebParam(name = "a") int a, @WebParam(name = "b") int b) {
        //TODO write your implementation code here:
        return a + b;
    }
    @WebMethod(operationName = "checkValidUser")
    public Boolean checkValidUser(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        //TODO write your implementation code here:
        Connection conn;
        boolean isValid = false;
        try {
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/myUsers", "root", "");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from users where username=name");
            while (rs.next()) {
                String uname = rs.getString(1);
                String pword = rs.getString(2);
                if (uname == username && pword == password) {
                    isValid = false;
                } else {
                    isValid = true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(myService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isValid;
    }
}
