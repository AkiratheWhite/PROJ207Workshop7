<%--
  Created by IntelliJ IDEA.
  User: 826793
  Date: 5/10/2021
  Time: 1:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Agents</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bookingdetails/js/AllBookings.js"></script>
</head>
<body>
<div class="container py-4">
    <div class="d-flex justify-content-around">
        <h2>All Booking Details</h2>
        <a href="${pageContext.request.contextPath}/bookingdetails/AddBooking.jsp">
            <button class="btn btn-primary">Add New Booking Detail</button>
        </a>
    </div>

    <table id="BookingTable" class="table text-center">
        <thead class="table-dark">
        <tr>
            <th scope="col">Booking Detail ID</th>
            <th scope="col">Itinerary Number</th>
            <th scope="col">Trip Start Date</th>
            <th scope="col">Trip End Date</th>
            <th scope="col">Description</th>
            <th scope="col">Destination</th>
            <th scope="col">Base Price</th>
            <th scope="col">Agency Commission</th>
            <th scope="col">Booking Id</th>
            <th scope="col">Region Id</th>
            <th scope="col">Class Id</th>
            <th scope="col">Fee Id</th>
            <th scope="col">Product Supplier Id</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <div id="loadingSpinner" class="d-flex justify-content-center">
        <div class="spinner-grow spinner-grow-sm mx-1" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
        <div class="spinner-grow spinner-grow-sm mx-1" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
        <div class="spinner-grow spinner-grow-sm mx-1" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

</div>
</body>
<script>
    $(document).ready(() => {
        createBookingList();
    });
</script>
</html>
