<%
/*  
 *  author:  pandyas
 *
 *  $Log: not supported by cvs2svn $
 *  Revision 1.3  2005/11/16 14:23:16  georgeda
 *  Fixed slight formatting error
 *
 *  Revision 1.2  2005/11/15 17:38:22  pandyas
 *  Fixed Defects #7-8 and #9-11:  6 Links to experimental design and yeast strains, formatting 3 experimental design headers
 *
 *
 *  $Id: yeastStrainsStage01.jsp,v 1.1 2006-10-18 14:53:37 pandyas Exp $
 *
 */
%>
<%@ include file="/jsp/header.jsp" %>
<%@ include file="/jsp/sidebar.jsp" %>

<TABLE cellpadding="10" cellspacing="0" border="0" class="contentBegins" width="100%" height="100%">
<tr><td>
	<TABLE summary="" cellpadding="0" cellspacing="0" border="0" class="contentPage" width="100%" height="100%">
	<tr><td valign="top">
		<TABLE cellpadding="0" cellspacing="0" border="0" class="contentBegins" width="100%">
		<tr><td>
			<TABLE summary="" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">	
			<tr>
				<td class="formTitle" height="20" colspan="9">Yeast Strains used in Stages 0 and 1</td>				
			</tr>

			</TABLE>
			<br>
			<TABLE summary="" cellpadding="0" cellspacing="0" border="0" align="center" width="100%">
				<TR>
					<TD class="formTitleBlue" align="center" width="17%" height="20"><B>Strain</B></TD>
					<TD class="formTitleBlue" align="center" width="83%" height="20"><B>Genotype</B></TD> 
				</TR>

				<td colspan="2">
			<table summary="" cellpadding="3" cellspacing="0" border="0" align="center" width="100%">	
				<TR>
					<TD class="resultsBoxWhite" width="17%"><I><FONT FACE="Arial"><P>rad50</I></FONT></TD>
					<TD class="resultsBoxWhiteEnd"  width="83%"><I><FONT FACE="Arial"><P>MATa rad50</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">kan<SUP>r</SUP> erg6</FONT>
					<FONT FACE="Symbol">D</FONT><FONT FACE="Arial">LEU2 pdr1</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">LEU2 pdr3</FONT>
					<FONT FACE="Symbol">D</FONT><FONT FACE="Arial">hisG::URA3::hisG ade2 ade3 leu2 ura3 </I></FONT></TD>
				</TR>
				<TR>
					<TD class="resultsBoxGrey" width="17%"><I><FONT FACE="Arial"><P>bub3</I></FONT></TD>
					<TD class="resultsBoxGreyEnd" width="83%"><I><FONT FACE="Arial"><P>MATa  bub3</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">URA3 erg6</FONT>
					<FONT FACE="Symbol">D</FONT><FONT FACE="Arial">TRP1 pdr1</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">LEU2 pdr3</FONT>
					<FONT FACE="Symbol">D</FONT><FONT FACE="Arial">hisG ade2 ade3 leu2 trp1 ura3  </I></FONT></TD>
				</TR>
				<TR>
					<TD class="resultsBoxWhite" width="17%"><I><FONT FACE="Arial"><P>mec2-1</I></FONT></TD>
					<TD class="resultsBoxWhiteEnd" width="83%"><I><FONT FACE="Arial"><P>MATa  mec2-1 erg6</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">LEU2 pdr1</FONT>
					<FONT FACE="Symbol">D</FONT><FONT FACE="Arial">LEU2 pdr3</FONT><FONT FACE="Symbol">D</FONT>
					<FONT FACE="Arial">hisG::URA3::hisG ade2 ade3 leu2 ura3  </I></FONT></TD>
					</TR>
				<TR>
					<TD class="resultsBoxGrey" width="17%"><I><FONT FACE="Arial"><P>CLN2oe rad14</I></FONT></TD>
					<TD class="resultsBoxGreyEnd" width="83%"><I><FONT FACE="Arial"><P>MATa URA3-pGPD-CLN2 rad14</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">kan<SUP>r</SUP> erg6</FONT>
					<FONT FACE="Symbol">D</FONT><FONT FACE="Arial">TRP1 pdr1</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">LEU2 pdr3</FONT>
					<FONT FACE="Symbol">D</FONT><FONT FACE="Arial">hisG ade2 ade3 leu2 trp1ura3  </I></FONT></TD>
				</TR>
				<TR>
					<TD class="resultsBoxWhite" width="17%"><I><FONT FACE="Arial"><P>mlh1 rad18</I></FONT></TD>
					<TD class="resultsBoxWhiteEnd" width="83%"><I><FONT FACE="Arial"><P>MAT</FONT><FONT FACE="Symbol">a</FONT><FONT FACE="Arial"> rad18</FONT><FONT FACE="Symbol">D</FONT>
					<FONT FACE="Arial">URA3 mlh1</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">TRP1erg6</FONT><FONT FACE="Symbol">D</FONT>
					<FONT FACE="Arial">TRP1 pdr1</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">LEU2 pdr3</FONT><FONT FACE="Symbol">D</FONT>
					<FONT FACE="Arial">hisG ade2 ade3 leu2  trp1 ura3  </I></FONT></TD>
				</TR>
				<TR>
					<TD class="resultsBoxGrey" width="17%"><I><FONT FACE="Arial"><P>mgt1 sgs1</I></FONT></TD>
					<TD class="resultsBoxGreyEnd" width="83%"><I><FONT FACE="Arial"><P>MATa mgt1</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">kan<SUP>r</SUP> sgs1</FONT><FONT FACE="Symbol">D</FONT>
					<FONT FACE="Arial">LEU2 erg6</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">LEU2 pdr1</FONT><FONT FACE="Symbol">D</FONT>
					<FONT FACE="Arial">LEU2 pdr3</FONT><FONT FACE="Symbol">D</FONT><FONT FACE="Arial">hisG ade2 ade3 leu2 ura3  </I></FONT></TD>
				</TR>
			</table></td>

			<tr><td colspan="2"> &nbsp; </td></tr>

			</TABLE>
		</td></tr></TABLE>
	</td></tr></TABLE>
</td></tr></TABLE>

<%@ include file="/jsp/footer.jsp" %>