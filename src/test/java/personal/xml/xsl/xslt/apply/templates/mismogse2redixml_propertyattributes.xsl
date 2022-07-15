<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="_OFF_SITE_IMPROVEMENT[@_Type='Street' and @_ExistsIndicator='Y']/@_OwnershipType">
		<xsl:if test=". != ''">
			<streetOwnershipType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</streetOwnershipType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="_OFF_SITE_IMPROVEMENT[(@_Type='StreetSurface' or @_Type='Street') and @_Description != '']/@_Description">
		<streetTypeDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</streetTypeDescription>
	</xsl:template>

	<xsl:template match="PARCEL_IDENTIFIER[@GSEAssessorsParcelIdentifier != '']/@GSEAssessorsParcelIdentifier">
		<GSEAssessorsParcelIdentifier>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</GSEAssessorsParcelIdentifier>
	</xsl:template>

	<xsl:template match="PROPERTY_TYPE[@GSE_PUDIndicator != '']/@GSE_PUDIndicator">
		<GSEPUDIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</GSEPUDIndicator>
	</xsl:template>

	<xsl:template match="PROPERTY/_IDENTIFICATION[@AssessorsParcelIdentifier]/@AssessorsParcelIdentifier">
		<assessorsParcelIdentifier>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</assessorsParcelIdentifier>
	</xsl:template>
	
	<xsl:template match="PROPERTY/_IDENTIFICATION[@CensusTractIdentifier != '']/@CensusTractIdentifier">
		<censusTractIdentifier>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</censusTractIdentifier>
	</xsl:template>
	
	<xsl:template match="PROPERTY/_LEGAL_DESCRIPTION[@_TextDescription != '']/@_TextDescription">
		<propertyLegalDescriptionText>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</propertyLegalDescriptionText>
	</xsl:template>
	
	<xsl:template match="PROPERTY/LISTING_HISTORY[@ListedWithinPreviousYearDescription != '']/@ListedWithinPreviousYearDescription">
		<listingHistoryListedWithinPreviousYearDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</listingHistoryListedWithinPreviousYearDescription>
	</xsl:template>
	
	<xsl:template match="PROPERTY/LISTING_HISTORY[@ListedWithinPreviousYearIndicator != '']/@ListedWithinPreviousYearIndicator">
		<listingHistoryListedWithinPreviousYearIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</listingHistoryListedWithinPreviousYearIndicator>
	</xsl:template>
	
	<xsl:template match="PROPERTY/PROJECT/_PER_UNIT_FEE/@_Amount">
		<xsl:if test=". != ''">
			<projectPerUnitFeeAmount>
				<value><xsl:value-of select="."/></value>
				<type>currency</type>
			</projectPerUnitFeeAmount>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PROPERTY/PROJECT/_PER_UNIT_FEE/@_PeriodType">
		<xsl:if test=". != ''">
			<projectPerUnitFeePeriodType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</projectPerUnitFeePeriodType>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PROPERTY/PROJECT/DEVELOPMENT_STAGE[@_Type='Complete' and @UnitsRentedCount != '']/@UnitsRentedCount">
		<projectCompleteUnitsRentedCount>
			<value><xsl:value-of select="."/></value>
			<type>integer</type>
		</projectCompleteUnitsRentedCount>
	</xsl:template>
	
	<!-- 2.6 -->
	<xsl:template match="PROPERTY/PROJECT/DEVELOPMENT_STAGE[@_Type='SubjectPhase' and @LivingUnitCount != '']/@LivingUnitCount">
		<projectSubjectPhasePlannedUnitsCount>
			<value><xsl:value-of select="."/></value>
			<type>integer</type>
		</projectSubjectPhasePlannedUnitsCount>
	</xsl:template>
	
	<!-- 2.6GSE -->
	<xsl:template match="PROPERTY/PROJECT/DEVELOPMENT_STAGE[@_Type='SubjectPhase' and @PlannedUnitsCount != '']/@PlannedUnitsCount">
		<projectSubjectPhasePlannedUnitsCount>
			<value><xsl:value-of select="."/></value>
			<type>integer</type>
		</projectSubjectPhasePlannedUnitsCount>
	</xsl:template>
	
	<xsl:template match="PROPERTY/PROJECT[@_ClassificationType]/@_ClassificationType">
		<projectClassificationType>
			<value><xsl:value-of select="."/></value>
		</projectClassificationType>
	</xsl:template>
	
	<xsl:template match="PROPERTY/PROJECT[@_CommercialSpaceIndicator != '']/@_CommercialSpaceIndicator">
		<projectCommercialSpaceIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</projectCommercialSpaceIndicator>
	</xsl:template>

	<xsl:template match="PROPERTY/PROJECT[@_DeveloperControlsProjectManagementIndicator != '']/@_DeveloperControlsProjectManagementIndicator">
		<projectDeveloperControlsProjectManagementIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</projectDeveloperControlsProjectManagementIndicator>
	</xsl:template>
	
	<xsl:template match="PROPERTY/PROJECT[@_Name != '']/@_Name">
		<projectName>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</projectName>
	</xsl:template>

	<xsl:template match="PROPERTY/PROJECT[@GSEProjectCommercialSpacePercent != '']/@GSEProjectCommercialSpacePercent">
		<GSEProjectCommercialSpacePercent>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</GSEProjectCommercialSpacePercent>
	</xsl:template>
	
	<xsl:template match="PROPERTY/PROPERTY_ANALYSIS[@_Type='PropertyCondition' and @_Comment != '']/@_Comment">
		<propertyAnalysisComment>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</propertyAnalysisComment>
	</xsl:template>
	
	<xsl:template match="PROPERTY/STRUCTURE[@ManufacturedHomeIndicator != '']/@ManufacturedHomeIndicator">
		<manufacturedHomeIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</manufacturedHomeIndicator>
	</xsl:template>
	
	<xsl:template match="PROPERTY[@_CurrentOccupancyType != '']/@_CurrentOccupancyType">
		<propertyCurrentOccupancyType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</propertyCurrentOccupancyType>
	</xsl:template>
	
	<xsl:template match="PROPERTY[@_RightsType != '']/@_RightsType">
		<propertyRightsType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</propertyRightsType>
	</xsl:template>

	<xsl:template match="PROPERTY[@_RightsTypeOtherDescription != '']/@_RightsTypeOtherDescription">
		<propertyRightsTypeOtherDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</propertyRightsTypeOtherDescription>
	</xsl:template>

	<xsl:template match="PROPERTY[@ProjectClassificationType != '']/@ProjectClassificationType">
		<projectClassificationType>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</projectClassificationType>
	</xsl:template>

	<xsl:template match="REPORT/@AppraisalFormType" mode="manufacturedHomeIndicator">
		<xsl:if test="current() = 'FNM1004C'">
			<manufacturedHomeIndicator>
				<value><xsl:text>Y</xsl:text></value>
				<type>boolean</type>
			</manufacturedHomeIndicator>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>