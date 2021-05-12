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
</body>
<script>
    $(document).ready(() =>{
        // Set DateTimeLocal Inputs to Today's date.
        $("#PkgStartDate").val(new Date().toJSON().slice(0,19));
        $("#PkgEndDate").val(new Date().toJSON().slice(0,19));
    });
</script>
</html>

