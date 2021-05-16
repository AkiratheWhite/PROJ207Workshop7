/**
 *
 * Coded by: Texin Otinguey
 *
 */

// Declare globally scoped variable to store PackageId from cookie.
let packageId = getCookie("PackageID");


/**
 *
 * Load Travel Package data to Form
 *
 */
function loadTravelPackage(){
    console.log("[PULLED FROM COOKIES - PackageID]: " + packageId);

    /**
     *
     * Get Method to Populate Text Boxes for Packages
     *
     */
    $.ajax({
        type: "GET",
        async: true,
        url: "/Workshop_7_war_exploded/api/package/get-package-by-id/" + packageId,
        dataType: "json",
        success: function (data) {
            // For Loop to Populate Text Boxes
            $.each(data, function (key, value) {

                //console.log("Key: " + key + "; " + "Value: " + value + "; ")

                // If the data key value is equal to the names
                // - Put key value pair to input of type datetime-local.
                if(key === "PkgStartDate" ||
                    key === "PkgEndDate") {
                    // Try to Parse the Date Value
                    const dateValue = new Date(value);
                    //const dateValue = Date.parse(value);

                    // Format the dateValue to Date Time Local and put it on the dateString value
                    // Pass the dateString value to the Date Time Picker
                    const dateString = (dateValue.toDatetimeLocal());
                    $("input[type=datetime-local][name=" + key + "]").val(dateString);

                    // Print
                    //console.log("Date: "+ dateString);
                } else {
                    // Continue to put the key value pairs in input.
                    $("input[type=text][name=" + key +"]").val(value);
                    $("input[type=number][name=" + key +"]").val(value);
                    $("textarea[name=" + key +"]").val(value);
                }
            });

        },

        error: function(data) {
            $("#statusMessage").html(data);
            console.log("[ERROR]: " + data);
        }
    });
}

/**
 *
 * Travel Package Function to add a new Travel Package to the Travel Experts Database
 *
 */
function EditTravelPackage() {
    // Put Submit Button ID to a variable
    let submit_Button = $("#btnSubmit");

    // Set the Submit Buttons Attributes to disable.
    submit_Button.attr("disabled", "");
    submit_Button.removeAttr("type");

    // Serialize the Data received from the Form
    const formData = $("#TravelPackageForm").serializeArray();

    // Push Package ID to formData array.
    formData.push({'name': 'PackageId', 'value': packageId.toString()});

    // Create Empty Array Object
    let formObject = {};

    // For Loop to loop the formData and put it in the formObject Array
    $.each(formData, function (index){
        if(formData[index]["name"] === "PkgStartDate" ||
           formData[index]["name"] === "PkgEndDate"){
            // Try to Parse the Date Value
            let dateValue = new Date(formData[index]["value"]);

            // Print unformatted dateValue
            //console.log("[UNFORMATTED]: " + dateValue)

            // Convert dateValue to ISOString
            dateValue = (dateValue.toISOString());

            // Print
            //console.log("[FORMATTED]: " + dateValue)

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
     * Put Method to update Travel Package
     *
     */
    $.ajax({
        type: "PUT",
        url: "/Workshop_7_war_exploded/api/package/update-package/" + packageId.toString(),
        data: formJSON,
        dataType: "json",
        contentType: "application/json",

        beforeSend: function() { $("#statusMessage").html("Awaiting response...")},

        success: function(data) { $("#statusMessage").html(data);
            window.location.replace("http://localhost:8080/Workshop_7_war_exploded/travel-package");
            
            // Clear Cookie
            document.cookie = "PackageID= ; path=/"
        },

        error: function(data) {
            $("#statusMessage").html(data);

            // Clear Cookie
            document.cookie = "PackageID= ; path=/"
        }

    });
}

/**
 *
 * Gets the data from cookies
 * @param name To be compared with the given string.
 * @returns {string|null} Returns cookie value. || Returns Null if not found.
 *
 */
function getCookie(name) {
    // Split cookie string and get all individual name=value pairs in an array
    let cookieArray = document.cookie.split(";");

    // Loop through the array elements
    for(let i = 0; i < cookieArray.length; i++) {
        let cookiePair = cookieArray[i].split("=");

        /* Removing whitespace at the beginning of the cookie name
        and compare it with the given string. */
        if(name === cookiePair[0].trim()) {
            // Decode the cookie value and return
            return decodeURIComponent(cookiePair[1]);
        }
    }

    // Return null if not found
    return null;
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


