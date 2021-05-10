<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Booking Details</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
</head>
<body>

<div class="container py-4">
    <h2 class="text-center">Add New Booking Detail</h2>
    <%@include file="./components/BookingForm.jsp"%>
    <div class="d-flex justify-content-center">
        <a href="${pageContext.request.contextPath}/bookingdetails/">
            <button class="btn btn-secondary">Back to List</button>
        </a>
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
            url: "http://localhost:8080/Workshop_7_war_exploded/api/booking/add-booking",
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

