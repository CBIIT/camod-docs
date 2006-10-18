<%

/**
 * 
 * $Id: searchAdvanced.jsp,v 1.1 2006-10-18 14:53:37 pandyas Exp $
 * 
 * $Log: not supported by cvs2svn $
 * Revision 1.45  2006/10/17 16:08:28  pandyas
 * modified during development of caMOD 2.2 - various
 *
 * Revision 1.44  2006/08/16 13:55:45  pandyas
 * updated on-line help from Robohelp to ePublisher - added new link for advanced search title
 *
 * Revision 1.43  2006/08/15 15:30:29  pandyas
 * updated on-line help from Robohelp to ePublisher - modified link - new data tree link added
 *
 * Revision 1.42  2006/08/13 17:45:53  pandyas
 * Updated online help - redefined camod tag by substituting mapId for topic (ePublisher changes)
 *
 * Revision 1.41  2006/05/25 12:02:51  georgeda
 * Slight tweaks
 *
 * Revision 1.40  2006/05/19 17:12:11  guptaa
 * added advance search
 *
 * Revision 1.39  2006/05/18 14:26:40  guptaa
 * fix style id
 *
 * Revision 1.38  2006/05/18 13:05:48  guptaa
 * added disease
 *
 * Revision 1.37  2006/05/17 21:24:49  guptaa
 * organ work with the autocomplete
 *
 * Revision 1.36  2006/05/15 19:52:23  georgeda
 * Fixed bugs introduced putting in Ajax
 *
 * Revision 1.35  2006/05/12 20:42:41  guptaa
 * deleted css
 *
 * Revision 1.34  2006/05/12 20:30:28  guptaa
 * indicator out
 *
 * Revision 1.33  2006/05/12 19:41:42  guptaa
 * uses tag
 *
 * Revision 1.32  2006/05/12 17:11:38  guptaa
 * ajax additions
 *
 * Revision 1.31  2006/05/10 14:21:51  schroedn
 * New Features - Changes from code review
 *
 * Revision 1.30  2006/05/10 12:02:47  georgeda
 * Changes for searching on transient interfaces
 *
 * Revision 1.29  2006/05/03 19:05:29  georgeda
 * Move to new EVSTree
 *
 * Revision 1.28  2006/04/28 19:38:15  schroedn
 * Defect # 261
 * Made changes so the organ and diagnosis save differently and can be retained for SaveQuery
 *
 * Revision 1.27  2006/03/31 13:47:36  georgeda
 * Changed the EVSTree call to work w/ new servers
 *
 * Revision 1.26  2005/12/19 14:05:33  georgeda
 * Defect #271 - Search issues
 *
 * Revision 1.25  2005/12/02 14:17:30  georgeda
 * Defect #241, handle truncated HTML tags
 *
 * Revision 1.24  2005/11/16 21:33:24  georgeda
 * Defect #40.  Changed reset button to clear.
 *
 * Revision 1.23  2005/11/16 19:43:30  georgeda
 * Added clear to search forms
 *
 * Revision 1.22  2005/11/16 16:32:43  georgeda
 * Defect #46.  Made disabling/enabling fields consistent between IE/Firefox
 *
 * Revision 1.21  2005/11/16 14:57:39  schroedn
 * Defect #50
 *
 * Changed the text on Submit button to 'Search'
 *
 *
 */

%>

<%@ include file="/jsp/header.jsp" %>
<%@ include file="/jsp/sidebar.jsp" %>
<%@ include file="/common/taglibs.jsp"%>

<%@ page import="gov.nih.nci.camod.Constants.*" %>
<%@ page import="gov.nih.nci.camod.service.SavedQueryManager" %>
<%@ page import="gov.nih.nci.camod.domain.SavedQuery" %>	
<%@ page import="gov.nih.nci.camod.domain.SavedQueryAttribute" %>	

<!-- needed for tooltips -->
<DIV id="TipLayer" style="visibility:hidden;position:absolute;z-index:1000;top:-100;"></DIV>
<SCRIPT src="/camod/scripts/RoboHelp_CSH.js" type=text/javascript></SCRIPT>
<script language="JavaScript" src="scripts/EVSTreeScript.js"></script>
<script language="JavaScript" src="scripts/global.js"></script>
<script type="text/javascript" src="js/prototype-1.4.0.js"></script>
<script type="text/javascript" src="js/scriptaculous.js"></script>
<script type="text/javascript" src="js/ajaxtags-1.2-beta2.js"></script>


