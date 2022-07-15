<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="AMENITY">
		<amenity>
			<xsl:if test="@_Type != ''">				
				<type>
					<value><xsl:value-of select="@_Type"></xsl:value-of></value>
					<type>enum</type>
				</type>
			</xsl:if>
			<!-- typeOtherDescription -->
			<xsl:apply-templates select="@_TypeOtherDescription"/>
			<!-- existsIndicator -->
			<xsl:apply-templates select="@_ExistsIndicator"/>
			<!-- count -->
			<xsl:apply-templates select="@_Count"/>
			<!-- detailedDescription -->
			<xsl:apply-templates select="@_DetailedDescription"/>
		</amenity>
	</xsl:template>

	<xsl:template match="AMENITY/@_Count">
		<xsl:if test=". != ''">
			<count>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</count>
		</xsl:if>
	</xsl:template>

	<xsl:template match="AMENITY/@_DetailedDescription">
		<xsl:if test=". != ''">
			<detailedDescription>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</detailedDescription>
		</xsl:if>
	</xsl:template>

	<xsl:template match="AMENITY/@_ExistsIndicator">
		<xsl:if test=". != ''">
			<existsIndicator>
				<value><xsl:value-of select="."/></value>
				<type>boolean</type>
			</existsIndicator>
		</xsl:if>
	</xsl:template>

	<xsl:template match="AMENITY/@_TypeOtherDescription">
		<xsl:if test=". != ''">
			<typeOtherDescription>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</typeOtherDescription>
		</xsl:if>
	</xsl:template>

	<xsl:template match="CONDITION_DETAIL/@GSEEstimateYearOfImprovementType">
		<xsl:if test=". != ''">
			<GSEEstimateYearOfImprovementType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</GSEEstimateYearOfImprovementType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="CONDITION_DETAIL">
		<xsl:if test="@GSEEstimateYearOfImprovementType != '' or
			@GSEImprovementAreaType != '' or
			@GSEImprovementDescriptionType != ''">
			<improvementDetail>
				<!-- GSEImprovementAreaType -->
				<xsl:apply-templates select="@GSEImprovementAreaType"/>
				<!-- GSEEstimateYearOfImprovementType -->
				<xsl:apply-templates select="@GSEEstimateYearOfImprovementType"/>
				<!-- GSEImprovementDescriptionType -->
				<xsl:apply-templates select="@GSEImprovementDescriptionType"/>
			</improvementDetail>
		</xsl:if>
	</xsl:template>

	<xsl:template match="CONDITION_DETAIL/@GSEImprovementAreaType">
		<xsl:if test=". != ''">
			<GSEImprovementAreaType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</GSEImprovementAreaType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="CONDITION_DETAIL/@GSEImprovementDescriptionType">
		<xsl:if test=". != ''">
			<GSEImprovementDescriptionType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</GSEImprovementDescriptionType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="COST_ANALYSIS/@EstimatedRemainingEconomicLifeYearsCount">
		<xsl:if test=". != ''">
			<remainingEconomicLifeYearsCount>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</remainingEconomicLifeYearsCount>
		</xsl:if>
	</xsl:template>

	<xsl:template match="EFFECTIVE_AGE/@GSEEffectiveAgeDescription">
		<xsl:if test=". != ''">
			<GSEEffectiveAgeDescription>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</GSEEffectiveAgeDescription>
		</xsl:if>
	</xsl:template>

	<xsl:template match="OVERALL_CONDITION_RATING/@GSEUpdateLastFifteenYearIndicator">
		<xsl:if test=". != ''">
			<GSEUpdateLastFifteenYearIndicator>
				<value><xsl:value-of select="."/></value>
				<type>boolean</type>
			</GSEUpdateLastFifteenYearIndicator>
		</xsl:if>
	</xsl:template>

	<xsl:template match="PROJECT_CAR_STORAGE/@GuestParkingSpacesCount">
		<xsl:if test=". != ''">
			<guestParkingSpacesCount>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</guestParkingSpacesCount>
		</xsl:if>
	</xsl:template>

	<!-- designType -->
	<xsl:template match="PROPERTY/PROJECT/@_DesignType" mode="designType">
		<xsl:if test=". != ''">
			<designType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</designType>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PROPERTY/PROJECT/@_DesignType" mode="propertyCategoryType">
		<xsl:if test=". != ''">
			<propertyCategoryType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</propertyCategoryType>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="PROPERTY/PROPERTY_ANALYSIS[@_Type = 'PhysicalDeficiency']/@_ExistsIndicator">
		<xsl:if test=". != ''">
			<physicalDeficiencyExistsIndicator>
				<value><xsl:value-of select="."/></value>
				<type>boolean</type>
			</physicalDeficiencyExistsIndicator>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE_INFORMATION/@GSEStoriesCount">
		<xsl:if test=". != ''">
			<GSEStoriesCount>
				<value><xsl:value-of select="."/></value>
				<type>decimal</type>
			</GSEStoriesCount>
		</xsl:if>
	</xsl:template>

	<xsl:template match="PROPERTY/PROPERTY_ANALYSIS[@_Type='ConformsToNeighborhood']/@_ExistsIndicator">
		<xsl:if test=". != ''">
			<structureTypicalToNeighborhoodExistsIndicator>
				<value><xsl:value-of select="."/></value>
				<type>boolean</type>
			</structureTypicalToNeighborhoodExistsIndicator>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@_AccessoryUnitCount">
		<xsl:if test=". != ''">
			<accessoryUnitCount>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</accessoryUnitCount>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/@_AccessoryUnitExistsIndicator">
		<xsl:if test=". = 'Y'">
			<accessoryUnitCount>
				<value>1</value>
				<type>integer</type>
			</accessoryUnitCount>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@_DesignDescription">
		<xsl:if test=". != ''">
			<structureDesignStyleTypeText>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</structureDesignStyleTypeText>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@BuildingStatusType">
		<xsl:if test=". != ''">
			<buildingStatusType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</buildingStatusType>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@GrossBuildingAreaSquareFeetCount">
		<xsl:if test=". != ''">
			<structureGrossBuildingAreaSquareFeetCount>
				<value><xsl:value-of select="."/></value>
				<type>decimal</type>
			</structureGrossBuildingAreaSquareFeetCount>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@GrossLivingAreaSquareFeetCount">
		<xsl:if test=". != ''">
			<structureGrossLivingAreaSquareFeetCount>
				<value><xsl:value-of select="."/></value>
				<type>decimal</type>
			</structureGrossLivingAreaSquareFeetCount>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@PropertyStructureBuiltYear">
		<xsl:if test=". != ''">
			<structureBuiltYear>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</structureBuiltYear>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@StoriesCount">
		<xsl:if test=". != ''">
			<levelCount>
				<value><xsl:value-of select="."/></value>
				<type>decimal</type>
			</levelCount>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@TotalBathroomCount">
		<xsl:if test=". != ''">
			<totalBathroomCount>
				<value><xsl:value-of select="."/></value>
				<type>decimal</type>
			</totalBathroomCount>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@TotalBedroomCount">
		<xsl:if test=". != ''">
			<totalBedroomCount>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</totalBedroomCount>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="STRUCTURE/@TotalRoomCount">
		<xsl:if test=". != ''">
			<totalRoomCount>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</totalRoomCount>
		</xsl:if>
	</xsl:template>
	
	<!-- Note: basement is created out of BASEMENT and FOUNDATION! -->
	<xsl:template name="mapBasement">
		<xsl:variable name="basementVar">
			<!-- basementFinishedPercent -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/BASEMENT/@_FinishedPercent"/>
			<!-- basementSquareFeetCount -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/BASEMENT/@SquareFeetCount"/>
			<!-- basementType -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/FOUNDATION/@_Type"/>
		</xsl:variable>
		<xsl:if test="count($basementVar/*) > 0">
			<basement>
				<xsl:copy-of select="$basementVar"/>
			</basement>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/@AttachmentType">
		<xsl:if test=". != ''">
			<propertyCategoryType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</propertyCategoryType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/BASEMENT/@_FinishedPercent">
		<xsl:if test=". != ''">
			<basementFinishedPercent>
				<value><xsl:value-of select="."/></value>
				<type>decimal</type>
			</basementFinishedPercent>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/BASEMENT/@SquareFeetCount">
		<xsl:if test=". != ''">
			<basementSquareFeetCount>
				<value><xsl:value-of select="."/></value>
				<type>decimal</type>
			</basementSquareFeetCount>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/@ParkingSpacesCount">
		<xsl:if test=". != ''">
			<carStorageParkingSpacesCount>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</carStorageParkingSpacesCount>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/CAR_STORAGE_LOCATION">
		<carStorage>
			<!-- type -->
			<xsl:apply-templates select="@_Type"/>
			<!-- MISMO2.6 (first version) uses AttachmentType, while 2.6Errata1 and 2.6GSE use _AttachmentType! So, need to check both! -->
			<!-- attachmentType -->
			<xsl:choose>
				<xsl:when test="../@_AttachmentType">
				<xsl:apply-templates select="../@_AttachmentType" mode="carStorageAttachmentNested"/>
				</xsl:when>
				<xsl:when test="../@AttachmentType">
					<xsl:apply-templates select="../@AttachmentType" mode="carStorageAttachmentNested"/>
				</xsl:when>
			</xsl:choose>
			<!-- existsIndicator -->
			<xsl:apply-templates select="@_ExistsIndicator"/>
			<!-- parkingSpacesCount -->
			<xsl:apply-templates select="@ParkingSpacesCount"/>
		</carStorage>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/CAR_STORAGE_LOCATION/@_Type">
		<xsl:if test=". != ''">
			<type>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</type>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/CAR_STORAGE_LOCATION/@_ExistsIndicator">
		<xsl:if test=". != ''">
			<existsIndicator>
				<value><xsl:value-of select="."/></value>
				<type>boolean</type>
			</existsIndicator>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/CAR_STORAGE_LOCATION/@ParkingSpacesCount">
		<xsl:if test=". != ''">
			<parkingSpacesCount>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</parkingSpacesCount>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/@_AttachmentType" mode="structureCarStorageAttachment">
		<xsl:if test=". != ''">
			<carStorageAttachmentType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</carStorageAttachmentType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/@_AttachmentType" mode="carStorageAttachmentNested">
		<xsl:if test=". != ''">
			<attachmentType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</attachmentType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/@AttachmentType" mode="structureCarStorageAttachment">
		<xsl:if test=". != ''">
			<carStorageAttachmentType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</carStorageAttachmentType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/@AttachmentType" mode="carStorageAttachmentNested">
		<xsl:if test=". != ''">
			<attachmentType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</attachmentType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/CAR_STORAGE/@ParkingSpaceAssignmentType">
		<xsl:if test=". != ''">
			<parkingSpaceAssignmentType>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</parkingSpaceAssignmentType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/COOLING">
		<xsl:if test="@_CentralizedIndicator != '' or
			@_IndividualIndicator != '' or
			@_OtherIndicator != '' or
			@_UnitDescription != ''">
			<cooling>
				<!-- centralizedIndicator -->
				<xsl:apply-templates select="@_CentralizedIndicator"/>
				<!-- individualIndicator -->
				<xsl:apply-templates select="@_IndividualIndicator"/>
				<!-- otherIndicator -->
				<xsl:apply-templates select="@_OtherIndicator"/>
				<!-- unitDescription -->
				<xsl:apply-templates select="@_UnitDescription"/>
			</cooling>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/COOLING/@_CentralizedIndicator">
		<xsl:if test=". != ''">
			<centralizedIndicator>
				<value><xsl:value-of select="."/></value>
				<type>boolean</type>
			</centralizedIndicator>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/COOLING/@_IndividualIndicator">
		<xsl:if test=". != ''">
			<individualIndicator>
				<value><xsl:value-of select="."/></value>
				<type>boolean</type>
			</individualIndicator>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/COOLING/@_OtherIndicator">
		<xsl:if test=". != ''">
			<otherIndicator>
				<value><xsl:value-of select="."/></value>
				<type>boolean</type>
			</otherIndicator>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/COOLING/@_UnitDescription">
		<xsl:if test=". != ''">
			<unitDescription>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</unitDescription>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/EXTERIOR_FEATURE[@_Type='Foundation']/@_Description">
		<xsl:if test=". != ''">
			<foundationText>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</foundationText>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/EXTERIOR_FEATURE[@_Type='RoofSurface']/@_Description">
		<xsl:if test=". != ''">
			<roofingDescription>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</roofingDescription>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/FOUNDATION/_CONDITION">
		<foundationCondition>
			<!-- type -->
			<xsl:apply-templates select="@_Type"/>
			<!-- existsIndicator -->
			<xsl:apply-templates select="@_ExistsIndicator"/>
		</foundationCondition>
	</xsl:template>

	<xsl:template match="STRUCTURE/FOUNDATION/_CONDITION/@_ExistsIndicator">
		<xsl:if test=". != ''">
			<existsIndicator>
				<value><xsl:value-of select="."/></value>
				<type>boolean</type>
			</existsIndicator>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/FOUNDATION/_CONDITION/@_Type">
		<xsl:if test=". != ''">
			<type>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</type>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/FOUNDATION/@_Type">
		<xsl:if test="../@_ExistsIndicator = 'Y'">
			<basementType>
				<type>
					<value><xsl:value-of select="."/></value>
					<type>enum</type>
				</type>
			</basementType>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/HEATING/@_FuelDescription">
		<xsl:if test=". != ''">
			<heatingFuel>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</heatingFuel>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/HEATING">
		<xsl:if test="@_Type != '' or @_UnitDescription != ''">
			<heating>
				<!-- type -->
				<xsl:apply-templates select="@_Type"/>
				<!-- typeDescription -->
				<xsl:apply-templates select="@_UnitDescription"/>
        <!-- typeOtherDescription -->
        <xsl:if test="@_Type = 'Other'">
          <xsl:apply-templates select="@_TypeOtherDescription"/>
        </xsl:if>
			</heating>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/HEATING/@_Type">
		<xsl:if test=". != ''">
			<type>
				<value><xsl:value-of select="."/></value>
				<type>enum</type>
			</type>
		</xsl:if>
	</xsl:template>

  <xsl:template match="STRUCTURE/HEATING/@_TypeOtherDescription">
    <xsl:if test=". != ''">
      <typeOtherDescription>
        <value>
          <xsl:value-of select="."/>
        </value>
        <type>string</type>
      </typeOtherDescription>
    </xsl:if>
  </xsl:template>

	<xsl:template match="STRUCTURE/HEATING/@_UnitDescription">
		<xsl:if test=". != ''">
			<typeDescription>
				<value><xsl:value-of select="."/></value>
				<type>string</type>
			</typeDescription>
		</xsl:if>
	</xsl:template>

	<xsl:template match="STRUCTURE/STRUCTURE_ANALYSIS/@EffectiveAgeYearsCount">
		<xsl:if test=". != ''">
			<effectiveAgeYearsCount>
				<value><xsl:value-of select="."/></value>
				<type>decimal</type>
			</effectiveAgeYearsCount>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>