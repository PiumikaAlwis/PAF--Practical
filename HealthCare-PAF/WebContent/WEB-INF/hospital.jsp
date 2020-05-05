<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
	//Save---------------------------------
	if (request.getParameter("hospitalname") != null) {
		Hospital itemObj = new Hospital();
		String stsMsg = "";

		//Insert--------------------------
		if (request.getParameter("hidIDSave") == "") {
			stsMsg = itemObj.insertItem(request.getParameter("hospitalname"), request.getParameter("address"),
					request.getParameter("hotline"),request.getParameter("contact"), request.getParameter("dis"));
		} else

		//Update----------------------
		{
			stsMsg = itemObj.updateItem(request.getParameter("hidIDSave"), request.getParameter("hospitalname"),
					request.getParameter("address"), request.getParameter("hotline"),request.getParameter("contact"),
					request.getParameter("dis"));
		}
		session.setAttribute("statusMsg", stsMsg);
	}

	//Delete-----------------------------
	if (request.getParameter("hidIDDelete") != null) {
		Hospital hosObj = new Hospital();
		String stsMsg = hosObj.deleteHospital(request.getParameter("hidIDDelete"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="form">
			<div class="colum-1">
				<form id="formHospital" name="formHospital" method="post" action="hospital.jsp">
					Name of the Hospital: <input id="hospitalname" name="haspitalname" type="text" class="form-control form-control-sm">
				<br>
					Address:<input id="address" name="address" type="text" class="form-control form-control-sm"> 
				<br> 
					Emergency Contact: <input id="hotline" name="hotline" type="text" class="form-control form-control-sm"> 
				<br> 
					Regular Contact number: <input id="contact" name="contact" type="text" class="form-control form-control-sm"> 
				<br> 
					Description: <input id="dis" name="dis" type="text" class="form-control form-control-sm"> 
				<br> 
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					<input type="hidden" id="hidIDSave" name="hidIDSave" value="">
				</form>

			</div>
		</div>
	</div>
	
	<div id="alert-success" class="alert alert-success">
		<%
			out.print(session.getAttribute("statusMsg"));
		%>
	</div>

	<div id="alert-error" class="alert alert-error"></div>

	<br>
	<%
		Hospital hosobj = new Hospital();
		out.print(hosobj.readHospital());
	%>

</body>
</html>