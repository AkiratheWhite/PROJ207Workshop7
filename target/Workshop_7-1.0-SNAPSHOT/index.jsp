<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2021-05-02
  Time: 2:31 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Travel Experts Web API</title>
    <%@include file="partials/boostrap_jquery.jsp"%>
</head>
<body>
    <h1>This is the Travel Experts Web API</h1>
<hr>
    &nbsp;&nbsp;&nbsp;<a href="bookingdetails/AllBookings.jsp">
        <button class="btn btn-secondary">Booking Details</button>
    </a>
    <br/>
    <br/>
    <br/>
    &nbsp;&nbsp;&nbsp;<a href="agent/AllAgents.jsp">
        <button class="btn btn-secondary">Agents</button>
    </a>
    <br/>
    <br/>
    <br/>
    &nbsp;&nbsp;&nbsp;<a href="customer/AllCustomers.jsp">
        <button class="btn btn-secondary">Customes</button>
    </a>
    <br/>
    <br/>
    <br/>
    &nbsp;&nbsp;&nbsp;<a href="package/TravelPackages.jsp">
        <button class="btn btn-secondary">Packages</button>
    </a>

</body>
</html>
