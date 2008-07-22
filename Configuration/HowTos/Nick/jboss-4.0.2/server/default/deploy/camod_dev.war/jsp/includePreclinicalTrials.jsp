<%
 /*
 * $Log: not supported by cvs2svn $
 * Revision 1.31  2008/01/10 15:55:29  pandyas
 * Removed space before Jax number
 *
 * Revision 1.30  2008/01/10 13:25:40  pandyas
 * Added link to top of page for Therapy screen - results were getting very long
 *
 * Revision 1.29  2007/12/18 13:28:32  pandyas
 * Modified column config to fit with caELMIRE data for integration of Study data
 *
 * Revision 1.28  2007/12/04 13:46:57  pandyas
 * Rotate publication data and rename column heading
 *
 * Revision 1.27  2007/10/31 19:33:58  pandyas
 * Fixed #8188 	Rename UnctrlVocab items to text entries
 *
 * Revision 1.26  2007/07/31 12:00:10  pandyas
 * VCDE silver level  and caMOD 2.3 changes
 *
 * Revision 1.25  2007/06/19 20:34:00  pandyas
 * Users not logged in can not access the session property to check the model species.  Therefore, we must show the attribute for all models.
 *
 * Revision 1.24  2007/05/16 12:30:49  pandyas
 * Added developmental stage evs tree to Therapy when species is Zebrafsih
 *
 * Revision 1.23  2006/10/31 17:22:08  pandyas
 * fixed code to allow for html markup in fields - there was a bug in this jsp
 *
 * Revision 1.21  2006/05/25 18:34:50  pandyas
 * added break after MGI number
 *
 * Revision 1.20  2006/05/25 17:37:36  pandyas
 * added break after jax number
 *
 * Revision 1.19  2006/05/25 16:09:20  pandyas
 * updated hyperlink for jax number in publications with MTB and MGI links
 *
 * Revision 1.18  2006/05/25 16:02:59  pandyas
 * updated hyperlink for jax number in publications with MTB and MGI links
 *
 * Revision 1.17  2006/05/25 16:00:25  pandyas
 * updated hyperlink for jax number in publications with MTB and MGI links
 *
 * Revision 1.16  2006/05/25 15:57:43  pandyas
 * updated hyperlink for jax number in publications with MTB and MGI links
 *
 * Revision 1.15  2006/05/25 15:26:50  pandyas
 * adding hyperlink for jax number in therapy
 *
 * Revision 1.14  2006/05/25 15:16:54  pandyas
 * added Jax column
 *
 * Revision 1.13  2006/05/22 17:38:09  pandyas
 * Added tumorResponse to view screen - before comment
 *
 * Revision 1.12  2006/04/28 19:36:19  schroedn
 * Defect #55
 * Added Keyword Highlighting to this jsp
 *
 * Revision 1.11  2006/04/27 15:09:01  pandyas
 * Modified while testing caMod 2.1
 *
 * Revision 1.10  2006/04/17 19:08:19  pandyas
 * caMod 2.1 OM changes
 *
 * Revision 1.9  2005/11/28 16:31:48  pandyas
 * Defect #187:  Reordered fields on therapy search page to match submission page
 *
 * Revision 1.8  2005/11/28 13:52:48  georgeda
 * Defect #207, handle nulls for pages w/ uncontrolled vocab
 *
 * Revision 1.7  2005/11/17 21:15:10  georgeda
 * Defect #86.  Removed unneeded field.
 *
 *
 * $Id: includePreclinicalTrials.jsp,v 1.1 2008-07-22 19:38:50 pandyas Exp $
 */
%>
<tr>
	<td class="formTitleBlue" height="20" colspan="4">
		Summary of the pre-clinical study in <c:out value="${agt.name}"  escapeXml="false"/>
	</td>
</tr>	
<tr>
	<td class="resultsBoxWhite" width="25%"><b>Experiment</b></td>
	<td class="resultsBoxWhiteEnd" width="75%" colspan="3">&nbsp;
		<camod:highlight><c:out value="${t.experiment}" escapeXml="false"/></camod:highlight>
	</td>
</tr>
<tr>
	<td class="resultsBoxGrey" width="25%"><b>Dose</b></td>
	<td class="resultsBoxGreyEnd" width="75%" colspan="3">&nbsp;
		<camod:highlight><c:out value="${t.treatment.dosage}" escapeXml="false"/>&nbsp;<c:out value="${cd.treatment.dosageUnit}"/></camod:highlight>
	</td>
