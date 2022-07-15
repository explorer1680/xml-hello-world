<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="PROPERTY_ANALYSIS[@_Type='AdverseSiteConditions' and @_ExistsIndicator != '']/@_ExistsIndicator">
		<siteNegativeInfluenceIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</siteNegativeInfluenceIndicator>
	</xsl:template>

	<xsl:template match="SITE/FLOOD_ZONE//FLOOD_ZONE_INFORMATION[@GSEFEMASpecialFloodHazardAreaIndicator != '']/@GSEFEMASpecialFloodHazardAreaIndicator">
		<GSEFEMASpecialFloodHazardAreaIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</GSEFEMASpecialFloodHazardAreaIndicator>
	</xsl:template>
	
	<xsl:template match="SITE/SITE_UTILITY">
		<siteUtility>
			<!-- type -->
			<xsl:apply-templates select="@_Type"/>
			<!-- nonPublicDescription -->
			<xsl:apply-templates select="@_NonPublicDescription"/>
			<!-- nonPublicIndicator -->
			<xsl:apply-templates select="@_NonPublicIndicator"/>
			<!-- publicIndicator -->
			<xsl:apply-templates select="@_PublicIndicator"/>
		</siteUtility>
	</xsl:template>

	<xsl:template match="SITE/SITE_UTILITY/@_Type">
		<type>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</type>
	</xsl:template>
	
	<xsl:template match="SITE/SITE_UTILITY[@_NonPublicDescription != '']/@_NonPublicDescription">
		<nonPublicDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</nonPublicDescription>
	</xsl:template>
	
	<xsl:template match="SITE/SITE_UTILITY[@_NonPublicIndicator != '']/@_NonPublicIndicator">
		<nonPublicIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</nonPublicIndicator>
	</xsl:template>
	
	<xsl:template match="SITE/SITE_UTILITY[@_PublicIndicator != '']/@_PublicIndicator">
		<publicIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</publicIndicator>
	</xsl:template>
	
	<xsl:template match="SITE[@_AreaDescription != '']/@_AreaDescription">
		<siteAreaDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</siteAreaDescription>
	</xsl:template>

	<xsl:template match="SITE[@_ZoningComplianceType != '']/@_ZoningComplianceType">
		<siteZoningComplianceType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</siteZoningComplianceType>
	</xsl:template>
	
	<xsl:template match="SITE[@HighestBestUseIndicator != '']/@HighestBestUseIndicator">
		<siteHighestBestUseIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</siteHighestBestUseIndicator>
	</xsl:template>
	
	<!-- siteHighestBestUseDescription -->
	<xsl:template match="SITE[@HighestBestUseDescription != '']/@HighestBestUseDescription">
		<siteHighestBestUseDescription>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</siteHighestBestUseDescription>
	</xsl:template>
	
	<!-- siteDimensionsDescription -->
	<xsl:template match="SITE[@_DimensionsDescription != '']/@_DimensionsDescription">
		<siteDimensionsDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</siteDimensionsDescription>
	</xsl:template>
	
</xsl:stylesheet>