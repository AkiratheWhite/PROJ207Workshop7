/**
 *
 * Coded by: Texin Otinguey
 *
 */


/**
 *
 * Travel Package Function to add a new Travel Package to the Travel Experts Database
 *
 */
function AddTravelPackage() {

    // Put Submit Button ID to a variable
    let submit_Button = $("#btnSubmit");

    // Set the Submit Buttons Attributes to disable.
    submit_Button.attr("disabled", "");
    submit_Button.removeAttr("type");

    // Serialize the Data received from the Form
    const formData = $("#TravelPackageForm").serializeArray();

    // Create Empty Array Object
    let formObject = {};

    // For Loop to loop the formData and put it in the formObject Array
    $.each(formData, function (index){
        if(formData[index]["name"] === "PkgStartDate" ||
            formData[index]["name"] === "PkgEndDate"){
            // Empty dateValue
            let dateValue = "";

            // Try to Parse the Date Value
            dateValue = new Date(formData[index]["value"]);

            // Format to be passed in the Travel Experts Database
            dateValue = new Date(dateValue);

            // Print unformatted dateValue
            console.log("[UNFORMATTED]: " + dateValue)

            // Convert dateValue to ISOString
            dateValue = (dateValue.toISOString());

            // Print
            console.log("[FORMATTED]: " + dateValue)

            // Put Value in the Object
            formObject[formData[index]["name"]] = dateValue;
        } else {
            //console.log("[WENT IN THE ELSE STATEMENT]" + formData[index]["name"])
            formObject[formData[index]["name"]] = formData[index]["value"];
        }
    });

    // Convert formObject to JSON String
    const formJSON = JSON.stringify(formObject);

    // Print the JSON to the browser console.
    console.log("[POST RESPONSE] " + formJSON);

    /**
     *
     * Post Method to add a new Travel Package
     *
     */
    $.ajax({
        type: "POST",
        url: "/Workshop_7_war_exploded/api/package/add-package"  ,
        data: formJSON,
        dataType: "json",
        contentType: "application/json",

        beforeSend: function() { $("#statusMessage").html("Awaiting response...")},

        success: function(data) { $("#statusMessage").html(data);
            window.location = ("/Workshop_7_war/travel-package/");
        },

        error: function(data) { $("#statusMessage").html(data);}

    });
}

/**
 *
 * Format the date value to be passed in date time pickers.
 *
 * https://webreflection.medium.com/using-the-input-datetime-local-9503e7efdce
 *
 */
Date.prototype.toDatetimeLocal =
    function toDatetimeLocal() {
        let
            date = this,
            ten = function (i) {
                return (i < 10 ? '0' : '') + i;
            },
            YYYY = date.getFullYear(),
            MM = ten(date.getMonth() + 1),
            DD = ten(date.getDate()),
            HH = ten(date.getHours()),
            II = ten(date.getMinutes()),
            SS = ten(date.getSeconds())
        ;
        return YYYY + '-' + MM + '-' + DD + 'T' +
            HH + ':' + II + ':' + SS ;
    };