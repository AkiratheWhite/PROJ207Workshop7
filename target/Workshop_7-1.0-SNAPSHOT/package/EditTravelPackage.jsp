<%--
  Created with IntelliJ IDEA.
  User: Texin Otinguey
  Date: May 10, 2021 / 0010
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Travel Package</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/package/javascript/EditTravelPackage.js"></script>
</head>
<body>
    <div class="container py-4">
        <form id="TravelPackageForm" onsubmit="EditTravelPackage()">
            <div class="d-flex flex-column col-12 col-md-6 m-auto">
                <h2 class="text-center">Edit Travel Package</h2>
                <input class="form-control m-2 p-2" type="text" name="PkgName" placeholder="Package Name" id="PkgName" required>
                <input class="form-control m-2 p-2" step="any" type="datetime-local" name="PkgStartDate" id="PkgStartDate" placeholder="Start Date" min="1900-01-01T00:00:00" max="3000-01-01T00:00:00">
                <input class="form-control m-2 p-2" step="any" type="datetime-local" name="PkgEndDate" id="PkgEndDate" placeholder="End Date" min="1900-01-01T00:00:00" max="3000-01-01T00:00:00">
                <textarea class="form-control m-2 p-2" name="PkgDesc" id="PkgDesc" placeholder="Description" maxlength="50"></textarea>
                <input class="form-control m-2 p-2" type="number" step=".0001" min="0" pattern="[0-9]+([\.,][0-9]+)?" name="PkgBasePrice" id="PkgBasePrice" placeholder="Base Price" required>
                <input class="form-control m-2 p-2" type="number" step=".0001" min="0" pattern="[0-9]+([\.,][0-9]+)?" name="PkgAgencyCommission" id="PkgAgencyCommission" placeholder="Agency Commission">
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
    $(document).ready(() => {
        loadTravelPackage()

        // Set DateTimeLocal Inputs to Today's date.
        $("#PkgStartDate").val(new Date().toJSON().slice(0,19));
        $("#PkgEndDate").val(new Date().toJSON().slice(0,19));
    });
</script>
</html>
