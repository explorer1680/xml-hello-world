<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="SALES_COMPARISON[@_Comment != '']/@_Comment">
		<comparableSummarySaleConclusionsDescription>
			<value><xsl:value-of select="."/></value>
			<type>string</type>
		</comparableSummarySaleConclusionsDescription>
	</xsl:template>
	
	<xsl:template match="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/RESEARCH[@ComparableListingsPriceRangeHighAmount != '']/@ComparableListingsPriceRangeHighAmount">
		<comparableListingsPriceRangeHighAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</comparableListingsPriceRangeHighAmount>
	</xsl:template>

	<xsl:template match="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/RESEARCH[@ComparableListingsPriceRangeLowAmount != '']/@ComparableListingsPriceRangeLowAmount">
		<comparableListingsPriceRangeLowAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</comparableListingsPriceRangeLowAmount>
	</xsl:template>

	<xsl:template match="/VALUATION_RESPONSE/VALUATION_METHODS/SALES_COMPARISON/RESEARCH[@ComparableListingsResearchedCount != '']/@ComparableListingsResearchedCount">
		<comparableListingsResearchedCount>
			<value><xsl:value-of select="."/></value>
			<type>integer</type>
		</comparableListingsResearchedCount>
	</xsl:template>
</xsl:stylesheet>