</tr>
<tr>
	<td class="resultsBoxWhite" width="25%"><b>Administration Route</b></td>
	<td class="resultsBoxWhiteEnd" width="75%" colspan="3">
		<c:choose>
			<c:when test="${empty t.treatment.administrativeRoute}">
				<camod:highlight><c:out value="${t.treatment.adminRouteAlternEntry}" escapeXml="false"/></camod:highlight>
			</c:when>
			<c:otherwise>
				<camod:highlight><c:out value="${t.treatment.administrativeRoute}" escapeXml="false"/></camod:highlight>
			</c:otherwise>
		</c:choose>&nbsp;
	</td>
</tr>
<tr>
	<td class="resultsBoxGrey" width="25%"><b>Gender</b></td>
	<td class="resultsBoxGreyEnd" width="75%" colspan="3">&nbsp;
		<camod:highlight><c:out value="${t.treatment.sexDistribution.type}"/></camod:highlight>
	</td>
</tr>


<tr>
	<td class="resultsBoxWhite" width="25%"><b>Age at Treatment</b></td>
	<td class="resultsBoxWhiteEnd" width="75%" colspan="3">&nbsp;
		<camod:highlight><c:out value="${t.treatment.ageAtTreatment}" escapeXml="false"/>&nbsp;<c:out value="${t.treatment.ageAtTreatmentUnit}"/></camod:highlight>
	</td>
</tr>


	<tr>
		<td class="resultsBoxGrey" width="25%"><b>Developmental Stage</b> <br>(applies only to Zebrafish)</td>
		<td class="resultsBoxGreyEnd" width="75%" colspan="3">&nbsp;
			<c:out value="${t.developmentalStage.name}" escapeXml="false"/>
		</td>
	</tr>


<tr>
	<td class="resultsBoxWhite" width="25%"><b>Results</b></td>
	<td class="resultsBoxWhiteEnd" width="75%" colspan="3">&nbsp;
		<camod:highlight><c:out value="${t.results}" escapeXml="false"/></camod:highlight>
	</td>
</tr>
<tr>
	<td class="resultsBoxGrey" width="25%"><b>Toxicity Grade</b></td>
	<td class="resultsBoxGreyEnd" width="75%" colspan="3">&nbsp;
		<camod:highlight><c:out value="${t.toxicityGrade}" escapeXml="false"/></camod:highlight>
	</td>
</tr>			
<tr>
	<td class="resultsBoxWhite" width="25%"><b>Biomarker</b></td>
	<td class="resultsBoxWhiteEnd" width="75%" colspan="3">
		<camod:highlight><c:out value="${t.biomarker}" escapeXml="false"/>&nbsp;</camod:highlight>
	</td>
</tr>
<tr>
	<td class="resultsBoxGrey" width="25%"><b>Tumor Response</b></td>
	<td class="resultsBoxGreyEnd" width="75%" colspan="3">
		<camod:highlight><c:out value="${t.tumorResponse}" escapeXml="false"/>&nbsp;</camod:highlight>
	</td>
</tr>
<tr>
	<td class="resultsBoxWhite" width="25%"><b>Comment </b></td>
	<td class="resultsBoxWhiteEnd" width="75%" colspan="3">&nbsp;
		<camod:highlight><c:out value="${t.comments}" escapeXml="false"/></camod:highlight>
	</td>
</tr>
<tr><td></td></tr>
<tr><td></td></tr>

