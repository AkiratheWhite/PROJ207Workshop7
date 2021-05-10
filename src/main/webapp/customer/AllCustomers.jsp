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
    <%@include file="../partials/bootsrap_jquery.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/AllCustomers.js"></script>
</head>
<body>
    <div class="container py-4">
        <div class="d-flex justify-content-around">
            <h2>Customers</h2>
            <a href="${pageContext.request.contextPath}/customer/AddCustomer">
                <button class="btn btn-primary">Add Customer</button>
            </a>
        </div>

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
            createCustomerList();
        })
    </script>
</html>
