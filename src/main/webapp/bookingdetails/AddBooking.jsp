<%--Code written by: dhaval shaha--%>
<%--Last modified on (DD/MM/YY): 05/14/21--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Booking Details</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
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
                        <a href="${pageContext.request.contextPath}/agent/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Dashboard">
                            <i class="bi bi-person fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/bookingdetails/" class="nav-link active py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Agents">
                            <i class="bi bi-journal fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/travel-package/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Booking Details">
                            <i class="bi bi-table fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Travel Experts">
                            <i class="bi-people fs-1"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm p-3 min-vh-100">
            <div class="container py-4">
                <h2 class="text-center">Add New Booking Detail</h2>
                <%@include file="./components/BookingForm.jsp"%>
                <div class="d-flex justify-content-center">
                    <a href="${pageContext.request.contextPath}/bookingdetails/">
                        <button class="btn btn-secondary">Back to List</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    function HandleSubmitBookings(event) {
        event.preventDefault();
        $("#btnSubmit").attr("disabled", "");
        $("#btnSubmit").removeAttr("type");

        const formData = $("#BookingDetailForm").serializeArray();

        var formObject = {};

        for (let i = 0; i < formData.length; i++){
            formObject[formData[i]['name']] = formData[i]['value'];
        }

        const formJSON = JSON.stringify(formObject)

        $.ajax({
            type: "POST",
            url: "http://localhost:8080/Workshop_7_war_exploded/api/booking",
            data: formJSON,
            dataType: "text",
            contentType: "application/json",
            beforeSend: function() { $("#statusMessage").html("Awaiting response...")},
            success: function(data) { $("#statusMessage").html(data);
                window.location.replace("${pageContext.request.contextPath}/bookingdetails/");
            },
            error: function(data) { $("#statusMessage").html(data);}
        });
    }
</script>
</body>
</html>

