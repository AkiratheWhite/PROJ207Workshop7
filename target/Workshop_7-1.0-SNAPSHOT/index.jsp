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
    <%@ include file="partials/boostrap_jquery.jsp"%>
    <link rel="stylesheet" href="indexCSS.css">
</head>
<body>
<%@include file="/partials/navbar.jsp"%>

    <div class="container-fluid">
        <div class="row">
            <nav class="col-sm-auto bg-light sticky-top">
                <div class="d-flex flex-sm-column flex-row flex-nowrap bg-light align-items-center sticky-top">
                    <ul class="nav nav-pills nav-flush flex-sm-column flex-row flex-nowrap mb-auto mx-auto text-center align-items-center">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}" class="nav-link active py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Home">
                                <i class="bi-house fs-1"></i>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/agent/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Dashboard">
                                <i class="bi bi-person fs-1"></i>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/bookingdetails/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Orders">
                                <i class="bi bi-journal fs-1"></i>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/travel-package/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Products">
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
            </nav>

            <div class="col-sm p-3 min-vh-100" id="content">
                <header id="indexHeader">

                    <section class="header-content">
                        <h1 class="header-title animate-pop-in">Welcome, Travel Experts!</h1>
                    </section>
                </header>

                <!-- Content -->
                <h2>Travel Experts RESTful Web Service API</h2>
                <hr />
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="col">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}/images/pacakgeImage.jpg" class="card-img-top" alt="Travel Packages">
                            <div class="card-body">
                                <h5 class="card-title">Travel Packages</h5>
                                <p class="card-text">View all the Travel Packages from the Travel Experts database.</p>
                            </div>
                            <a href="${pageContext.request.contextPath}/travel-package/" class="btn btn-primary stretched-link">View Travel Packages</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}/images/agents.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Agents</h5>
                                <p class="card-text">View all the Agents from the Travel Experts database.</p>
                            </div>
                            <a href="${pageContext.request.contextPath}/agent/" class="btn btn-primary stretched-link">View Agents</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}/images/booking.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Booking Details</h5>
                                <p class="card-text">View all the Booking Details from the Travel Experts database.</p>
                            </div>
                            <a href="${pageContext.request.contextPath}/bookingdetails/" class="btn btn-primary stretched-link">View Booking Details</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}/images/customers.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Customers</h5>
                                <p class="card-text">View all the Customers from the Travel Experts database.</p>
                            </div>
                            <a href="${pageContext.request.contextPath}/customer/" class="btn btn-primary stretched-link">View Customers</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
