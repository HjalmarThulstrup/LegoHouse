<%-- 
    Document   : orders
    Created on : Mar 21, 2018, 7:05:52 PM
    Author     : juanni420
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="FunctionLayer.OrderEntity"%>
<%@page import="FunctionLayer.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders Page</title>
        <link href="stylesheet.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%@include file="nav.jsp" %>
        <% ArrayList<OrderEntity> ordersList = (ArrayList) session.getAttribute("orders");%>
        <h1 class="center">Here you can view your orders</h1>
        <div class="wrapper">
        <% for (OrderEntity order : ordersList) {
                out.println("<p><b>Order Id:</b> " + order.getId() + ", <b>Length:</b> " + order.getLength()
                        + ", <b>Width:</b> " + order.getWidth() + ", <b>Height:</b> " + order.getHeight()
                        + ", <b>Status:</b> " + order.getStatus() + "</p>");
            }
        %>
        <h2 class="center">View pieces list of orders below</h2>
            <form name="changeStatus" class="center" action='FrontController' method='post'>
                <input type="hidden" name="command" value="viewPieces">
                <select name="orderId">
                    <% for (OrderEntity order : ordersList) {
                            out.println("<option value='" + order.getId() + "'>" + "Order id: " + order.getId() + "</option>");
                        }%>
                </select>
                <input type="submit" value="View pieces for order">
            </form>
        </div>
    </body>
</html>
