$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});

// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
});

// Form validation-------------------
var status = validateHospitalForm();
if (status != true) {
	$("#alertError").text(status);
	$("#alertError").show();
	return;
}

// If valid------------------------
$("#formItem").submit();

// UPDATE==========================================
$(document).on(
		"click",
		".btnUpdate",
		function(event) {
			$("#hidIDSave").val(
					$(this).closest("tr").find('#hidIDUpdate').val());
			$("#hospitalname").val($(this).closest("tr").find('td:eq(0)').text());
			$("#address").val($(this).closest("tr").find('td:eq(1)').text());
			$("#hotline").val($(this).closest("tr").find('td:eq(2)').text());
			$("#contact").val($(this).closest("tr").find('td:eq(3)').text());
			$("#dis").val($(this).closest("tr").find('td:eq(3)').text());
		});

// CLIENT-MODEL================================================================
function validateHospitalForm() {
	// HOSPITAL NAME
	if ($("#hospitalname").val().trim() == "") {
		return "Insert Hospital name.";
	}
	// ADDRESS
	if ($("#address").val().trim() == "") {
		return "Insert Hospital Address.";
	}
	// HOT-LINE-------------------------------
	if ($("#hotlien").val().trim() == "") {
		return "Insert Emergency contact.";
	}
	/*// is numerical value
	var tmpPrice = $("#itemPrice").val().trim();
	if (!$.isNumeric(tmpPrice)) {
		return "Insert a numerical value for Item Price.";
	}
	// convert to decimal price
	$("#itemPrice").val(parseFloat(tmpPrice).toFixed(2));*/
	
	// CONTACT NUMBER 
	if ($("#contact").val().trim() == "") {
		return "Insert Regular contact number.";
	}
	
	// DESCRIPTION------------------------
	if ($("#dis").val().trim() == "") {
		return "Insert Description.";
	}
	return true;
}
