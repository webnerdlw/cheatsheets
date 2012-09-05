
<h1> <bmr:dictionary element="Common" attribute="Dict_Gadget_Entry_Form" /> </h1>

<bmb:getImage prodID="845524441761482" imageType="medium" var="myImagePath" />
<img src="${myImagePath}"/>

<%
	boolean wasSubmitted = dnaFormData.getBoolean("wasSubmitted", false);
	
	if (wasSubmitted) {
		DNAList gadgetID = dnaFormMeta.getList("GADGET<>gadget_id");
			boolean isValid = gadgetID.getBoolean("valid", true);
			
			if (!isValid) {
		%>
			<span class='error_message' >Gadget ID is invalid</span><br />
		<%
			}
		
		DNAList gadgetWeight = dnaFormMeta.getList("GADGET<>gadget_weight");
		isValid = gadgetWeight.getBoolean("valid", true);
		
		if (!isValid) {
	%>
		<span class='error_message' >Gadget Weight needs to be between 1 and 200</span><br />
	<%
		}
		
		DNAList gadgetDate = dnaFormMeta.getList("GADGET<>ATR_Gadget_Available_Date");
		isValid = gadgetDate.getBoolean("valid", true);
		
		if (!isValid) {
	%>
		<span class='error_message' ><%= gadgetDate.getString("error", "")%></span><br />
	<%
		}
	
	}
	
	wasSubmitted = true;
	dnaFormData.setBoolean("wasSubmitted", wasSubmitted);
%>

<form name="gadget_entry" method="POST" >
<table>
<tr>
	<td>
	Gadget ID:
	</td>
	<td>
	<input type="hidden" name="GADGET<>gadget_id" length="20" />
	</td>
</tr>
<tr>
	<td>
	Gadget Description:
	</td>
	<td>
	<input type="text" name="GADGET<>gadget_desc" length="20" />
	</td>
</tr>
<tr>
	<td>
	Gadget Weight:
	</td>
	<td>
	<input type="text" name="GADGET<>gadget_weight" required length="20" />
	</td>
</tr>
<tr>
	<td>
	Gadget Price:
	</td>
	<td>
	<input type="text" name="GADGET<>gadget_price" required length="20" />
	</td>
</tr>
<tr>
	<td>
	Gadget Color:
	</td>
	<td>
	<select name="GADGET<>gadget_color" ></select>
	</td>
</tr>
<tr>
	<td>
	Gadget Available Date:
	</td>
	<td>
	<input type="text" name="GADGET<>ATR_Gadget_Available_Date" length="20" />
	</td>
</tr>
</table>
<br />
<input type="submit" name="enter_gadget" value="Submit!" />
<br />
<br />
</form>



<table>
<tr>
<td>
<bmr:renderWidget attr="ATR_Widget_List_Bottom" />
</td>
</tr>
</table>