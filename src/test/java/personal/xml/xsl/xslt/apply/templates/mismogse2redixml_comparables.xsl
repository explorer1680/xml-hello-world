<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="COMPARABLE_SALE">
		<xsl:if test="@PropertySequenceIdentifier != ''">
			<comparable>

				<!-- adjustedSalePriceAmount -->
				<xsl:apply-templates select="@AdjustedSalesPriceAmount"/>


				<!-- comparableAdjustment -->
				<xsl:apply-templates select="SALE_PRICE_ADJUSTMENT" mode="comparableAdjustment"/>
				<!-- comparableAdjustmentOtherFeature -->
				<xsl:apply-templates select="OTHER_FEATURE_ADJUSTMENT"/>

				<comparablePosition>
					<value>
						<xsl:value-of select="@PropertySequenceIdentifier"/>
					</value>
					<type>integer</type>
				</comparablePosition>

				<!-- dataSourceVerificationDescription -->
				<xsl:apply-templates select="@DataSourceVerificationDescription"/>

				<!-- dataSourceDescription -->
        <xsl:apply-templates select="@DataSourceDescription"/>

				<!-- GSEBasementExitType -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEBasementExitType"/>
				<!-- GSEBelowGradeBathroomRoomCount -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEBelowGradeBathroomRoomCount"/>
				<!-- GSEBelowGradeBedroomRoomCount -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEBelowGradeBedroomRoomCount"/>
				<!-- GSEBelowGradeFinishSquareFeetNumber -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEBelowGradeFinishSquareFeetNumber"/>
				<!-- GSEBelowGradeOtherRoomCount -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEBelowGradeOtherRoomCount"/>
				<!-- GSEBelowGradeRecreationRoomCount -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEBelowGradeRecreationRoomCount"/>
				<!-- GSEBelowGradeTotalSquareFeetNumber -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEBelowGradeTotalSquareFeetNumber"/>
				<!-- GSEConcessionAmount -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEConcessionAmount"/>
				<!-- GSEContractDateUnknownIndicator -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEContractDateUnknownIndicator"/>
				<!-- GSEDataSourceDescription -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEDataSourceDescription"/>
				<!-- GSEDaysOnMarketDescription -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEDaysOnMarketDescription"/>
				<!-- GSEFinancingType -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEFinancingType"/>
				<!-- GSEFinancingTypeOtherDescription -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEFinancingTypeOtherDescription"/>
				<!-- GSEListingStatusType -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEListingStatusType"/>
				<!-- GSELocationType -->
				<xsl:apply-templates select="COMPARISON_LOCATION_DETAIL_EXTENSION//COMPARISON_LOCATION_DETAIL[@_SequenceIdentifier='1']/@GSELocationType"/>
				<!-- GSELocationTypeOtherDescription -->
				<xsl:apply-templates select="COMPARISON_LOCATION_DETAIL_EXTENSION//COMPARISON_LOCATION_DETAIL[@_SequenceIdentifier='1']/@GSELocationTypeOtherDescription"/>
				<!-- GSEOverallConditionType -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEOverallConditionType"/>
				<!-- GSEOverallLocationRatingType -->
				<xsl:apply-templates select="COMPARISON_LOCATION_OVERALL_RATING_EXTENSION//COMPARISON_LOCATION_OVERALL_RATING/@GSEOverallLocationRatingType"/>
				<!-- GSEQualityOfConstructionRatingType -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSEQualityOfConstructionRatingType"/>
				<!-- GSEPriorSaleDate -->
				<xsl:apply-templates select="PRIOR_SALES/PRIOR_SALES_EXTENSION//PRIOR_SALE/@GSEPriorSaleDate"/>
				<!-- GSESaleType -->
				<xsl:apply-templates select="COMPARISON_DETAIL_EXTENSION//COMPARISON_DETAIL/@GSESaleType"/>
				<!-- GSEShortDateDescription -->
				<xsl:apply-templates select="COMPARISON_DATE_EXTENSION//OFFERING_DISPOSITION/@GSEShortDateDescription"/>
				<!-- GSEView -->
				<xsl:apply-templates select="COMPARISON_VIEW_DETAIL_EXTENSION//COMPARISON_VIEW_DETAIL[@_SequenceIdentifier != '']"/>
				<!-- GSEViewOverallRatingType -->
				<xsl:apply-templates select="COMPARISON_VIEW_OVERALL_RATING_EXTENSION//COMPARISON_VIEW_OVERALL_RATING/@GSEViewOverallRatingType"/>

				<!-- location -->
				<xsl:apply-templates select="LOCATION"/>

				<!-- overallConditionType -->
				<xsl:apply-templates select="SALE_PRICE_ADJUSTMENT[@_Type='Condition']/@_Description" mode="overallConditionType"/>

				<!-- priorSaleDataSourceDescription -->
				<xsl:apply-templates select="PRIOR_SALES[1]/@DataSourceDescription"/>
				<!-- priorSaleDataSourceEffectiveDate -->
				<xsl:apply-templates select="PRIOR_SALES[1]/@DataSourceEffectiveDate"/>
				<!-- priorSaleDate -->
				<xsl:apply-templates select="PRIOR_SALES[1]/@PropertySalesDate"/>
				<!-- priorSalePropertySalesAmount -->
				<xsl:apply-templates select="PRIOR_SALES[1]/@PropertySalesAmount"/>
				<!-- projectName -->
				<xsl:apply-templates select="@ProjectName"/>
				<!-- propertySalesAmount -->
				<xsl:apply-templates select="@PropertySalesAmount"/>
				<!-- proximityToSubjectDescription -->
				<xsl:apply-templates select="LOCATION/@ProximityToSubjectDescription"/>

				<!-- rentalUnit -->
				<xsl:if test="ROOM_ADJUSTMENT[@UnitSequenceIdentifier]">
					<rental>
						<xsl:apply-templates select="ROOM_ADJUSTMENT[@UnitSequenceIdentifier]"/>
					</rental>
				</xsl:if>

				<!-- salePriceTotalAdjustmentAmount -->
				<xsl:apply-templates select="@SalePriceTotalAdjustmentAmount"/>
				<!-- salePriceTotalAdjustmentGrossPercent -->
				<xsl:apply-templates select="@SalesPriceTotalAdjustmentGrossPercent"/>
				<!-- salePriceTotalAdjustmentNetPercent -->
				<xsl:apply-templates select="@SalePriceTotalAdjustmentNetPercent"/>
				<!-- salesPricePerGrossLivingAreaAmount -->
				<xsl:apply-templates select="@SalesPricePerGrossLivingAreaAmount"/>

				<xsl:if test="//REPORT[@AppraisalFormType != 'FNM1025']">
					<!-- totalBathroomCount -->
					<xsl:apply-templates select="ROOM_ADJUSTMENT[not(@UnitSequenceIdentifier)]/@TotalBathroomCount"/>
					<!-- totalBedroomCount -->
					<xsl:apply-templates select="ROOM_ADJUSTMENT[not(@UnitSequenceIdentifier)]/@TotalBedroomCount"/>
					<!-- totalRoomCount -->
					<xsl:apply-templates select="ROOM_ADJUSTMENT[not(@UnitSequenceIdentifier)]/@TotalRoomCount"/>
				</xsl:if>
			</comparable>
		</xsl:if>
	</xsl:template>

	<xsl:template match="COMPARABLE_SALE[@AdjustedSalesPriceAmount != '']/@AdjustedSalesPriceAmount">
		<adjustedSalePriceAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</adjustedSalePriceAmount>
	</xsl:template>

	<xsl:template match="COMPARABLE_SALE[@DataSourceVerificationDescription != '']/@DataSourceVerificationDescription">
		<dataSourceVerificationDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</dataSourceVerificationDescription>
	</xsl:template>

	<xsl:template match="COMPARABLE_SALE[@DataSourceDescription != '']/@DataSourceDescription">
		<dataSourceDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</dataSourceDescription>
	</xsl:template>

	<xsl:template match="COMPARABLE_SALE[@ProjectName != '']/@ProjectName">
		<projectName>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</projectName>
	</xsl:template>

	<xsl:template match="COMPARABLE_SALE[@PropertySalesAmount != '']/@PropertySalesAmount">
		<propertySalesAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</propertySalesAmount>
	</xsl:template>

	<xsl:template match="COMPARABLE_SALE[@SalePriceTotalAdjustmentAmount != '']/@SalePriceTotalAdjustmentAmount">
		<salePriceTotalAdjustmentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</salePriceTotalAdjustmentAmount>
	</xsl:template>

	<xsl:template match="COMPARABLE_SALE[@SalePriceTotalAdjustmentNetPercent != '']/@SalePriceTotalAdjustmentNetPercent">
		<salePriceTotalAdjustmentNetPercent>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</salePriceTotalAdjustmentNetPercent>
	</xsl:template>

	<xsl:template match="COMPARABLE_SALE[@SalesPricePerGrossLivingAreaAmount != '']/@SalesPricePerGrossLivingAreaAmount">
		<salesPricePerGrossLivingAreaAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</salesPricePerGrossLivingAreaAmount>
	</xsl:template>

	<xsl:template match="COMPARABLE_SALE[@SalesPriceTotalAdjustmentGrossPercent != '']/@SalesPriceTotalAdjustmentGrossPercent">
		<salePriceTotalAdjustmentGrossPercent>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</salePriceTotalAdjustmentGrossPercent>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEBasementExitType != '']/@GSEBasementExitType">
		<GSEBasementExitType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSEBasementExitType>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEBelowGradeBathroomRoomCount != '']/@GSEBelowGradeBathroomRoomCount">
		<GSEBelowGradeBathroomRoomCount>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</GSEBelowGradeBathroomRoomCount>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEBelowGradeBedroomRoomCount != '']/@GSEBelowGradeBedroomRoomCount">
		<GSEBelowGradeBedroomRoomCount>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</GSEBelowGradeBedroomRoomCount>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEBelowGradeFinishSquareFeetNumber != '']/@GSEBelowGradeFinishSquareFeetNumber">
		<GSEBelowGradeFinishSquareFeetNumber>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</GSEBelowGradeFinishSquareFeetNumber>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEBelowGradeOtherRoomCount != '']/@GSEBelowGradeOtherRoomCount">
		<GSEBelowGradeOtherRoomCount>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</GSEBelowGradeOtherRoomCount>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEBelowGradeRecreationRoomCount != '']/@GSEBelowGradeRecreationRoomCount">
		<GSEBelowGradeRecreationRoomCount>
			<value><xsl:value-of select="."/></value>
			<type>integer</type>
		</GSEBelowGradeRecreationRoomCount>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEBelowGradeTotalSquareFeetNumber != '']/@GSEBelowGradeTotalSquareFeetNumber">
		<GSEBelowGradeTotalSquareFeetNumber>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</GSEBelowGradeTotalSquareFeetNumber>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEConcessionAmount != '']/@GSEConcessionAmount">
		<GSEConcessionAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</GSEConcessionAmount>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEContractDateUnknownIndicator != '']/@GSEContractDateUnknownIndicator">
		<GSEContractDateUnknownIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</GSEContractDateUnknownIndicator>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEDataSourceDescription != '']/@GSEDataSourceDescription">
		<GSEDataSourceDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</GSEDataSourceDescription>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEDaysOnMarketDescription != '']/@GSEDaysOnMarketDescription">
		<GSEDaysOnMarketDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</GSEDaysOnMarketDescription>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEFinancingType != '']/@GSEFinancingType">
		<GSEFinancingType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSEFinancingType>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEFinancingTypeOtherDescription != '']/@GSEFinancingTypeOtherDescription">
		<GSEFinancingTypeOtherDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</GSEFinancingTypeOtherDescription>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEListingStatusType != '']/@GSEListingStatusType">
		<GSEListingStatusType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSEListingStatusType>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEOverallConditionType != '']/@GSEOverallConditionType">
		<GSEOverallConditionType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSEOverallConditionType>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSEQualityOfConstructionRatingType != '']/@GSEQualityOfConstructionRatingType">
		<GSEQualityOfConstructionRatingType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSEQualityOfConstructionRatingType>
	</xsl:template>

	<xsl:template match="COMPARISON_DETAIL[@GSESaleType != '']/@GSESaleType">
		<GSESaleType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSESaleType>
	</xsl:template>

	<xsl:template match="COMPARISON_LOCATION_DETAIL[@_SequenceIdentifier='1' and @GSELocationType != '']/@GSELocationType">
		<GSELocationType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSELocationType>
	</xsl:template>

	<xsl:template match="COMPARISON_LOCATION_DETAIL[@_SequenceIdentifier='1' and @GSELocationTypeOtherDescription != '']/@GSELocationTypeOtherDescription">
		<GSELocationTypeOtherDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</GSELocationTypeOtherDescription>
	</xsl:template>

	<xsl:template match="COMPARISON_LOCATION_OVERALL_RATING[@GSEOverallLocationRatingType != '']/@GSEOverallLocationRatingType">
		<GSEOverallLocationRatingType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSEOverallLocationRatingType>
	</xsl:template>

	<xsl:template match="COMPARISON_VIEW_DETAIL[@_SequenceIdentifier != '']">
		<GSEView>
			<!-- type -->
			<xsl:apply-templates select="@GSEViewType"/>
			<!-- typeOtherDescription -->
			<xsl:apply-templates select="@GSEViewTypeOtherDescription"/>
		</GSEView>
	</xsl:template>

	<xsl:template match="COMPARISON_VIEW_DETAIL/@GSEViewType">
		<type>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</type>
	</xsl:template>
	
	<xsl:template match="COMPARISON_VIEW_DETAIL[@GSEViewTypeOtherDescription != '']/@GSEViewTypeOtherDescription">
		<typeOtherDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</typeOtherDescription>
	</xsl:template>

	<xsl:template match="COMPARISON_VIEW_OVERALL_RATING[@GSEViewOverallRatingType != '']/@GSEViewOverallRatingType">
		<GSEViewOverallRatingType>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</GSEViewOverallRatingType>
	</xsl:template>

	<xsl:template match="LOCATION">
		<location>
			<!-- unitIdentifier -->
			<xsl:apply-templates select="@UnitIdentifier"/>
			<!-- streetAddress1 -->
			<xsl:apply-templates select="@PropertyStreetAddress"/>
			<!-- streetAddress2 -->
			<xsl:apply-templates select="@PropertyStreetAddress2"/>
			<!-- city -->
			<xsl:apply-templates select="@PropertyCity"/>
			<!-- state -->
			<xsl:apply-templates select="@PropertyState"/>
			<!-- postal -->
			<xsl:apply-templates select="@PropertyPostalCode"/>
			<!-- geoCoordinate -->
			<xsl:if test="@LatitudeNumber != '' or @LongitudeNumber != ''">
				<geoCoordinate>
					<!-- latitude -->
					<xsl:apply-templates select="@LatitudeNumber"/>
					<!-- longitude -->
					<xsl:apply-templates select="@LongitudeNumber"/>
				</geoCoordinate>
			</xsl:if>
		</location>
	</xsl:template>

	<xsl:template match="LOCATION[@LatitudeNumber != '']/@LatitudeNumber">
		<latitude>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</latitude>
	</xsl:template>

	<xsl:template match="LOCATION[@LongitudeNumber != '']/@LongitudeNumber">
		<longitude>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</longitude>
	</xsl:template>

	<xsl:template match="LOCATION[@PropertyCity != '']/@PropertyCity">
		<city>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</city>
	</xsl:template>
	
	<xsl:template match="LOCATION[@PropertyPostalCode != '']/@PropertyPostalCode">
		<postal>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</postal>
	</xsl:template>
	
	<xsl:template match="LOCATION[@PropertyState != '']/@PropertyState">
		<province>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</province>
	</xsl:template>
	
	<xsl:template match="LOCATION[@PropertyStreetAddress != '']/@PropertyStreetAddress">
		<streetAddress1>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</streetAddress1>
	</xsl:template>
	
	<xsl:template match="LOCATION[@PropertyStreetAddress2 != '']/@PropertyStreetAddress2">
		<streetAddress2>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</streetAddress2>
	</xsl:template>
	
	<xsl:template match="LOCATION[@ProximityToSubjectDescription != '']/@ProximityToSubjectDescription">
		<proximityToSubjectDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</proximityToSubjectDescription>
	</xsl:template>

	<xsl:template match="LOCATION[@UnitIdentifier != '']/@UnitIdentifier">
		<unitIdentifier>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</unitIdentifier>
	</xsl:template>
	
	<xsl:template match="OFFERING_DISPOSITION[@GSEShortDateDescription != '']/@GSEShortDateDescription">
		<GSEShortDateDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</GSEShortDateDescription>
	</xsl:template>

	<xsl:template match="OTHER_FEATURE_ADJUSTMENT">
		<comparableAdjustmentOtherFeature>
			<!-- propertyFeatureSequenceIdentifier -->
			<xsl:apply-templates select="@PropertyFeatureSequenceIdentifier"/>
			<!-- propertyFeatureDescription -->
			<xsl:apply-templates select="@PropertyFeatureDescription"/>
			<!-- propertyFeatureAdjustmentAmount -->
			<xsl:apply-templates select="@PropertyFeatureAdjustmentAmount"/>
		</comparableAdjustmentOtherFeature>
	</xsl:template>

	<xsl:template match="OTHER_FEATURE_ADJUSTMENT[@PropertyFeatureAdjustmentAmount != '']/@PropertyFeatureAdjustmentAmount">
		<propertyFeatureAdjustmentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</propertyFeatureAdjustmentAmount>
	</xsl:template>

	<xsl:template match="OTHER_FEATURE_ADJUSTMENT[@PropertyFeatureDescription != '']/@PropertyFeatureDescription">
		<propertyFeatureDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</propertyFeatureDescription>
	</xsl:template>

	<xsl:template match="OTHER_FEATURE_ADJUSTMENT[@PropertyFeatureSequenceIdentifier != '']/@PropertyFeatureSequenceIdentifier">
		<propertyFeatureSequenceIdentifier>
			<value><xsl:value-of select="."/></value>
			<type>integer</type>
		</propertyFeatureSequenceIdentifier>
	</xsl:template>

	<xsl:template match="PRIOR_SALE[@GSEPriorSaleDate != '']/@GSEPriorSaleDate">
		<GSEPriorSaleDate>
			<value><xsl:value-of select="."/></value>
			<type>date</type>
		</GSEPriorSaleDate>
	</xsl:template>

	<xsl:template match="PRIOR_SALES[@DataSourceDescription != '']/@DataSourceDescription">
		<priorSaleDataSourceDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</priorSaleDataSourceDescription>
	</xsl:template>

	<xsl:template match="PRIOR_SALES[@DataSourceEffectiveDate != '']/@DataSourceEffectiveDate">
		<priorSaleDataSourceEffectiveDate>
			<value><xsl:value-of select="."/></value>
			<type>date</type>
		</priorSaleDataSourceEffectiveDate>
	</xsl:template>

	<xsl:template match="PRIOR_SALES[@PropertySalesAmount != '']/@PropertySalesAmount">
		<priorSalePropertySalesAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</priorSalePropertySalesAmount>
	</xsl:template>

	<xsl:template match="PRIOR_SALES[@PropertySalesDate != '']/@PropertySalesDate">
		<priorSaleDate>
			<value><xsl:value-of select="."/></value>
			<type>date</type>
		</priorSaleDate>
	</xsl:template>

	<xsl:template match="ROOM_ADJUSTMENT[not(@UnitSequenceIdentifier) and @TotalBathroomCount != '']/@TotalBathroomCount">
		<totalBathroomCount>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</totalBathroomCount>
	</xsl:template>
	<xsl:template match="ROOM_ADJUSTMENT[not(@UnitSequenceIdentifier) and @TotalBedroomCount != '']/@TotalBedroomCount">
		<totalBedroomCount>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</totalBedroomCount>
	</xsl:template>

	<xsl:template match="ROOM_ADJUSTMENT[not(@UnitSequenceIdentifier) and @TotalRoomCount != '']/@TotalRoomCount">
		<totalRoomCount>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</totalRoomCount>
	</xsl:template>

	<xsl:template match="SALE_PRICE_ADJUSTMENT[@_Amount != '']/@_Amount">
		<adjustmentValueAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</adjustmentValueAmount>
	</xsl:template>

	<xsl:template match="SALE_PRICE_ADJUSTMENT[@_Description != '']/@_Description">
		<adjustmentDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</adjustmentDescription>
	</xsl:template>

	<xsl:template match="SALE_PRICE_ADJUSTMENT[@_Type != '']" mode="comparableAdjustment">
		<comparableAdjustment>
			<!-- adjustmentDescription -->
			<xsl:apply-templates select="@_Description"/>

			<adjustmentType>
				<value><xsl:value-of select="@_Type"/></value>
				<type>enum</type>
			</adjustmentType>

			<!-- adjustmentTypeOtherDescription -->
			<xsl:apply-templates select="@_TypeOtherDescription"/>
			<!-- adjustmentValueAmount -->
			<xsl:apply-templates select="@_Amount"/>
		</comparableAdjustment>
	</xsl:template>

	<xsl:template match="SALE_PRICE_ADJUSTMENT[@_Type = 'Condition' and @_Description != '']/@_Description" mode="overallConditionType">
		<overallConditionType>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</overallConditionType>
	</xsl:template>

	<xsl:template match="SALE_PRICE_ADJUSTMENT[@_TypeOtherDescription != '']/@_TypeOtherDescription">
		<adjustmentTypeOtherDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</adjustmentTypeOtherDescription>
	</xsl:template>

	<xsl:template match="SALES_COMPARISON/RESEARCH/COMPARABLE[@_HasPriorSalesIndicator != '']/@_HasPriorSalesIndicator">
		<comparableHasPriorSalesIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</comparableHasPriorSalesIndicator>
	</xsl:template>

</xsl:stylesheet>