<c:choose>
	<c:when test="${empty t.publicationCollection}">
		<tr>
			<td class="resultsBoxWhiteEnd" colspan=4><b>No Publications Found</b></td>
		</tr>
	</c:when>
	<c:otherwise>
	<tr>
		<td class="greySubTitleLeftEnd" colspan=4><b>Publications:</b></td>
	</tr>	
	  <tr><td colspan="2">
		<table summary="" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">	
		<c:forEach var="p" items="${t.publicationCollection}" varStatus="stat2">
		<tr>
			<c:choose>
				<c:when test = "${stat2.count % 2 == 0}">
					<c:set var="tdClass" value="resultsBoxWhite"/>
				</c:when>
				<c:otherwise>
					<c:set var="tdClass" value="resultsBoxGrey"/>
				</c:otherwise>
			</c:choose>

					<tr>
						<td class="GreyBoxTop" width="30%"><b>Publication Status:</b></td>
						<td class="GreyBoxTopRightEnd" width="65%" colspan="3"><c:out value="${p.publicationStatus.name}" escapeXml="false"/>&nbsp;</td>
					</tr>
						       
					<tr>
						<td class="WhiteBox" width="30%"><b>First Author:</b></td>
						<td class="WhiteBoxRightEnd" width="70%" colspan="3"><a name="authors"><c:out value="${p.authors}" escapeXml="false"/></a>&nbsp;</td>
					</tr>
					<tr>
						<td class="GreyBox" width="30%"><b>References:</b></td>
							<!-- Two choose required so we can check for emtpy ZFIN or J Numbers-->			
							<td class="GreyBoxRightEnd" width="70%" colspan="3">
								<c:choose>
									<c:when test="${not empty p.zfinPubId}">
											<a target="_blank" href="http://zfin.org/cgi-bin/webdriver?MIval=aa-pubview2.apg&OID=<c:out value="${p.zfinPubId}"/>">ZFIN</a>
											<br/>
									</c:when>				
									<c:otherwise>					
									</c:otherwise>
								</c:choose>
								<c:choose>
										<c:when test="${not empty p.jaxJNumber}">										
											<c:out value="${p.jaxJNumber}"/>&nbsp;<br/>												
												<a target="_blank" href="http://www.informatics.jax.org/searches/accession_report.cgi?id=<c:out value="${p.jaxJNumber}"/>">MGI</a>
												<br/>
												<a target="_blank" href="http://tumor.informatics.jax.org/mtbwi/referenceDetails.do?accId=<c:out value="${p.jaxJNumber}"/>">MTB</a>
										</c:when>				
									<c:otherwise>						
									</c:otherwise>
								</c:choose>
						</td>					
					</tr>
			       
					<tr>
						<td class="WhiteBox" width="30%"><b>Title:</b></td>
						<td class="WhiteBoxRightEnd" width="70%" colspan="3"><a name="authors"><c:out value="${p.title}" escapeXml="false"/></a>&nbsp;</td>
					</tr>
					
					<tr>
						<td class="GreyBox" width="30%"><b>Journal:</b></td>
						<td class="GreyBoxRightEnd" width="70%" colspan="3"><camod:highlight><c:out value="${p.journal}" escapeXml="false"/>&nbsp;</camod:highlight></td>
					</tr>
						       
					<tr>
						<td class="WhiteBox" width="30%"><b>Year:</b></td>
						<td class="WhiteBoxRightEnd" width="70%" colspan="3"><camod:highlight><c:out value="${p.year}" escapeXml="false"/>&nbsp;</camod:highlight></td>
					</tr>
					<tr>
						<td class="GreyBox" width="30%"><b>Volume:</b></td>
						<td class="GreyBoxRightEnd" width="70%" colspan="3"><camod:highlight><c:out value="${p.volume}" escapeXml="false"/>&nbsp;</camod:highlight></td>
					</tr>
			
					<tr>
						<td class="WhiteBox" width="30%"><b>Pages:</b></td>
						<td class="WhiteBoxRightEnd" width="70%" colspan="3"><camod:highlight><c:out value="${p.startPage}"/> - </camod:highlight>
								<camod:highlight><c:out value="${p.endPage}"/></camod:highlight></td>
					</tr>
						       
					<tr>
						<td class="GreyBox" width="30%"><b>Abstract in PubMed:</b></td>
						<td class="GreyBoxRightEnd" width="70%" colspan="3">
								<a target="_pubmed" href=" http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=retrieve&db=pubmed&dopt=abstract&list_uids=<c:out value="${p.pmid}"/>">
								<IMG src="/camod/images/pubmed_70.gif" align="middle">
								</a>
						</td>
					</tr>
							
					<tr>
						<td class="WhiteBox" width="30%"><b>Comment:</b></td>
						<td class="WhiteBoxRightEnd" width="70%" colspan="3"><camod:highlight><c:out value="${p.comments}" escapeXml="false"/>&nbsp;</camod:highlight></td>
					</tr>					
		</tr>
		</c:forEach>
		</table>
		</tr></td>
	</c:otherwise>
</c:choose >

    <td colspan="2" align="right"><a href="#">Top</a></td>	
<tr><td>&nbsp;</td></tr>
