<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="APPRAISAL_REVIEW[@_OriginalAppraisedValueAmount != '']/@_OriginalAppraisedValueAmount">
		<propertyAppraisedValueAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</propertyAppraisedValueAmount>
	</xsl:template>

	<xsl:template match="APPRAISAL_UPDATE[@PropertyMarketValueDecreasedIndicator != '']/@PropertyMarketValueDecreasedIndicator">
		<propertyMarketValueDecreasedIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</propertyMarketValueDecreasedIndicator>
	</xsl:template>

	<xsl:template match="APPRAISAL_UPDATE[@AppraisalReviewOriginalAppraisedValueAmount != '']/@AppraisalReviewOriginalAppraisedValueAmount">
		<propertyAppraisedValueAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</propertyAppraisedValueAmount>
	</xsl:template>

	<xsl:template match="VALUATION_METHODS/COST_ANALYSIS/@NewImprovementTotalCostAmount">
		<newImprovementTotalCostAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</newImprovementTotalCostAmount>
	</xsl:template>

	<xsl:template match="VALUATION_METHODS/COST_ANALYSIS/DEPRECIATION[@_ExteriorAmount != '']/@_ExteriorAmount">
		<propertyExternalDepreciationAmount>
			<value>
				<xsl:value-of select="tokenize(
					substring(
					current(),
					string-length(
					tokenize(current(), '[0-9]')[1]
					)+1
					),
					'[!#$%()*+,/:;=>?@\^_`{|}~-]|[A-Za-z]|\s'
					)[1]"/>
			</value>
			<type>currency</type>
		</propertyExternalDepreciationAmount>
	</xsl:template>
	
	<xsl:template match="VALUATION_METHODS/COST_ANALYSIS[@NewImprovementDepreciatedCostAmount != '']/@NewImprovementDepreciatedCostAmount">
		<propertyTaxImprovementValueAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</propertyTaxImprovementValueAmount>
	</xsl:template>
	
	<xsl:template match="VALUATION_METHODS/COST_ANALYSIS[@SiteEstimatedValueAmount != '']/@SiteEstimatedValueAmount">
		<propertyTaxLandValueAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</propertyTaxLandValueAmount>
	</xsl:template>
	
	<xsl:template match="/VALUATION_RESPONSE/VALUATION_METHODS/COST_ANALYSIS/@_Type">
		<valueApproach>
			<value><xsl:value-of select="."/></value>
			<type>enum</type>
		</valueApproach>
	</xsl:template>
	
	<xsl:template match="VALUATION_METHODS/COST_ANALYSIS[@ValueIndicatedByCostApproachAmount != '']/@ValueIndicatedByCostApproachAmount">
		<valueIndicatedByCostAnalysisApproachAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</valueIndicatedByCostAnalysisApproachAmount>
	</xsl:template>
	
	<xsl:template match="VALUATION_METHODS/INCOME_ANALYSIS[@ValueIndicatedByIncomeApproachAmount != '']/@ValueIndicatedByIncomeApproachAmount">
		<valueIndicatedByIncomeAnalysisApproachAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</valueIndicatedByIncomeAnalysisApproachAmount>
	</xsl:template>
	
	<xsl:template match="VALUATION_METHODS/SALES_COMPARISON[@ValueIndicatedBySalesComparisonApproachAmount != '']/@ValueIndicatedBySalesComparisonApproachAmount">
		<valueIndicatedBySalesComparisonApproachAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</valueIndicatedBySalesComparisonApproachAmount>
	</xsl:template>

	<xsl:template match="VALUATION_METHODS[@_AdditionalDescription != '']/@_AdditionalDescription">
		<additionalDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</additionalDescription>
	</xsl:template>
	
	<xsl:template match="VALUATION/_RECONCILIATION/_CONDITION_OF_APPRAISAL[@_Type != '']">
		<conditionOfAppraisal>
			<type>
				<value><xsl:value-of select="@_Type"/></value>
				<type>enum</type>
			</type>
		</conditionOfAppraisal>
	</xsl:template>
	
	<xsl:template match="VALUATION[@AppraisalEffectiveDate != '']/@AppraisalEffectiveDate">
		<appraisalEffectiveDate>
			<value><xsl:value-of select="."/></value>
			<type>date</type>
		</appraisalEffectiveDate>
	</xsl:template>
	
	<xsl:template match="VALUATION[@PropertyAppraisedValueAmount != '']/@PropertyAppraisedValueAmount">
		<propertyAppraisedValueAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</propertyAppraisedValueAmount>
	</xsl:template>
</xsl:stylesheet>