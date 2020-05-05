package com;

import model.Hospital;
import com.google.gson.*;

//For REST Service
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

//For JSON

//For XML
import org.jsoup.*;
import org.jsoup.parser.*;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.jsoup.nodes.Document;

@Path("/Hospital")

public class HospitalService {
	Hospital hosObj = new Hospital();

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)

	public String readHospital() {
		return hosObj.readHospital();
	}

	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertHospital(@FormParam("hospitalName") String hospitalName, @FormParam("address") String address,
			@FormParam("hotline") String hotline, @FormParam("contactNumber") String contactNumber,
			@FormParam("disctription") String disctription){
		String output = hosObj.insertHospital(hospitalName, address, hotline, contactNumber, disctription);

		return output;
	}

	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateHospital(String hospitalData) {

		// Convert the input string to a JSON object
		JsonObject hospitalObject = new JsonParser().parse(hospitalData).getAsJsonObject();

		// Read the values from the JSON object
		String hos_Id = hospitalObject.get("hos_Id").getAsString();
		String hospitalName = hospitalObject.get("hospitalName").getAsString();
		String address = hospitalObject.get("address").getAsString();
		String hotline = hospitalObject.get("hotline").getAsString();
		String contactNumber = hospitalObject.get("contactNumber").getAsString();
		String discription = hospitalObject.get("discription").getAsString();
		

		String output = hosObj.updateHospital(hos_Id, hospitalName, address, hotline, contactNumber, discription);
		return output;
	}
	

	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteHospital(String hospitalData) {
		// Convert the input string to an XML document
		Document doc = Jsoup.parse(hospitalData, "", Parser.xmlParser());

		// Read the value from the element <docId>
		String hos_Id = doc.select("hos_Id").text();
		
		String output = hosObj.deleteHospital(hos_Id);
		return output;
	}
}

