<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 <center>
        <% 
        String location = (String)session.getAttribute("location");
        if (location != null) {
            if (location.equalsIgnoreCase("madurai")) { %>
                <h2>Weather Details</h2>
                <h3>City : <%= location %> </h3>
                <h4>Temperature : 31 C</h4>
                <h4>Humidity : 31.0</h4>
                <h4>Wind Speed : 3.1 Knots </h4>
            <% } else if (location.equalsIgnoreCase("chennai")) { %>
                <h2>Weather Details</h2>
                <h3>City : <%= location %> </h3>
                <h4>Temperature : 30 C</h4>
                <h4>Humidity : 29.0</h4>
                <h4>Wind Speed : 2.7 Knots </h4>
            <% } else { %>
                <h2>City Details need to be updated</h2>
            <% }
        } else { %>
            <h2>No location specified</h2>
        <% } %>
    </center>    </body>
</html>
