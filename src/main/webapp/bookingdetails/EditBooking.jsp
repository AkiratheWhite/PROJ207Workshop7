<%--
  Created by IntelliJ IDEA.
  User: 826793
  Date: 5/10/2021
  Time: 1:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Booking Detail</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
</head>
<body>

<div class="container py-4">
    <h2 class="text-center">Edit Booking Detail</h2>
    <%@include file="./components/BookingForm.jsp"%>
    <div class="d-flex justify-content-center">
        <a href="${pageContext.request.contextPath}/bookingdetails">
            <button class="btn btn-secondary">Back to List</button>
        </a>
    </div>
</div>

<script>
    var bookingdetailId;

    $(document).ready(() => {
        const url_string = window.location.href;
        const position = url_string.lastIndexOf("/");
        const BookingDetailID = url_string.substring(position+1, url_string.length);

        fetch("http://localhost:8080/Workshop_7_war_exploded/api/booking/"+BookingDetailID, {
            method: 'GET'
        }).then(response => response.json()).then(data => {
            bookingdetailId = data['BookingDetailID'];
            const values = Object.keys(data);
            for(let i=0; i<values.length; i++) {
                $("#"+values[i]).val(data[values[i]]);
            }
        });
    });

    function HandleSubmit(event) {
        event.preventDefault();
        $("#btnSubmit").attr("disabled", "");
        $("#btnSubmit").removeAttr("type");

        const formData = $("#BookingDetailForm").serializeArray();
        formData.push({'name': 'BookingDetailID', 'value': bookingdetailId.toString()});

        var formObject = {};

        for (let i = 0; i < formData.length; i++){
            formObject[formData[i]['name']] = formData[i]['value'];
        }

        const formJSON = JSON.stringify(formObject)

        $.ajax({
            type: "PUT",
            url: "http://localhost:8080/Workshop_7_war_exploded/api/booking/"+bookingdetailId.toString(),
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
