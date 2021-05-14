<%--
  Created by IntelliJ IDEA.
  User: Chester
  Date: 5/10/2021
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customers</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/AllCustomers.js"></script>
</head>
<body>
<%@include file="../partials/navbar.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-auto bg-light sticky-top">
            <div class="d-flex flex-sm-column flex-row flex-nowrap bg-light align-items-center sticky-top">
                <ul class="nav nav-pills nav-flush flex-sm-column flex-row flex-nowrap mb-auto mx-auto text-center align-items-center">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}" class="nav-link  py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Home">
                            <i class="bi-house fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/agent/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Agents">
                            <i class="bi bi-person fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/bookingdetails/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Booking Details">
                            <i class="bi bi-journal fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/travel-package/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Travel Packages">
                            <i class="bi bi-table fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/" class="nav-link active py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Customers">
                            <i class="bi-people fs-1"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm p-3 min-vh-100">
            <div class="card mb-4">
                <div class="card-header">
                    <div class="d-flex justify-content-around">
                        <h2>Customers</h2>
                        <a href="${pageContext.request.contextPath}/customer/AddCustomer">
                            <button class="btn btn-outline-primary">Add Customer</button>
                        </a>
                    </div>
                </div>

                <div class="card-body py-4">
                    <table  id="CustomerTable" class="table text-center">
                        <thead class="table-dark">
                        <tr>
                            <th scope="col">Customer ID</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Address</th>
                            <th scope="col">City</th>
                            <th scope="col">Province</th>
                            <th scope="col">Postal</th>
                            <th scope="col">Country</th>
                            <th scope="col">Home Phone</th>
                            <th scope="col">Business Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Agent ID</th>
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
            createCustomerList();
        })
    </script>
</html>
