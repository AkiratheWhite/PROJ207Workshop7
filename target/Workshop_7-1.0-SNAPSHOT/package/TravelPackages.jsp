<%--
  Created with IntelliJ IDEA.
  User: Texin Otinguey
  Date: May 10, 2021 / 0010
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Travel Packages</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/package/javascript/TravelPackagesJS.js"></script>
</head>
<body>
    <div class="container py-4">
        <div class="d-flex justify-content-around">
            <h2>Travel Packages</h2>
            <a href="${pageContext.request.contextPath}/travel-package/add-a-travel-package">
                <button class="btn btn-primary">Add a New Travel Package</button>
            </a>
        </div>

        <table id="travel-packages-table" class="table text-center">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Travel Package Name</th>
                    <th scope="col">Start Date</th>
                    <th scope="col">End Date</th>
                    <th scope="col">Description</th>
                    <th scope="col">Base Price</th>
                    <th scope="col">Agency Commission</th>
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
</body>
<script>
    $(document).ready(function () {
        createTravelPackagesList();

        // If browser back button was used, flush cache.
        (function () {
            window.onpageshow = function(event) {
                if (event.persisted) {
                    window.location.reload();
                }
            };
        })();
    });
</script>
</html>
