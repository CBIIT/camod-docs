<%

/**
 * 
 * $Id: includeInvivoData.jsp,v 1.1 2006-10-18 14:53:37 pandyas Exp $
 * 
 * $Log: not supported by cvs2svn $
 * Revision 1.8  2005/11/15 22:13:46  georgeda
 * Cleanup of drug screening
 *
 * Revision 1.7  2005/11/10 22:07:36  georgeda
 * Fixed part of bug #21
 *
 * Revision 1.6  2005/11/10 17:06:20  schroedn
 * Defect #12 fix schroedln (11/9/05)
 * Added the administrative site to the, In Vivo Screening Data Summary.
 *
 *
 */

%>

<!-- invivo / Xenograft data-->
<c:set var="invivoColl" value="${invivoData[agentId]}"/>
<c:if test="${not empty invivoColl}">
    <c:set var="foundInvivoData" value="1"/>
  	<tr>
  		<td colspan="2">
			<table summary="" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">	
				<tr>
					<td class="formTitleBlue" colspan="3" align="center">
						In Vivo Screening Data
					</td>
				</tr>
				<tr>
					<td class="greySubTitle" colspan="3">For approximately thirty years, the NCI used <em>in vivo </em>animal tumor models to screen compounds for potential antitumor activity.
					</td>
				</tr>
				<c:forEach var="ivd" items="${invivoColl}" varStatus="stat2">
					<c:choose>
						<c:when test = "${stat2.count % 2 == 0}">
							<c:set var="tdClass" value="resultsBoxWhite"/>
						</c:when>
						<c:otherwise>
							<c:set var="tdClass" value="resultsBoxGrey"/>
						</c:otherwise>
					</c:choose>
					<tr>
						<td align="right" class="<c:out value="${tdClass}"/>"><c:out value="${stat2.count}"/></td>
						<td class="<c:out value="${tdClass}"/>">
							<c:out value="${ivd[1]}"/> in <c:out value="${ivd[2]}"/> (<c:out value="${ivd[3]}"/>)
						</td>
						<td align="right" class="<c:out value="${tdClass}End"/>"> &nbsp;&nbsp;
							<a href="ViewModelAction.do?unprotected_method=populateXenograftDetails&aModelID=<c:out value="${mdl.id}"/>&xModelID=<c:out value="${ivd[0]}"/>&nsc=<c:out value="${agt.nscNumber}"/>" styleClass="subMenuPrimary"/>
							<c:out value="${ivd[4]}"/></a>
						</td>
				  	</tr>
			  	</c:forEach>
		</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</c:if>
<!-- end invivo /xenograft data-->
