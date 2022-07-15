<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="PROPERTY/_OWNER/PROPERTY_OWNER_EXTENSION/PROPERTY_OWNER_EXTENSION_SECTION[@ExtensionSectionOrganizationName='UNIFORM APPRAISAL DATASET']/PROPERTY_OWNER_EXTENSION_SECTION_DATA/PROPERTY_OWNER[@GSEPropertyOwnerName != '']/@GSEPropertyOwnerName">
		<GSEPropertyOwnerName>
			<value><xsl:value-of select="normalize-space(.)"/></value>
			<type>string</type>
		</GSEPropertyOwnerName>
	</xsl:template>

	<xsl:template match="PROPERTY/_OWNER[@_Name != '']/@_Name">
		<propertyOwnerName>
			<value><xsl:value-of select="normalize-space(.)"/></value>
			<type>string</type>
		</propertyOwnerName>
	</xsl:template>

	<xsl:template match="SALES_CONTRACT/SALES_CONCESSION_EXTENSION/SALES_CONCESSION_EXTENSION_SECTION[@ExtensionSectionOrganizationName='UNIFORM APPRAISAL DATASET']/SALES_CONCESSION_EXTENSION_SECTION_DATA/SALES_CONCESSION[@GSEUndefinedConcessionAmountIndicator != '']/@GSEUndefinedConcessionAmountIndicator">
		<GSEUndefinedConcessionAmountIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</GSEUndefinedConcessionAmountIndicator>
	</xsl:template>
	
	<xsl:template match="SALES_CONTRACT/SALES_CONTRACT_EXTENSION/SALES_CONTRACT_EXTENSION_SECTION[@ExtensionSectionOrganizationName='UNIFORM APPRAISAL DATASET']/SALES_CONTRACT_EXTENSION_SECTION_DATA/SALES_TRANSACTION[@GSESaleType != '']/@GSESaleType">
		<GSESaleType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSESaleType>
	</xsl:template>
	
	<xsl:template match="SALES_CONTRACT[@_Amount != '']/@_Amount">
		<amount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</amount>
	</xsl:template>
	
	<xsl:template match="SALES_CONTRACT[@_Date != '']/@_Date">
		<date>
			<value><xsl:value-of select="."/></value>
			<type>date</type>
		</date>
	</xsl:template>
	
	<xsl:template match="SALES_CONTRACT[@_ReviewComment != '']/@_ReviewComment">
		<reviewComment>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</reviewComment>
	</xsl:template>
	
	<xsl:template match="SALES_CONTRACT[@_ReviewedIndicator != '']/@_ReviewedIndicator">
		<reviewedIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</reviewedIndicator>
	</xsl:template>
	
	<xsl:template match="SALES_CONTRACT[@SalesConcessionAmount != '']/@SalesConcessionAmount">
		<salesConcessionAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</salesConcessionAmount>
	</xsl:template>
	
	<xsl:template match="SALES_CONTRACT[@SalesConcessionDescription != '']/@SalesConcessionDescription">
		<salesConcessionDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</salesConcessionDescription>
	</xsl:template>
	
	<xsl:template match="SALES_CONTRACT[@SalesConcessionIndicator != '']/@SalesConcessionIndicator">
		<salesConcessionIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</salesConcessionIndicator>
	</xsl:template>
	
	<xsl:template match="SALES_CONTRACT[@SellerIsOwnerIndicator != '']/@SellerIsOwnerIndicator">
		<sellerIsOwnerIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</sellerIsOwnerIndicator>
	</xsl:template>
</xsl:stylesheet>