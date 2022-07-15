<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="PROPERTY/PROJECT/PROJECT_ANALYSIS/UNIT_CHARGE[@_PeriodType='Annually' and @_Amount != '']/@_Amount">
		<rentalUnitChargePerYearAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</rentalUnitChargePerYearAmount>
	</xsl:template>

	<xsl:template match="PROPERTY/PROJECT/PROJECT_ANALYSIS/UNIT_CHARGE[@_PeriodType='Monthly' and @_Amount != '']/@_Amount">
		<rentalUnitChargePerMonthAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</rentalUnitChargePerMonthAmount>
	</xsl:template>

	<xsl:template match="VALUATION_METHODS/INCOME_ANALYSIS/MULTIFAMILY_RENT_SCHEDULE[@RentalActualGrossMonthlyRentAmount != '']/@RentalActualGrossMonthlyRentAmount">
		<rentalActualGrossMonthlyRentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</rentalActualGrossMonthlyRentAmount>
	</xsl:template>

	<xsl:template match="VALUATION_METHODS/INCOME_ANALYSIS/MULTIFAMILY_RENT_SCHEDULE[@RentalEstimatedGrossMonthlyRentAmount != '']/@RentalEstimatedGrossMonthlyRentAmount">
		<rentalEstimatedGrossMonthlyRentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</rentalEstimatedGrossMonthlyRentAmount>
	</xsl:template>
	
	<xsl:template match="VALUATION_METHODS/INCOME_ANALYSIS[@EstimatedMarketMonthlyRentAmount != '']/@EstimatedMarketMonthlyRentAmount">
		<estimatedMarketRentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</estimatedMarketRentAmount>
	</xsl:template>
	
</xsl:stylesheet>