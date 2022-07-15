<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:sig="http://www.w3.org/2000/09/xmldsig#"
    exclude-result-prefixes="xs sig" version="2.0">

	<xsl:variable name="yyyyMMddRegex">
		<xsl:text>\d\d\d\d-([0][1-9]|[1][0-2])-([0][1-9]|[1-2]\d|[3][0-1])</xsl:text>
	</xsl:variable>
	<xsl:variable name="MMddyyyyRegex">
		<xsl:text>([0][1-9]|[1][0-2])(-|/)([0][1-9]|[1-2]\d|[3][0-1])(-|/)\d\d\d\d</xsl:text>
	</xsl:variable>
	
	<xsl:template match="PARTIES/APPRAISER/INSPECTION/@InspectionDate">
		<xsl:if test="matches(., $yyyyMMddRegex) or matches(., $MMddyyyyRegex)">
			<appraiserInspectionDate>
				<value><xsl:value-of select="."/></value>
				<type>date</type>
			</appraiserInspectionDate>
		</xsl:if>
		<xsl:if test=". != ''">
			<appraiserInspectionDateText>
				<value><xsl:value-of select="."/></value>
				<type>date</type>
			</appraiserInspectionDateText>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES/SUPERVISOR/INSPECTION/@InspectionDate">
		<xsl:choose>
			<xsl:when test="../@AppraisalInspectionPropertyType = 'Comparable'">
				<xsl:if test="matches(., $yyyyMMddRegex) or matches(., $MMddyyyyRegex)">
					<supervisorComparableInspectionDate>
						<value><xsl:value-of select="."/></value>
						<type>date</type>
					</supervisorComparableInspectionDate>
				</xsl:if>
				<xsl:if test=". != ''">
					<supervisorComparableInspectionDateText>
						<value><xsl:value-of select="."/></value>
						<type>date</type>
					</supervisorComparableInspectionDateText>
				</xsl:if>
			</xsl:when>
			<xsl:when test="../@AppraisalInspectionPropertyType = 'Subject'">
				<xsl:if test="matches(., $yyyyMMddRegex) or matches(., $MMddyyyyRegex)">
					<supervisorInspectionDate>
						<value><xsl:value-of select="."/></value>
						<type>date</type>
					</supervisorInspectionDate>
				</xsl:if>
				<xsl:if test=". != ''">
					<supervisorInspectionDateText>
						<value><xsl:value-of select="."/></value>
						<type>date</type>
					</supervisorInspectionDateText>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="REPORT/FORM[@AppraisalReportContentType='AppraisalForm']/@AppraisalReportContentIdentifier">
		<xsl:if test=". != ''">
			<appraisalReportContentIdentifier>
				<value><xsl:value-of select="."/></value>
				<type>date</type>
			</appraisalReportContentIdentifier>
		</xsl:if>
	</xsl:template>
	
    <xsl:template match="/VALUATION_RESPONSE/REPORT/@AppraiserFileIdentifier">
        <xsl:if test=". != ''">
            <appraiserFileIdentifier>
                <value>
                    <xsl:value-of select="."/>
                </value>
                <type>string</type>
            </appraiserFileIdentifier>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/VALUATION_RESPONSE/REPORT/@AppraiserAdditionalFileIdentifier">
        <xsl:if test=". != ''">
            <appraiserAdditionalFileIdentifier>
                <value>
                    <xsl:value-of select="."/>
                </value>
                <type>string</type>
            </appraiserAdditionalFileIdentifier>
        </xsl:if>
    </xsl:template>
	
	<xsl:template match="REPORT/@AppraisalFormType">
		<xsl:if test=". != ''">
			<appraisalFormType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</appraisalFormType>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="REPORT/@AppraisalPurposeType">
		<xsl:if test=". != ''">
			<appraisalPurposeType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</appraisalPurposeType>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="REPORT/@AppraisalPurposeTypeOtherDescription">
		<xsl:if test=". != ''">
			<appraisalPurposeTypeOtherDescription>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</appraisalPurposeTypeOtherDescription>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="REPORT/@AppraisalSoftwareProductName">
		<xsl:if test=". != ''">
			<appraisalSoftwareProductName>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</appraisalSoftwareProductName>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="REPORT/@AppraisalSoftwareProductVersionIdentifier">
		<xsl:if test=". != ''">
			<appraisalSoftwareProductVersionIdentifier>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</appraisalSoftwareProductVersionIdentifier>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="REPORT/@AppraiserReportSignedDate">
		<xsl:if test=". != ''">
			<appraiserReportSignedDate>
				<value><xsl:value-of select="."/></value>
				<type>date</type>
			</appraiserReportSignedDate>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="REPORT/@SupervisorReportSignedDate">
		<xsl:if test=". != ''">
			<supervisorReportSignedDate>
				<value><xsl:value-of select="."/></value>
				<type>date</type>
			</supervisorReportSignedDate>
		</xsl:if>
	</xsl:template>
    
    <xsl:template match="REPORT/FORM[@AppraisalReportContentTypeOtherDescription = 'Signature']/
        IMAGE/EMBEDDED_FILE[@_Type='DigitalSignature']/DOCUMENT/sig:Signature[@Id='APPRAISAL_SIGNATURE']/sig:SignatureValue">
        <xsl:if test=". != ''">
            <appraiserReportSignedDigitallyIndicator>
                <value>Y</value>
                <type>boolean</type>
            </appraiserReportSignedDigitallyIndicator>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>