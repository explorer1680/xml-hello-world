<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="CONTACT_DETAIL">
		<contact>
			<xsl:apply-templates select="CONTACT_POINT[@_Type = 'Email']/@_Value"/>
			<xsl:apply-templates select="CONTACT_POINT[@_Type = 'Phone']/@_Value"/>
		</contact>
	</xsl:template>

	<xsl:template match="CONTACT_POINT[@_Type = 'Email']/@_Value">
		<xsl:if test=". != ''">
			<email>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</email>
		</xsl:if>
	</xsl:template>

	<xsl:template match="CONTACT_POINT[@_Type = 'Phone']/@_Value">
		<xsl:if test=". != ''">
			<workPhone>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</workPhone>
		</xsl:if>
	</xsl:template>

	<xsl:template match="INSPECTION[@AppraisalInspectionPropertyType='Comparable']/@AppraisalInspectionType">
		<xsl:if test=". != ''">
			<comparablePropertyInspectionType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</comparablePropertyInspectionType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="INSPECTION[@AppraisalInspectionPropertyType='Subject']/@AppraisalInspectionType">
		<xsl:if test=". != ''">
			<subjectPropertyInspectionType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</subjectPropertyInspectionType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="PARTIES//APPRAISER_LICENSE/@_ExpirationDate">
		<xsl:if test=". != ''">
			<appraiserLicenseExpirationDate>
				<value><xsl:value-of select="."/></value>
				<type>date</type>
			</appraiserLicenseExpirationDate>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES//APPRAISER_LICENSE/@_State">
		<xsl:if test=". != ''">
			<appraiserLicenseState>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</appraiserLicenseState>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES//APPRAISER_LICENSE[@_Type='Certificate']/@_Identifier">
		<xsl:if test=". != ''">
			<appraiserCertificateIdentifier>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</appraiserCertificateIdentifier>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES//APPRAISER_LICENSE[@_Type='License']/@_Identifier">
		<xsl:if test=". != ''">
			<appraiserLicenseIdentifier>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</appraiserLicenseIdentifier>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES//APPRAISER_LICENSE[@_Type='Other']/@_Identifier">
		<xsl:if test=". != ''">
			<appraiserLicenseTypeOtherIdentifier>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</appraiserLicenseTypeOtherIdentifier>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES//APPRAISER_LICENSE[@_Type='Other']/@_TypeOtherDescription">
		<xsl:if test=". != ''">
			<appraiserLicenseTypeOtherDescription>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</appraiserLicenseTypeOtherDescription>
		</xsl:if>
	</xsl:template>

	<!-- PARTIES=APPRAISER|LENDER|MANAGEMENT_COMPANY|SUPERVISOR -->
	<xsl:template match="PARTIES/*/@_City">
		<xsl:if test=". != ''">
			<city>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</city>
		</xsl:if>
	</xsl:template>

	<xsl:template match="PARTIES/*/@_CompanyName">
		<xsl:if test=". != ''">
			<companyName>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</companyName>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES/*/@_Name">
		<xsl:if test=". != ''">
			<fullName>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</fullName>
		</xsl:if>
	</xsl:template>

	<xsl:template match="PARTIES/*/@_PostalCode">
		<xsl:if test=". != ''">
			<postal>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</postal>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES/*/@_State">
		<xsl:if test=". != ''">
			<province>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</province>
		</xsl:if>
	</xsl:template>

	<xsl:template match="PARTIES/*/@_StreetAddress">
		<xsl:if test=". != ''">
			<streetAddress1>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</streetAddress1>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES/*/@_StreetAddress2">
		<xsl:if test=". != ''">
			<streetAddress2>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</streetAddress2>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES/*/@_UnparsedName">
		<xsl:if test=". != ''">
			<unparsedName>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</unparsedName>
		</xsl:if>
	</xsl:template>

	<!-- appraisalFormsUnparsedAddress -->
	<xsl:template match="PARTIES/LENDER/@AppraisalFormsUnparsedAddress">
		<xsl:if test=". != ''">
			<appraisalFormsUnparsedAddress>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</appraisalFormsUnparsedAddress>
		</xsl:if>
	</xsl:template>
	

	<xsl:template match="PARTIES/APPRAISER">
		<party>
			<type>
				<value>Appraiser</value>
				<type>enum</type>
			</type>
			<!-- fullName -->
			<xsl:apply-templates select="@_Name"/>
			
			<!-- companyName -->
			<xsl:apply-templates select="@_CompanyName"/>

			<!-- location -->
			<location>
				<!-- streetAddress -->	
				<xsl:apply-templates select="@_StreetAddress"/>
				<!-- streetAddress2 -->	
				<xsl:apply-templates select="@_StreetAddress2"/>
				<!-- city -->	
				<xsl:apply-templates select="@_City"/>
				<!-- province -->	
				<xsl:apply-templates select="@_State"/>
				<!-- postal -->	
				<xsl:apply-templates select="@_PostalCode"/>
			</location>
			
			<!-- contact -->
			<xsl:apply-templates select="CONTACT_DETAIL"/>
			
			<!-- appraiserCertificateIdentifier -->
			<xsl:apply-templates select="APPRAISER_LICENSE[@_Type='Certificate']/@_Identifier"/>
			<!-- appraiserLicenseExpirationDate -->
			<xsl:apply-templates select="APPRAISER_LICENSE/@_ExpirationDate"/>
			<!-- appraiserLicenseIdentifier -->
			<xsl:apply-templates select="APPRAISER_LICENSE[@_Type='License']/@_Identifier"/>
			<!-- appraiserLicenseState -->
			<xsl:apply-templates select="APPRAISER_LICENSE/@_State"/>
			<!-- appraiserLicenseTypeOtherIdentifier -->
			<xsl:apply-templates select="APPRAISER_LICENSE[@_Type='Other']/@_Identifier"/>
			<!-- appraiserLicenseTypeOtherDescription -->
			<xsl:apply-templates select="APPRAISER_LICENSE[@_Type='Other']/@_TypeOtherDescription"/>
		</party>
	</xsl:template>
	
	<xsl:template match="PARTIES/LENDER">
		<party>
			<type>
				<value>Lender</value>
				<type>enum</type>
			</type>
			<xsl:apply-templates select="@_UnparsedName"/>
			<!-- appraisalFormsUnparsedAddress -->
			<xsl:apply-templates select="@AppraisalFormsUnparsedAddress"/>
		</party>
	</xsl:template>
	
	<xsl:template match="PARTIES/MANAGEMENT_COMPANY_EXTENSION[MANAGEMENT_COMPANY_EXTENSION_SECTION[@ExtensionSectionOrganizationName='UNIFORM APPRAISAL DATASET']/MANAGEMENT_COMPANY_EXTENSION_SECTION_DATA/MANAGEMENT_COMPANY/@GSEManagementCompanyName != '']">
		<party>
			<type>
				<value>Management Company</value>
				<type>enum</type>
			</type>
			<xsl:apply-templates select="MANAGEMENT_COMPANY_EXTENSION_SECTION[@ExtensionSectionOrganizationName='UNIFORM APPRAISAL DATASET']/MANAGEMENT_COMPANY_EXTENSION_SECTION_DATA/MANAGEMENT_COMPANY/@GSEManagementCompanyName"/>
		</party>
	</xsl:template>
	
	<xsl:template match="PARTIES/MANAGEMENT_COMPANY_EXTENSION/MANAGEMENT_COMPANY_EXTENSION_SECTION[@ExtensionSectionOrganizationName='UNIFORM APPRAISAL DATASET']/MANAGEMENT_COMPANY_EXTENSION_SECTION_DATA/MANAGEMENT_COMPANY/@GSEManagementCompanyName">
		<xsl:if test=". != ''">
			<GSEManagementCompanyName>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</GSEManagementCompanyName>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PARTIES/SUPERVISOR">
		<party>
			<type>
				<value>Supervisor</value>
				<type>enum</type>
			</type>
			<!-- fullName -->
			<xsl:apply-templates select="@_Name"/>

			<!-- companyName -->
			<xsl:apply-templates select="@_CompanyName"/>

			<!-- location -->
			<location>
				<!-- streetAddress -->	
				<xsl:apply-templates select="@_StreetAddress"/>
				<!-- streetAddress2 -->	
				<xsl:apply-templates select="@_StreetAddress2"/>
				<!-- city -->	
				<xsl:apply-templates select="@_City"/>
				<!-- province -->	
				<xsl:apply-templates select="@_State"/>
				<!-- postal -->	
				<xsl:apply-templates select="@_PostalCode"/>
			</location>
			
			<!-- contact -->
			<xsl:apply-templates select="CONTACT_DETAIL"/>
			
			<!-- appraiserCertificateIdentifier -->
			<xsl:apply-templates select="APPRAISER_LICENSE[@_Type='Certificate']/@_Identifier"/>
			<!-- appraiserLicenseExpirationDate -->
			<xsl:apply-templates select="APPRAISER_LICENSE/@_ExpirationDate"/>
			<!-- appraiserLicenseIdentifier -->
			<xsl:apply-templates select="APPRAISER_LICENSE[@_Type='License']/@_Identifier"/>
			<!-- appraiserLicenseState -->
			<xsl:apply-templates select="APPRAISER_LICENSE/@_State"/>
			<!-- appraiserLicenseTypeOtherIdentifier -->
			<xsl:apply-templates select="APPRAISER_LICENSE[@_Type='Other']/@_Identifier"/>
			<!-- appraiserLicenseTypeOtherDescription -->
			<xsl:apply-templates select="APPRAISER_LICENSE[@_Type='Other']/@_TypeOtherDescription"/>
			
			<!-- subjectPropertyInspectionType -->
			<xsl:apply-templates select="INSPECTION[@AppraisalInspectionPropertyType='Subject']/@AppraisalInspectionType"/>
			<!-- comparablePropertyInspectionType -->
			<xsl:apply-templates select="INSPECTION[@AppraisalInspectionPropertyType='Comparable']/@AppraisalInspectionType"/>
		</party>
	</xsl:template>
	
</xsl:stylesheet>