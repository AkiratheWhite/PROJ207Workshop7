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
    <%@include file="../partials/navbar.jsp"%>

    <div class="container-fluid">
        <div class="row">
            <nav class="col-sm-auto bg-light sticky-top">
                <div class="d-flex flex-sm-column flex-row flex-nowrap bg-light align-items-center sticky-top">
                    <ul class="nav nav-pills nav-flush flex-sm-column flex-row flex-nowrap mb-auto mx-auto text-center align-items-center">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}" class="nav-link  py-3 px-2" title="Home" data-bs-toggle="tooltip">
                                <i class="bi-house fs-1"></i>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/agent/" class="nav-link py-3 px-2" title="Agents" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Agents">
                                <i class="bi bi-person fs-1"></i>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/bookingdetails/" class="nav-link py-3 px-2" title="Booking Details" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Booking Details">
                                <i class="bi bi-journal fs-1"></i>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/travel-package/" class="nav-link active py-3 px-2" title="Travel Packages" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Travel Packages">
                                <i class="bi bi-table fs-1"></i>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/customer/" class="nav-link py-3 px-2" title="Customers" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Customers">
                                <i class="bi-people fs-1"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="col-sm p-3 min-vh-100" id="content">
                <div class="card mb-4">
                    <div class="card-header">
                        <div class="d-flex justify-content-around">
                            <h2>Travel Packages</h2>
                            <a href="${pageContext.request.contextPath}/travel-package/add-a-travel-package">
                                <button class="btn btn-outline-primary">Add a New Travel Package</button>
                            </a>
                        </div>
                    </div>

                    <div class="card-body py-4">
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
                </div>
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
