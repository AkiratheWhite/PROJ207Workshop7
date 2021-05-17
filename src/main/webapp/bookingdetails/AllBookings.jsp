<%--Code written by: dhaval shaha--%>
<%--Last modified on (DD/MM/YY): 05/14/21--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Booking Details</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bookingdetails/js/AllBookings.js"></script>
</head>
<body>
<%@include file="../partials/navbar.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-auto bg-light sticky-top">
            <div class="d-flex flex-sm-column flex-row flex-nowrap bg-light align-items-center sticky-top">
                <ul class="nav nav-pills nav-flush flex-sm-column flex-row flex-nowrap mb-auto mx-auto text-center align-items-center">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}" class="nav-link  py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" title="Home">
                            <i class="bi-house fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/agent/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Agents">
                            <i class="bi bi-person fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/bookingdetails/" class="nav-link active py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Booking Details">
                            <i class="bi bi-journal fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/travel-package/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Travel Packages">
                            <i class="bi bi-table fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Customers">
                            <i class="bi-people fs-1"></i>
                        </a>
                    </li>
                </ul>
            </div>
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
        <div class="col-sm p-3 min-vh-100">
            <div class="card mb-4">
                <div class="card-header">
                    <div class="d-flex justify-content-around">
                        <h2>All Booking Details</h2>
                        <a href="${pageContext.request.contextPath}/bookingdetails/AddBooking.jsp">
                            <button class="btn btn-outline-primary">Add New Booking Detail</button>
                        </a>
                    </div>
                </div>

                <div class="card-body py-4">
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
                            <th scope="col"></th>
                            <th scope="col"></th>
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
            </div>
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