<SCRIPT LANGUAGE="JavaScript">
	
	function blankKeyword() {
        document.searchForm.keyword.value = '';
    }
	
	function checkFields() {
	
	    // Do the CI fields
		theCIFlag = document.searchForm.searchCarcinogenicInterventions[0];
		toggleField(theCIFlag, document.searchForm.chemicalDrug);
		toggleField(theCIFlag, document.searchForm.growthFactor);
		toggleField(theCIFlag, document.searchForm.hormone);
		toggleField(theCIFlag, document.searchForm.radiation);
		toggleField(theCIFlag, document.searchForm.viral);
		toggleField(theCIFlag, document.searchForm.surgery);
		
		theTargModFlag = document.searchForm.targetedModification[0];
		theEndTransGeneFlag = document.searchForm.engineeredTransgene[0];
		
		if (theTargModFlag.checked == true || theEndTransGeneFlag.checked == true) {
		    enableField(document.searchForm.geneName);
		}
		else {
		    disableField(document.searchForm.geneName);
		}
		
		toggleField(document.searchForm.searchTherapeuticApproaches[0], document.searchForm.therapeuticApproach);
	}
	
	function enableFields() {
		document.searchForm.organ.disabled = false;
		document.searchForm.tumorClassification.disabled = false;
	}	
	
</SCRIPT>

<%
	//Display search criteria of executed search
	String aSavedQueryId = (String) request.getSession().getAttribute( Constants.ASAVEDQUERYID );
	String aQueryName = (String) request.getSession().getAttribute( Constants.QUERY_NAME );		
%>

<html:form action="SearchAdvancedAction.do" focus="keyword" onsubmit="enableFields()">

