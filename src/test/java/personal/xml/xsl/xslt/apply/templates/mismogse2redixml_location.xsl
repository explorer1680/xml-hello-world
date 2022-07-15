<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="PROPERTY[@_City != '']/@_City">
		<city>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</city>
	</xsl:template>
	
	<xsl:template match="PROPERTY[@_City != '' and
		@_PostalCode != '' and
		@_State != '' and
		@_StreetAddress != '']">
		
		<location>
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/_UNIT/@UnitIdentifier"/>
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/@_StreetAddress"/>
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/@_StreetAddress2"/>
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/@_City"/>
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/@_State"/>
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/@_PostalCode"/>
			<!-- geoCoordinate -->
			<xsl:if test="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/COMPARABLE_SALE[@PropertySequenceIdentifier = '0']/LOCATION/@LatitudeNumber != '' or
				/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/COMPARABLE_SALE[@PropertySequenceIdentifier = '0']/LOCATION/@LongitudeNumber != ''">
				<geoCoordinate>
					<!-- latitude -->
					<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/COMPARABLE_SALE[@PropertySequenceIdentifier = '0']/LOCATION/@LatitudeNumber"/>
					<!-- longitude -->
					<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/COMPARABLE_SALE[@PropertySequenceIdentifier = '0']/LOCATION/@LongitudeNumber"/>
				</geoCoordinate>
			</xsl:if>
		</location>
	</xsl:template>
	
	<xsl:template match="PROPERTY[@_PostalCode != '']/@_PostalCode">
		<postal>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</postal>
	</xsl:template>
	
	<xsl:template match="PROPERTY[@_State != '']/@_State">
		<province>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</province>
	</xsl:template>
	
	<xsl:template match="PROPERTY[@_StreetAddress != '']/@_StreetAddress">
		<streetAddress1>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</streetAddress1>
	</xsl:template>
	
	<xsl:template match="PROPERTY[@_StreetAddress2 != '']/@_StreetAddress2">
		<streetAddress2>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</streetAddress2>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/_UNIT[@UnitIdentifier != '']/@UnitIdentifier">
		<unitIdentifier>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</unitIdentifier>
	</xsl:template>
</xsl:stylesheet>