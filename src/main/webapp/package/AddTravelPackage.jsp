<%--
  Created with IntelliJ IDEA.
  User: Texin Otinguey
  Date: May 08, 2021 / 0008
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add a Travel Package</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/package/javascript/AddTravelPackageJS.js"></script>
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
                        <a href="${pageContext.request.contextPath}/travel-package/" class="nav-link active py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Travel Packages">
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
        <div class="col-sm p-3 min-vh-100">
            <div class="container py-4">
                <form id="TravelPackageForm" onsubmit="AddTravelPackage()">
                    <div class="d-flex flex-column col-12 col-md-6 m-auto">
                        <h2 class="text-center">Add New Travel Package</h2>
                        <label for="PkgName">
                            <input class="form-control m-2 p-2" type="text" name="PkgName" placeholder="Package Name" id="PkgName" required>
                        </label>

                        <label for="PkgStartDate">
                            <input class="form-control m-2 p-2" type="datetime-local" step="any" min="1900-01-01T00:00:00" max="3000-01-01T00:00:00" id="PkgStartDate" name="PkgStartDate" placeholder="Start Date">
                        </label>

                        <label for="PkgEndDate">
                            <input class="form-control m-2 p-2" type="datetime-local" step="any" min="1900-01-01T00:00:00" max="3000-01-01T00:00:00" id="PkgEndDate" name="PkgEndDate" placeholder="End Date">
                        </label>

                        <label for="PkgDesc">
                            <textarea required class="form-control m-2 p-2" name="PkgDesc" id="PkgDesc" placeholder="Description" maxlength="50"></textarea>
                        </label>

                        <label for="PkgBasePrice">
                            <input class="form-control m-2 p-2" type="number" step=".0001" min="0" pattern="[0-9]+([\.,][0-9]+)?" name="PkgBasePrice" id="PkgBasePrice" placeholder="Base Price" required>
                        </label>

                        <label for="PkgAgencyCommission">
                            <input required class="form-control m-2 p-2" type="number" step=".0001" min="0" pattern="[0-9]+([\.,][0-9]+)?" name="PkgAgencyCommission" id="PkgAgencyCommission" placeholder="Agency Commission">
                        </label>

                        <button id="btnSubmit" class="btn btn-primary m-2 p-2" type="submit">Submit</button>
                        <div id="statusMessage" class="form-control m-2 p-2"></div>
                    </div>
                </form>

                <div class="d-flex justify-content-center">
                    <a href="${pageContext.request.contextPath}/travel-package/">
                        <button class="btn btn-secondary">Back to List</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    $(document).ready(() =>{
        // Set DateTimeLocal Inputs to Today's date.
        $("#PkgStartDate").val(new Date().toJSON().slice(0,19));
        $("#PkgEndDate").val(new Date().toJSON().slice(0,19));
    });
</script>
</html>