<!-- searchAdvanced.jsp -->
<!-- Main Content Begins -->
<TABLE cellpadding="10" cellspacing="0" border="0" class="contentBegins" width="100%" height="100%">
	<tr><td>
	
	<TABLE summary="" cellpadding="3" cellspacing="0" border="0">
	    <tr>
	        <td class="formTitleBlue" height="20" colspan="3">Keyword Search:&nbsp;&nbsp;<html:text property="keyword" size="55"/>&nbsp;&nbsp;<input class="actionButton" type="submit" value="Search" /></td>
	    </tr>
        
        <tr>
        	<td colspan="3">        
		        <% if( aSavedQueryId != null ) { %>
			        <br>
					<TABLE border="0" class="contentPage" width="100%">
						<TR>
							<TD width="100%">
								<font color="red">* Saved query <b>"<%= aQueryName %>"</b> is being edited. You will be prompted to save the changes after pressing Search.</font>
				            </TD>
				        </TR>
			        </TABLE>				
		        <%}%>
        	</td>
        </tr>
        
        <tr>
			<td class="formTitleBlue" height="20" colspan="3">Advanced Search
				<camod:cshelp topic="advanced_search_help" key="ignore" image="/camod/images/iconHelp.gif" text=""/></td>		
		</tr>
		
		<tr>
		    <td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field1">Model Name /Model Descriptor:</label> 
				<camod:cshelp topic="advanced_search_help" key="SEARCH.MODEL_DESCRIPTOR" image="images/iconHelp.gif" text="Tool Tip Test 1" />
			</td>
			<td class="formField">
				<html:text styleClass="formFieldSized" styleId="modelDescriptor" property="modelDescriptor" size="30"/>
				<ajax:autocomplete baseUrl="/camod/autocomplete.view" source="modelDescriptor" target="modelDescriptor"
  				parameters="modelDescriptor={modelDescriptor}" className="autocomplete" minimumCharacters="1" />	
			</td>
		</tr>
		
		<tr>
			<td class="formRequiredNotice" width="0">&nbsp;</td>
			<td class="formLabel"><label for="field2">PI's Name:</label></td>
			
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="piName" >
					<html:options name="<%= Dropdowns.PRINCIPALINVESTIGATORQUERYDROP %>" />										
				</html:select>			
			</td>
		</tr>

		<tr>
			<td class="formRequiredNotice" width="0">&nbsp;</td>
			<td class="formLabel">
				<html:hidden styleId="organTissueName" property="organTissueName"/>
		 		<html:hidden styleId="organTissueCode" property="organTissueCode"/>
				<label for="field2">Site of Lesion/Tumor</label>
				&nbsp;
				<camod:cshelp topic="data_tree_help" key="SEARCH.SITE_OF_TUMOR" image="images/iconHelp.gif" text="Tool Tip Test 1" />
		  	    <a href="javascript:showMouseTissueTree('searchForm', 'organTissueCode', 'organTissueName', 'organ', false)">
				<IMG src="images\selectUP.gif" align=middle border=0>
				</a>
			</td>
			<td class="formField">
				<html:text styleClass="formFieldSized" styleId="organ" property="organ" size="25"/>
				<ajax:autocomplete baseUrl="/camod/autocomplete.view" source="organ" target="organTissueCode"
  				parameters="organTissueCode={organTissueCode}" className="autocomplete" minimumCharacters="1" />	
			</td>
		</tr>
		
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">
		 		<html:hidden styleId="diagnosisCode" property="diagnosisCode"/>
		 		<html:hidden styleId="diagnosisName" property="diagnosisName"/>
				<label for="field2">Diagnosis</label>
				&nbsp;
		  	    <a href="javascript:showMouseDiagnosisTree('searchForm', 'diagnosisCode', 'diagnosisName', 'tumorClassification', false)">
				<IMG src="images\selectUP.gif" align=middle  border=0>
				</a>			    
			</td>
			<td class="formField">
				<html:text styleClass="formFieldSized" styleId="tumorClassification" property="tumorClassification" size="25"/>
				<ajax:autocomplete baseUrl="/camod/autocomplete.view" source="tumorClassification" target="diagnosisCode"
  				parameters="diagnosisCode={diagnosisCode}" className="autocomplete" minimumCharacters="1" />				
			</td>
		</tr>
		
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Species:</label></td>
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="species" >
					<html:optionsCollection name="<%= Dropdowns.NEWSPECIESDROP %>" />										
				</html:select>				
			</td>
		</tr>

		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Phenotype:</td>
		</tr>

		<tr>
		    <td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Phenotype:</label></td>
			<td class="formField">			
					<html:text styleClass="formFieldSized" property="phenotype" size="30"/>
			</td>
		</tr>

		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Genetic Description:</td>
		</tr>

		<tr>
		    <td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Gene Name:</label></td>
			<td class="formField">
			    <html:text styleClass="formFieldSized" styleId="geneName" property="geneName" size="30"/>
				<ajax:autocomplete baseUrl="/camod/autocomplete.view" source="geneName" target="geneName"
  				parameters="geneName={geneName}" className="autocomplete" minimumCharacters="1" />	
			</td>
		</tr>
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">
				<label for="field1">&nbsp;</label>
			</td>
			<td class="formField">
                <html:checkbox property="engineeredTransgene" onclick="checkFields()" />
                <!-- NOTE: Needed to workaround struts bug -->
                <input type="hidden" name="engineeredTransgene" value="false">
			    <label for="box1">Transgene</label>			
			    </br>
                <html:checkbox property="targetedModification" onclick="checkFields()" />
                <input type="hidden" name="targetedModification" value="false">
			    <label for="box1">Targeted Modification</label>			
			</td>
		</tr>

		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">
				<label for="field1">Genomic Segment Designator:</label>
			</td>
			<td class="formField">			
					<html:text styleClass="formFieldSized" property="genomicSegDesignator" size="30"/>
			</td>
		</tr>
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">
				<label for="field3">Select Inducing Agent for Induced Mutation</label>
			</td>
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="inducedMutationAgent" >
					<html:options name="<%= Dropdowns.INDUCEDMUTATIONAGENTQUERYDROP %>" />										
				</html:select>				
			</td>
		</tr>

		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Carcinogenic Interventions:</td>
		</tr>

		<tr>	
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">
				<label for="field1">Models with Carcinogenic Interventions:</label>
			</td>

			<td class="formField">
                <html:checkbox property="searchCarcinogenicInterventions" onclick="checkFields()" />
                <!-- NOTE: Needed to work around struts bug -->
                <input type="hidden" name="searchCarcinogenicInterventions" value="false">
			    <label for="box1">Check here to search for models with <br>Carcinogenic interventions data</label>			
			</td>
		</tr>

		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Select Chemical/Drug:</label></td>
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="chemicalDrug" >
					<html:options name="<%= Dropdowns.CHEMICALDRUGQUERYDROP %>" />										
				</html:select>				
			</td>
		</tr>

		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Select Growth Factor:</label></td>
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="growthFactor" >
					<html:options name="<%= Dropdowns.GROWTHFACTORQUERYDROP %>" />										
				</html:select>				
			</td>
		</tr>

		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Select Hormone:</label></td>
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="hormone" >
					<html:options name="<%= Dropdowns.HORMONEQUERYDROP %>" />										
				</html:select>				
			</td>
		</tr>
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Select Radiation:</label></td>
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="radiation" >
					<html:options name="<%= Dropdowns.RADIATIONQUERYDROP %>" />										
				</html:select>				
			</td>
		</tr>

		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Select Virus:</label></td>
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="viral" >
					<html:options name="<%= Dropdowns.VIRUSQUERYDROP %>" />										
				</html:select>				
			</td>
		</tr>
		
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Select Surgery:</label></td>
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="surgery" >
					<html:options name="<%= Dropdowns.SURGERYQUERYDROP %>" />										
				</html:select>				
			</td>
		</tr>

		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Cell Lines</td>
		</tr>

		<tr>
		    <td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Cell Line:</label></td>
			<td class="formField">			
					<html:text styleClass="formFieldSized" property="cellLine" size="30"/>
			</td>
		</tr>

		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Therapeutic Approaches</td>
		</tr>
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">Models with Therapeutic Approaches</td>
			<td class="formField">
			    <html:checkbox property="searchTherapeuticApproaches" onclick="checkFields()" />
			    <!-- NOTE: Needed to work around struts bug -->
			    <input type="hidden" name="searchTherapeuticApproaches" value="false">	
				<label for="box1">Check here to search for models with <br>therapeutic approaches data</label>
			</td>
		</tr>
		<tr>
		    <td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">Compound/Drug:</label></td>
			<td class="formField">			
					<html:text styleClass="formFieldSized" property="therapeuticApproach" size="30"/>
			</td>
		</tr>

		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Histopathology</td>
		</tr>		
		
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">Models with Metastasis</td>
			<td class="formField">
			    <html:checkbox property="searchHistoMetastasis" />
			    <!-- NOTE: Needed to work around struts bug -->
			    <input type="hidden" name="searchHistoMetastasis" value="false">
				<label for="box1">Check here to search for models with Metastasis</label>
			</td>
		</tr>
		
		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Transient Interference</td>
		</tr>
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">Transient Interference</td>
			<td class="formField">
			    <html:checkbox property="searchTransientInterference" />
			    <!-- NOTE: Needed to work around struts bug -->
			    <input type="hidden" name="searchTransientInterference" value="false">
				<label for="box1">Check here to search for models with transient interference data</label>
			</td>
		</tr>
		
		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Microarray Data</td>
		</tr>
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">Microarray Data</td>
			<td class="formField">
			    <html:checkbox property="searchMicroArrayData" />
			    <!-- NOTE: Needed to work around struts bug -->
			    <input type="hidden" name="searchMicroArrayData" value="false">
				<label for="box1">Check here to search for models with microarray data</label>
			</td>
		</tr>
		
		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Image Data</td>
		</tr>
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">Image Data</td>
			<td class="formField">
			    <html:checkbox property="searchImageData" />
			    <!-- NOTE: Needed to work around struts bug -->
			    <input type="hidden" name="searchImageData" value="false">
				<label for="box1">Check here to search for models with images</label>
			</td>
		</tr>		
		
		<tr>
			<td class="formTitleBlue" height="10" colspan="3">Tool Strain</td>
		</tr>		
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel">Tool Strain</td>
			<td class="formField">
			    <html:checkbox property="searchToolStrain" />
			    <!-- NOTE: Needed to work around struts bug -->
			    <input type="hidden" name="searchToolStrain" value="false">
				<label for="box1">Check here to search for tool strains <BR><BR>(A tool mouse strain is a strain that does not develop cancer, 
				<BR>but can be used to create cancer-bearing models. Example: WAP-Cre strain)</label>
			</td>
		</tr>
		
		<tr>
			<td class="formTitleBlue" height="10" colspan="3">External Source Data From Jackson Labs</td>
		</tr>		
		<tr>
			<td class="formRequiredNotice" width="5">&nbsp;</td>
			<td class="formLabel"><label for="field3">External Data Source:</label></td>
			<td class="formField">				
				<html:select styleClass="formFieldSized" size="1" property="externalSource" >
					<html:options name="<%= Dropdowns.EXTERNALSOURCEQUERYDROP %>" />										
				</html:select>				
			</td>
		</tr>
			
		<tr>			
			<td align="right" colspan="3">
				<!-- action buttons begins -->
				<TABLE cellpadding="4" cellspacing="0" border="0">
					  
					  <html:submit styleClass="actionButton" onclick="blankKeyword()">
						  Search
					  </html:submit>
	  				  
	  				  <html:submit property="<%=Constants.Parameters.ACTION%>" styleClass="actionButton">
					  	  <bean:message key="button.clear"/>
	  				  </html:submit>
	  				  
				  </html:form>		
				</TABLE>
			</td>
		</tr>
		<!-- action buttons end -->
	</TABLE>
</td></tr></TABLE>	

<SCRIPT LANGUAGE="JavaScript">
    checkFields();
</SCRIPT>

<%@ include file="/jsp/footer.jsp" %>