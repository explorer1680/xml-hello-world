<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="NEIGHBORHOOD/_HOUSING[@_HighPriceAmount != '']/@_HighPriceAmount">
		<housingHighPriceAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</housingHighPriceAmount>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD/_HOUSING[@_LowPriceAmount != '']/@_LowPriceAmount">
		<housingLowPriceAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</housingLowPriceAmount>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD/_HOUSING[@_NewestYearsCount != '']/@_NewestYearsCount">
		<housingOldestYearsCount>
			<value><xsl:value-of select="."/></value>
			<type>integer</type>
		</housingOldestYearsCount>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD/_HOUSING[@_OldestYearsCount != '']/@_OldestYearsCount">
		<housingNewestYearsCount>
			<value><xsl:value-of select="."/></value>
			<type>integer</type>
		</housingNewestYearsCount>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD/_HOUSING[@_PredominantAgeYearsCount != '']/@_PredominantAgeYearsCount">
		<housingPredominantYearsCount>
			<value><xsl:value-of select="."/></value>
			<type>integer</type>
		</housingPredominantYearsCount>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD/_HOUSING[@_PredominantPriceAmount != '']/@_PredominantPriceAmount">
		<housingPredominantPriceAmout>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</housingPredominantPriceAmout>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD[@_BoundaryAndCharacteristicsDescription != '']/@_BoundaryAndCharacteristicsDescription">
		<boundaryAndCharacteristicsDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</boundaryAndCharacteristicsDescription>
	</xsl:template>

	<xsl:template match="NEIGHBORHOOD[@_BuiltupRangeType != '']/@_BuiltupRangeType">
		<builtUpRangeType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</builtUpRangeType>
	</xsl:template>

	<xsl:template match="NEIGHBORHOOD[@_Description != '']/@_Description">
		<description>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</description>
	</xsl:template>

	<xsl:template match="NEIGHBORHOOD[@_DemandSupplyType != '']/@_DemandSupplyType">
		<demandSupplyType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</demandSupplyType>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD[@_GrowthPaceType != '']/@_GrowthPaceType">
		<growthPaceType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</growthPaceType>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD[@_MarketConditionsDescription != '']/@_MarketConditionsDescription">
		<marketConditionsDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</marketConditionsDescription>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD[@_Name != '']/@_Name">
		<neighborhoodName>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</neighborhoodName>
	</xsl:template>
	
	<xsl:template match="NEIGHBORHOOD[@_PropertyValueTrendType != '']/@_PropertyValueTrendType">
		<propertyValueTrendType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</propertyValueTrendType>
	</xsl:template>

	<xsl:template match="NEIGHBORHOOD[@_TypicalMarketingTimeDurationType != '']/@_TypicalMarketingTimeDurationType">
		<typicalMarketingTimeDurationType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</typicalMarketingTimeDurationType>
	</xsl:template>

	<xsl:template match="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/_PRESENT_LAND_USE/@_Percent">
		<xsl:if test=". != ''">
			<xsl:variable name="elementName">
				<xsl:choose>
					<xsl:when test="../@_Type = 'SingleFamily'">
						presentLandUseSingleFamilyPercent
					</xsl:when>
					<xsl:when test="../@_Type = 'TwoToFourFamily'">
						presentLandUseTwoToFourFamilyPercent
					</xsl:when>
					<xsl:when test="../@_Type = 'Apartment'">
						presentLandUseApartmentPercent
					</xsl:when>
					<xsl:when test="../@_Type = 'Commercial'">
						presentLandUseCommercialPercent
					</xsl:when>
					<xsl:when test="../@_Type = 'Other'">
						presentLandUseOtherPercent
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:element name="{$elementName}">
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</xsl:element>
		</xsl:if>
	</xsl:template>

	<xsl:template match="NEIGHBORHOOD[@PropertyNeighborhoodLocationType != '']/@PropertyNeighborhoodLocationType">
		<natureOfDistrictType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</natureOfDistrictType>
	</xsl:template>
</xsl:stylesheet>