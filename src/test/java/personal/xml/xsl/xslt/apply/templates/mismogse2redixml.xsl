<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:sig="http://www.w3.org/2000/09/xmldsig#"
    exclude-result-prefixes="xs sig" version="2.0">
    <xsl:output indent="yes"/>
    <!-- xsl:output indent="no"/ -->
    <xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_comparables.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_incomeanalysis.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_location.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_neighborhood.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_opinion.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_party.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_propertyattributes.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_rental.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_report.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_salehistory.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_salescontract.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_site.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_tax.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_structure.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_transaction.xsl"/>
	<xsl:include href="src/test/java/personal/xml/xsl/xslt/apply/templates/mismogse2redixml_valuation.xsl"/>

    <xsl:template match="/">
        <Property>
            <generationStatus>
                <fileSource>XMLTRANSLATOR</fileSource>
            </generationStatus>
        	<xsl:call-template name="mapConditionRating"/>
        	<xsl:call-template name="mapImage"/>
        	<xsl:call-template name="mapLocation"/>
        	<xsl:call-template name="mapNeighborhood"/>
        	<xsl:call-template name="mapPropertyAttributes"/>
        	<xsl:call-template name="mapRental"/>
        	<xsl:call-template name="mapReport"/>
        	<xsl:call-template name="mapSalesContract"/>
        	<xsl:call-template name="mapSaleHistory"/>
        	<xsl:call-template name="mapSite"/>
					<xsl:call-template name="mapTax"/>
        	<xsl:call-template name="mapStructure"/>
        	<xsl:call-template name="mapTransaction"/>
        	<xsl:call-template name="mapValuation"/>
			<xsl:call-template name="mapAnalysis"/>
        	<xsl:call-template name="mapIncomeAnalysis"/>
        </Property>
    </xsl:template>

    <xsl:template name="mapConditionRating">
    	<!-- xsl:variable name="conditionRating">
    		
    	</xsl:variable>
    	<xsl:if test="count($conditionRating/*) > 0">
    		<conditionRating>
    			<xsl:copy-of select="$conditionRating"/>
    		</conditionRating>
    	</xsl:if -->
    </xsl:template>

    <xsl:template name="mapImage">
    	<!-- xsl:variable name="image">
    	</xsl:variable>
    	<xsl:if test="count($image/*) > 0">
    		<image>
    			<xsl:copy-of select="$image"/>
    		</image>
    	</xsl:if -->
    </xsl:template>


    <xsl:template name="mapAppraiserInformation">
    </xsl:template>


    <xsl:template name="mapLocation">
    	<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY"/>
    </xsl:template>


	<xsl:template name="mapNeighborhood">
    	<xsl:variable name="neighborhood">
    		<!-- boundaryAndCharacteristicsDescription -->
	    	<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@_BoundaryAndCharacteristicsDescription"/>

			<!-- builtUpRangeType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@_BuiltupRangeType"/>

    		<!-- demandSupplyType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@_DemandSupplyType"/>
    		<!-- description -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@_Description"/>
    		
    		<!-- growthPaceType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@_GrowthPaceType"/>
    		
    		<!-- housingOldestYearsCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/_HOUSING/@_NewestYearsCount"/>
    		<!-- housingNewestYearsCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/_HOUSING/@_OldestYearsCount"/>
    		<!-- housingLowPriceAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/_HOUSING/@_LowPriceAmount"/>
    		<!-- housingHighPriceAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/_HOUSING/@_HighPriceAmount"/>
    		<!-- housingPredominantPriceAmout -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/_HOUSING/@_PredominantPriceAmount"/>
    		<!-- housingPredominantYearsCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/_HOUSING/@_PredominantAgeYearsCount"/>
    		
    		<!-- marketConditionsDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@_MarketConditionsDescription"/>
    		
    		<!-- natureOfDistrictType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@PropertyNeighborhoodLocationType"/>
    		<!-- neighborhoodName -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@_Name"/>
    		
    		<!-- presentLandUseSingleFamilyPercent -->
    		<!-- presentLandUseTwoToFourFamilyPercent -->
    		<!-- presentLandUseApartmentPercent -->
    		<!-- presentLandUseCommercialPercent -->
    		<!-- presentLandUseOtherPercent -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/_PRESENT_LAND_USE[@_Type!='']/@_Percent"/>
    		<!-- propertyValueTrendType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@_PropertyValueTrendType"/>
    		
    		<!-- typicalMarketingTimeDurationType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/NEIGHBORHOOD/@_TypicalMarketingTimeDurationType"/>
    	</xsl:variable>
    	<xsl:if test="count($neighborhood/*) > 0">
    		<neighborhood>
    			<xsl:copy-of select="$neighborhood"/>
    		</neighborhood>
    	</xsl:if>
    </xsl:template>

	<xsl:template name="mapOpinion">
		<xsl:variable name="opinion">
			<!-- valuationReconciliationSummaryDescription -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION/_RECONCILIATION/@_ConditionsComment"/>
		</xsl:variable>
		<xsl:if test="count($opinion/*) > 0">
			<opinion>
				<xsl:copy-of select="$opinion"/>
			</opinion>
		</xsl:if>
	</xsl:template>
	
    <xsl:template name="mapPropertyAttributes">
    	<xsl:variable name="propertyAttributes">
    		<!-- assessorsParcelIdentifier -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_IDENTIFICATION/@AssessorsParcelIdentifier"/>
    		
    		<!-- censusTractIdentifier -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_IDENTIFICATION/@CensusTractIdentifier"/>
    		
    		<!-- GSEAssessorsParcelIdentifier -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_IDENTIFICATION//PARCEL_IDENTIFIER/@GSEAssessorsParcelIdentifier"/>
    		<!-- GSEProjectCommercialSpacePercent -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/@GSEProjectCommercialSpacePercent"/>
    		<!-- GSEPUDIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY//PROPERTY_TYPE/@GSE_PUDIndicator"/>
    		
    		<!-- listingHistoryListedWithinPreviousYearDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/LISTING_HISTORY/@ListedWithinPreviousYearDescription"/>
    		<!-- listingHistoryListedWithinPreviousYearIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/LISTING_HISTORY/@ListedWithinPreviousYearIndicator"/>

    		<!-- manufacturedHomeIndicator -->
    		<xsl:choose>
    			<xsl:when test="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@ManufacturedHomeIndicator">
    				<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@ManufacturedHomeIndicator"/>
    			</xsl:when>
    			<xsl:otherwise>
    				<xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@AppraisalFormType" mode="manufacturedHomeIndicator"/>
    			</xsl:otherwise>
    		</xsl:choose>

    		<!-- projectClassificationType -->
			<xsl:choose>
				<xsl:when test="/VALUATION_RESPONSE/PROPERTY/@ProjectClassificationType">
					<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/@ProjectClassificationType"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/@_ClassificationType"/>
				</xsl:otherwise>
			</xsl:choose>
    		<!-- projectCommercialSpaceIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/@_CommercialSpaceIndicator"/>
    		<!-- projectCompleteUnitsRentedCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/DEVELOPMENT_STAGE[@_Type='Complete']/@UnitsRentedCount"/>
    		<!-- projectDeveloperControlsProjectManagementIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/@_DeveloperControlsProjectManagementIndicator"/>
    		<!-- projectName -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/@_Name"/>
    		<!-- projectPerUnitFeeAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/_PER_UNIT_FEE/@_Amount"/>
    		<!-- projectPerUnitFeePeriodType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/_PER_UNIT_FEE/@_PeriodType"/>
			
			<xsl:choose>
				<xsl:when test="/VALUATION_RESPONSE/PROPERTY/PROJECT/DEVELOPMENT_STAGE[@_Type='SubjectPhase']/@PlannedUnitsCount">
					<!-- 2.6GSE -->
					<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/DEVELOPMENT_STAGE[@_Type='SubjectPhase']/@PlannedUnitsCount"/>
				</xsl:when>
				<xsl:when test="/VALUATION_RESPONSE/PROPERTY/PROJECT/DEVELOPMENT_STAGE[@_Type='SubjectPhase']/@LivingUnitCount">
				    <!-- 2.6 -->
					<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/DEVELOPMENT_STAGE[@_Type='SubjectPhase']/@LivingUnitCount"/>
				 </xsl:when>
			 </xsl:choose>
			
    		<!-- propertyAnalysisComment -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROPERTY_ANALYSIS[@_Type='PropertyCondition']/@_Comment"/>
    		<!-- propertyCurrentOccupancyType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/@_CurrentOccupancyType"/>
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_LEGAL_DESCRIPTION/@_TextDescription"/>
    		<!-- propertyRightsType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/@_RightsType"/>
    		<!-- propertyRightsTypeOtherDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/@_RightsTypeOtherDescription"/>
    		
    		<!-- streetOwnershipType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_OFF_SITE_IMPROVEMENT[@_Type='Street' and @_ExistsIndicator='Y'][1]/@_OwnershipType"/>
    		<!-- streetTypeDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_OFF_SITE_IMPROVEMENT[@_Type='StreetSurface' or @_Type='Street'][1]/@_Description"/>
    	</xsl:variable>
    	<xsl:if test="count($propertyAttributes/*) > 0">
    		<propertyAttributes>
    			<xsl:copy-of select="$propertyAttributes"/>
    		</propertyAttributes>
    	</xsl:if>
    </xsl:template>

	<xsl:template name="mapRental">
		<xsl:variable name="rental">
			<!-- rentalUnit -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/COMPARABLE_SALE[@PropertySequenceIdentifier='0']/ROOM_ADJUSTMENT"/>
			<!-- rentalUnitTotalCount -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@LivingUnitCount" mode="rentalUnitTotalCount"/>
		</xsl:variable>
		<xsl:if test="count($rental/*) > 0">
			<rental>
				<xsl:copy-of select="$rental"/>
			</rental>
		</xsl:if>
	</xsl:template>

    <xsl:template name="mapReport">
    	<xsl:variable name="report">
    	    <!-- appraiserFileIdentifier -->
    	    <xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@AppraiserFileIdentifier"/>
    	    <!-- appraiserAdditionalFileIdentifier -->
    	    <xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@AppraiserAdditionalFileIdentifier"/>
    	    <!-- appraisalFormType -->
	        <xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@AppraisalFormType"/>
    		<!-- appraiserInspectionDate, appraiserInspectionDate -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PARTIES/APPRAISER/INSPECTION/@InspectionDate"/>
    		<!-- appraisalPurposeType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@AppraisalPurposeType"/>
    		<!-- appraisalPurposeTypeOtherDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@AppraisalPurposeTypeOtherDescription"/>
    		<!-- appraisalReportContentIdentifier -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/FORM[@AppraisalReportContentType='AppraisalForm']/@AppraisalReportContentIdentifier"/>
    		<!-- appraiserReportSignedDate -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@AppraiserReportSignedDate"/>
    	    <!-- appraiserReportSignedDigitallyIndicator -->
    	    <xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/FORM[@AppraisalReportContentTypeOtherDescription = 'Signature']/IMAGE/
    	        EMBEDDED_FILE[@_Type='DigitalSignature']/DOCUMENT/sig:Signature[@Id='APPRAISAL_SIGNATURE']/sig:SignatureValue"/>
    	    <!-- appraisalSoftwareProductName -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@AppraisalSoftwareProductName"/>
    		<!-- appraisalSoftwareProductVersionIdentifier -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@AppraisalSoftwareProductVersionIdentifier"/>
    		
    		<!-- supervisorComparableInspectionDate, supervisorComparableInspectionDateText -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PARTIES/SUPERVISOR/INSPECTION[@AppraisalInspectionPropertyType = 'Comparable']/@InspectionDate"/>
    		<!-- supervisorInspectionDate, supervisorInspectionDateText -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PARTIES/SUPERVISOR/INSPECTION[@AppraisalInspectionPropertyType = 'Subject']/@InspectionDate"/>
    		<!-- supervisorReportSignedDate -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/REPORT/@SupervisorReportSignedDate"/>
    	</xsl:variable>
    	<xsl:if test="count($report/*) > 0">
    		<report>
    			<xsl:copy-of select="$report"/>
    		</report>
    	</xsl:if>
    </xsl:template>


    <xsl:template name="mapSalesContract">
    	<xsl:variable name="salesContract">
    		<!-- amount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/@_Amount"/>
    		<!-- date -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/@_Date"/>

    		<!-- GSEPropertyOwnerName -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_OWNER/PROPERTY_OWNER_EXTENSION/PROPERTY_OWNER_EXTENSION_SECTION[@ExtensionSectionOrganizationName='UNIFORM APPRAISAL DATASET']/PROPERTY_OWNER_EXTENSION_SECTION_DATA/PROPERTY_OWNER/@GSEPropertyOwnerName"/>
    		<!-- GSESaleType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/SALES_CONTRACT_EXTENSION/SALES_CONTRACT_EXTENSION_SECTION[@ExtensionSectionOrganizationName='UNIFORM APPRAISAL DATASET']/SALES_CONTRACT_EXTENSION_SECTION_DATA/SALES_TRANSACTION/@GSESaleType"/>
    		<!-- GSEUndefinedConcessionAmountIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/SALES_CONCESSION_EXTENSION/SALES_CONCESSION_EXTENSION_SECTION[@ExtensionSectionOrganizationName='UNIFORM APPRAISAL DATASET']/SALES_CONCESSION_EXTENSION_SECTION_DATA/SALES_CONCESSION/@GSEUndefinedConcessionAmountIndicator"/>

    		<!-- propertyOwnerName -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_OWNER/@_Name"/>
    		
    		<!-- reviewComment -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/@_ReviewComment"/>
    		<!-- reviewedIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/@_ReviewedIndicator"/>
    		<!-- salesConcessionAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/@SalesConcessionAmount"/>
    		<!-- salesConcessionDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/@SalesConcessionDescription"/>
    		<!-- salesConcessionIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/@SalesConcessionIndicator"/>
    		<!-- sellerIsOwnerIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SALES_CONTRACT/@SellerIsOwnerIndicator"/>
    	</xsl:variable>
    	<xsl:if test="count($salesContract/*) > 0">
    		<salesContract>
    			<xsl:copy-of select="$salesContract"/>
    		</salesContract>
    	</xsl:if>
    </xsl:template>


    <xsl:template name="mapSaleHistory">
    	<xsl:variable name="saleHistory">
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/RESEARCH/SUBJECT/@_HasPriorSalesIndicator"/>
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/RESEARCH/@SalesHistoryResearchedIndicator"/>
    	</xsl:variable>
    	<xsl:if test="count($saleHistory/*) > 0">
    		<saleHistory>
    			<xsl:copy-of select="$saleHistory"/>
    		</saleHistory>
    	</xsl:if>
    </xsl:template>


    <xsl:template name="mapSite">
    	<xsl:variable name="site">
    		<!-- GSEFEMASpecialFloodHazardAreaIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SITE/FLOOD_ZONE//FLOOD_ZONE_INFORMATION/@GSEFEMASpecialFloodHazardAreaIndicator"/>
    		<!-- siteAreaDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SITE/@_AreaDescription"/>
    		<!-- siteHighestBestUseIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SITE/@HighestBestUseIndicator"/>
    		<!-- siteHighestBestUseDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SITE/@HighestBestUseDescription"/>
    		<!-- siteNegativeInfluenceIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROPERTY_ANALYSIS[@_Type='AdverseSiteConditions']/@_ExistsIndicator"/>
    		<!-- siteUtility -->
	        <xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SITE/SITE_UTILITY"/>
    		<!-- siteZoningComplianceType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SITE/@_ZoningComplianceType"/>

			<!-- siteDimensionsDescription -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SITE/@_DimensionsDescription"/>

			<!-- siteZoningClassificationDescription -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/SITE/@_ZoningClassificationDescription"/>

    	</xsl:variable>
    	<xsl:if test="count($site/*) > 0">
    		<site>
    			<xsl:copy-of select="$site"/>
    		</site>
    	</xsl:if>
    </xsl:template>


	<xsl:template name="mapTax">
		<xsl:variable name="tax">
			<!-- totalSpecialTaxAmount -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_TAX/@_TotalSpecialTaxAmount"/>
			<!-- totalTaxAmount -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_TAX/@_TotalTaxAmount"/>
			<!-- taxYearIdentifier -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_TAX/@_YearIdentifier"/>

			<!-- propertyTaxExtension -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/_TAX/PROPERTY_TAX_EXTENSION"/>

		</xsl:variable>
		<xsl:if test="count($tax/*) > 0">
			<tax>
				<xsl:copy-of select="$tax"/>
			</tax>
		</xsl:if>
	</xsl:template>


    <xsl:template name="mapStructure">
    	<xsl:variable name="structure">
    		<!-- accessoryUnitCount -->
    		<xsl:choose>
    			<!-- 1025 sometimes uses this field -->
    			<xsl:when test="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@_AccessoryUnitCount">
    				<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@_AccessoryUnitCount"/>
    			</xsl:when>
    			<xsl:otherwise>
    				<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@_AccessoryUnitExistsIndicator"/>    					
    			</xsl:otherwise>
    		</xsl:choose>
    		<!-- amenity -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/AMENITY"/>
    		
    		<!-- basement -->
    		<xsl:call-template name="mapBasement"/>
    		<!-- buildingStatusType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@BuildingStatusType"/>
    		<!-- carStorage -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/CAR_STORAGE/CAR_STORAGE_LOCATION"/>
    		<!-- carStorageAttachmentType -->
    		<xsl:choose>
    			<xsl:when test="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/CAR_STORAGE/@_AttachmentType">
	    			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/CAR_STORAGE/@_AttachmentType" mode="structureCarStorageAttachment"/>
    			</xsl:when>
    			<xsl:when test="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/CAR_STORAGE/@AttachmentType">
    				<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/CAR_STORAGE/@AttachmentType" mode="structureCarStorageAttachment"/>
    			</xsl:when>
    		</xsl:choose>
    		<!-- carStorageParkingSpacesCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/CAR_STORAGE/@ParkingSpacesCount"/>
    		<!-- cooling -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/COOLING"/>
    		
    		<!-- designType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/@_DesignType" mode="designType"/>

    		<!-- effectiveAgeYearsCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/STRUCTURE_ANALYSIS/@EffectiveAgeYearsCount"/>
    		
    		<!-- foundationCondition -->
        <xsl:apply-templates
            select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/FOUNDATION[@_ExistsIndicator='Y']/_CONDITION"/>
    		<!-- foundationText-->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/EXTERIOR_FEATURE[@_Type='Foundation']/@_Description"/>
    		
    		<!-- GSEEffectiveAgeDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/STRUCTURE_ANALYSIS//EFFECTIVE_AGE/@GSEEffectiveAgeDescription"/>
    		<!-- GSEStoriesCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE//STRUCTURE_INFORMATION/@GSEStoriesCount"/>
    		<!-- GSEUpdateLastFifteenYearIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE//OVERALL_CONDITION_RATING/@GSEUpdateLastFifteenYearIndicator"/>
    		<!-- guestParkingSpacesCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/PROJECT_CAR_STORAGE/@GuestParkingSpacesCount"/>

    		<!-- heating -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/HEATING"/>
    		<!-- heatingFuel -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/HEATING/@_FuelDescription"/>
    		
    		<!-- improvementDetail -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE//CONDITION_DETAIL"/>
    		
    		<!-- levelCount (the total number of levels in a condo) -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@StoriesCount"/>
    		
    		<!-- parkingSpaceAssignmentType -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/CAR_STORAGE/@ParkingSpaceAssignmentType"/>
    		<!-- physicalDeficiencyExistsIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROPERTY_ANALYSIS[@_Type = 'PhysicalDeficiency']/@_ExistsIndicator"/>
    		<!-- propertyCategoryType -->
    		<xsl:choose>
    			<xsl:when test="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@AttachmentType">
	    			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@AttachmentType"/>
    			</xsl:when>
    			<xsl:otherwise>
    				<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/@_DesignType" mode="propertyCategoryType"/>
    			</xsl:otherwise>
    		</xsl:choose>
    		
    		<!-- remainingEconomicLifeYearsCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/COST_ANALYSIS/@EstimatedRemainingEconomicLifeYearsCount"/>
    		<!-- roofingDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/EXTERIOR_FEATURE[@_Type='RoofSurface']/@_Description"/>

    		<!-- structureBuiltYear -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@PropertyStructureBuiltYear"/>
    		<!-- structureDesignStyleTypeText -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@_DesignDescription"/>
    		<!-- structureGrossBuildingAreaSquareFeetCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@GrossBuildingAreaSquareFeetCount"/>
    		<!-- structureGrossLivingAreaSquareFeetCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@GrossLivingAreaSquareFeetCount"/>
    		<!-- structureTypicalToNeighborhoodExistsIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROPERTY_ANALYSIS[@_Type='ConformsToNeighborhood']/@_ExistsIndicator"/>
    		
    		<!-- totalBathroomCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@TotalBathroomCount"/>
    		<!-- totalBathroomCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@TotalBedroomCount"/>
    		<!-- totalRoomCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/@TotalRoomCount"/>
    	</xsl:variable>
    	<xsl:if test="count($structure/*) > 0">
    		<structure>
    			<xsl:copy-of select="$structure"/>
    		</structure>
    	</xsl:if>
    </xsl:template>


    <xsl:template name="mapTransaction">
    	<xsl:variable name="transaction">
    		<!-- comparable -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/COMPARABLE_SALE"/>
    		<!-- comparableHasPriorSalesIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/RESEARCH/COMPARABLE/@_HasPriorSalesIndicator"/>

    		<!-- comparableListingsPriceRangeHighAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/RESEARCH/@ComparableListingsPriceRangeHighAmount"/>
    		<!-- comparableListingsPriceRangeLowAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/RESEARCH/@ComparableListingsPriceRangeLowAmount"/>
    		<!-- comparableListingsResearchedCount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/RESEARCH/@ComparableListingsResearchedCount"/>
    		<!-- comparableSummarySaleConclusionsDescription -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/@_Comment"/>
    		
    		<xsl:call-template name="mapOpinion"/>
    		
    		<!-- parties -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PARTIES/APPRAISER"/>
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PARTIES/LENDER"/>
    		<!--
				We only want Supervisors with a @_Name. Using the @_Name filter in the template further down produced white spaces,
				maybe for the APPRAISER_LICENSE?
			-->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PARTIES/SUPERVISOR[@_Name != '']"/>
    		<xsl:apply-templates select="/VALUATION_RESPONSE/PARTIES/MANAGEMENT_COMPANY_EXTENSION"/>
    	</xsl:variable>
    	<xsl:if test="count($transaction/*) > 0">
    		<transaction>
    			<xsl:copy-of select="$transaction"/>
    			<type>
    				<value>Appraisal</value>
    				<type>enum</type>
    			</type>
    		</transaction>
    	</xsl:if>
    </xsl:template>

    <xsl:template name="mapValuation">
    	<xsl:variable name="valuation">
    		<!-- appraisalEffectiveDate -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION/@AppraisalEffectiveDate"/>
    		
    		<!-- conditionOfAppraisal -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION/_RECONCILIATION/_CONDITION_OF_APPRAISAL"/>
    		
    		<!-- newImprovementTotalCostAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/COST_ANALYSIS/@NewImprovementTotalCostAmount"/>

    		<!-- propertyAppraisedValueAmount -->
    		<xsl:choose>
    			<!-- formtype 2000 stores it in /VALUATION_RESPONSE/APPRAISAL_REVIEW/@_OriginalAppraisedValueAmount
    			and/or @PropertyAppraisedValueAmount -->
    			<xsl:when test="/VALUATION_RESPONSE/APPRAISAL_REVIEW/@_OriginalAppraisedValueAmount != ''">
    				<xsl:apply-templates select="/VALUATION_RESPONSE/APPRAISAL_REVIEW/@_OriginalAppraisedValueAmount"/>
    			</xsl:when>
    			<!-- 1004d uses this one: -->
    			<xsl:when test="/VALUATION_RESPONSE/APPRAISAL_UPDATE/@AppraisalReviewOriginalAppraisedValueAmount != ''">
    				<xsl:apply-templates select="/VALUATION_RESPONSE/APPRAISAL_UPDATE/@AppraisalReviewOriginalAppraisedValueAmount"/>
    			</xsl:when>
    			<xsl:otherwise>
    				<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION/@PropertyAppraisedValueAmount"/>
    			</xsl:otherwise>
    		</xsl:choose>
    		<!-- propertyExternalDepreciationAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/COST_ANALYSIS/DEPRECIATION/@_ExteriorAmount"/>
    		<!-- propertyMarketValueDecreasedIndicator -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/APPRAISAL_UPDATE/@PropertyMarketValueDecreasedIndicator"/>
    		<!-- propertyTaxImprovementValueAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/COST_ANALYSIS/@NewImprovementDepreciatedCostAmount"/>
    		<!-- propertyTaxLandValueAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/COST_ANALYSIS/@SiteEstimatedValueAmount"/>
    		
    		<!-- valueApproach-->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/COST_ANALYSIS/@_Type"/>
    		<!-- valueIndicatedByCostAnalysisApproachAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/COST_ANALYSIS/@ValueIndicatedByCostApproachAmount"/>
    		<!-- valueIndicatedByIncomeAnalysisApproachAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/INCOME_ANALYSIS/@ValueIndicatedByIncomeApproachAmount"/>
    		<!-- valueIndicatedBySalesComparisonApproachAmount -->
    		<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/@ValueIndicatedBySalesComparisonApproachAmount"/>
    		<!-- additionalDescription -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/@_AdditionalDescription"/>
    	</xsl:variable>
    	<xsl:if test="count($valuation/*) > 0">
    		<valuation>
    			<xsl:copy-of select="$valuation"/>
    		</valuation>
    	</xsl:if>
    </xsl:template>

	<xsl:template name="mapIncomeAnalysis">
		<xsl:variable name="incomeAnalysis">
			<!-- estimatedMarketRentAmount -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/INCOME_ANALYSIS/@EstimatedMarketMonthlyRentAmount"/>
			<!-- rentalActualGrossMonthlyRentAmount -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/INCOME_ANALYSIS/MULTIFAMILY_RENT_SCHEDULE/@RentalActualGrossMonthlyRentAmount"/>
			<!-- rentalEstimatedGrossMonthlyRentAmount -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/INCOME_ANALYSIS/MULTIFAMILY_RENT_SCHEDULE/@RentalEstimatedGrossMonthlyRentAmount"/>
			<!-- rentalUnitChargePerMonthAmount -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/PROJECT_ANALYSIS/UNIT_CHARGE[@_PeriodType='Monthly']/@_Amount"/>
			<!-- rentalUnitChargePerYearAmount -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/PROJECT/PROJECT_ANALYSIS/UNIT_CHARGE[@_PeriodType='Annually']/@_Amount"/>
		</xsl:variable>
		<xsl:if test="count($incomeAnalysis/*) > 0">
			<incomeAnalysis>
				<xsl:copy-of select="$incomeAnalysis"/>
			</incomeAnalysis>
		</xsl:if>
	</xsl:template>

	<xsl:template name="mapAnalysis">
		<xsl:variable name="analysis">
			<!-- mlsNumberIndicator -->

			<xsl:if test="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/COMPARABLE_SALE/SALE_PRICE_ADJUSTMENT[@_Type='DateOfSale' and @_Amount !='' and @_Amount !='0']">
				<marketConditionsAppliedIndicator>
					<value>Y</value>
					<type>string</type>
				</marketConditionsAppliedIndicator>
			</xsl:if>

		</xsl:variable>
		<xsl:if test="count($analysis/*) > 0">
			<analysis>
				<xsl:copy-of select="$analysis"/>
			</analysis>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>