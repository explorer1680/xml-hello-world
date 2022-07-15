<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="COMPARABLE_SALE[@PropertySequenceIdentifier != '0']/ROOM_ADJUSTMENT[@UnitSequenceIdentifier]">
		<rentalUnit>
			<unitSequenceIdentifier>
				<value>
					<xsl:value-of select="@UnitSequenceIdentifier"/>
				</value>
				<type>integer</type>
			</unitSequenceIdentifier>
			
			<!-- totalBathroomCount -->
			<xsl:apply-templates select="@TotalBathroomCount"/>
			<!-- totalBedroomCount -->
			<xsl:apply-templates select="@TotalBedroomCount"/>
			<!-- totalRoomCount -->
			<xsl:apply-templates select="@TotalRoomCount"/>
		</rentalUnit>
	</xsl:template>
	
	<xsl:template match="COMPARABLE_SALE[@PropertySequenceIdentifier = '0']/ROOM_ADJUSTMENT[@UnitSequenceIdentifier]">
		<xsl:variable name="rentalUnitVar">
			<unitSequenceIdentifier>
				<value>
					<xsl:value-of select="@UnitSequenceIdentifier"/>
				</value>
				<type>integer</type>
			</unitSequenceIdentifier>

			<!-- grossLivingAreaSquareFeetCount -->
			<xsl:choose>
				<xsl:when test="@UnitSequenceIdentifier = 1">
					<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/_UNIT_GROUP[@UnitType='UnitOne']/@GrossLivingAreaSquareFeetCount"/>
				</xsl:when>
				<xsl:when test="@UnitSequenceIdentifier = 2">
					<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/_UNIT_GROUP[@UnitType='UnitTwo']/@GrossLivingAreaSquareFeetCount"/>
				</xsl:when>
				<xsl:when test="@UnitSequenceIdentifier = 3">
					<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/_UNIT_GROUP[@UnitType='UnitThree']/@GrossLivingAreaSquareFeetCount"/>
				</xsl:when>
				<xsl:when test="@UnitSequenceIdentifier = 4">
					<xsl:apply-templates select="/VALUATION_RESPONSE/PROPERTY/STRUCTURE/_UNIT_GROUP[@UnitType='UnitFour']/@GrossLivingAreaSquareFeetCount"/>
				</xsl:when>
			</xsl:choose>

			<!-- Note: need to use current() instead of ".".  "." will return all UNIT_RENT_SCHEDULE's! -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/INCOME_ANALYSIS/MULTIFAMILY_RENT_SCHEDULE/UNIT_RENT_SCHEDULE[@UnitSequenceIdentifier = current()/@UnitSequenceIdentifier]"
				mode="leaseDates"/>

			<!-- totalBathroomCount -->
			<xsl:apply-templates select="@TotalBathroomCount"/>
			<!-- totalBedroomCount -->
			<xsl:apply-templates select="@TotalBedroomCount"/>
			<!-- totalRoomCount -->
			<xsl:apply-templates select="@TotalRoomCount"/>

			<!-- Note: need to use current() instead of ".".  "." will return all UNIT_RENT_SCHEDULE's! -->
			<xsl:apply-templates select="/VALUATION_RESPONSE/VALUATION_METHODS/INCOME_ANALYSIS/MULTIFAMILY_RENT_SCHEDULE/UNIT_RENT_SCHEDULE[@UnitSequenceIdentifier = current()/@UnitSequenceIdentifier]"
				mode="rentAmounts"/>
		</xsl:variable>
		<xsl:if test="count($rentalUnitVar/*) > 1">
			<rentalUnit>
				<xsl:copy-of select="$rentalUnitVar"/>
			</rentalUnit>
		</xsl:if>
	</xsl:template>

	<xsl:template match="PROPERTY/STRUCTURE/_UNIT_GROUP/@GrossLivingAreaSquareFeetCount">
		<xsl:if test=". != ''">
			<grossLivingAreaSquareFeetCount>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</grossLivingAreaSquareFeetCount>
		</xsl:if>
	</xsl:template>

	<!-- these rentalUnit templates apply to subject AND comps! -->
	<xsl:template match="ROOM_ADJUSTMENT[@UnitSequenceIdentifier and @TotalBathroomCount != '']/@TotalBathroomCount">
		<totalBathroomCount>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</totalBathroomCount>
	</xsl:template>
	
	<xsl:template match="ROOM_ADJUSTMENT[@UnitSequenceIdentifier and @TotalBedroomCount != '']/@TotalBedroomCount">
		<totalBedroomCount>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</totalBedroomCount>
	</xsl:template>
	
	<xsl:template match="ROOM_ADJUSTMENT[@UnitSequenceIdentifier and @TotalRoomCount != '']/@TotalRoomCount">
		<totalRoomCount>
			<value><xsl:value-of select="."/></value>
			<type>decimal</type>
		</totalRoomCount>
	</xsl:template>

	<xsl:template match="STRUCTURE/@LivingUnitCount" mode="rentalUnitTotalCount">
		<xsl:if test=". != '1'">
			<rentalUnitTotalCount>
				<value><xsl:value-of select="."/></value>
				<type>integer</type>
			</rentalUnitTotalCount>
			</xsl:if>
	</xsl:template>
	
	<xsl:template match="UNIT_RENT_SCHEDULE[@LeaseExpirationDate != '']/@LeaseExpirationDate">
		<leaseExpirationDate>
			<value><xsl:value-of select="."/></value>
			<type>date</type>
		</leaseExpirationDate>
	</xsl:template>
	
	<xsl:template match="UNIT_RENT_SCHEDULE[@LeaseStartDate != '']/@LeaseStartDate">
		<leaseStartDate>
			<value><xsl:value-of select="."/></value>
			<type>date</type>
		</leaseStartDate>
	</xsl:template>
	
	<xsl:template match="UNIT_RENT_SCHEDULE[@UnitActualRentAmount != '']/@UnitActualRentAmount">
		<unitActualRentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</unitActualRentAmount>
	</xsl:template>

	<xsl:template match="UNIT_RENT_SCHEDULE[@UnitFurnishedActualRentAmount != '']/@UnitFurnishedActualRentAmount">
		<unitFurnishedActualRentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</unitFurnishedActualRentAmount>
	</xsl:template>

	<xsl:template match="UNIT_RENT_SCHEDULE[@UnitFurnishedMarketRentAmount != '']/@UnitFurnishedMarketRentAmount">
		<unitFurnishedMarketRentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</unitFurnishedMarketRentAmount>
	</xsl:template>

	<xsl:template match="UNIT_RENT_SCHEDULE[@UnitMarketRentAmount != '']/@UnitMarketRentAmount">
		<unitMarketRentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</unitMarketRentAmount>
	</xsl:template>

	<xsl:template match="UNIT_RENT_SCHEDULE[@UnitUnfurnishedActualRentAmount != '']/@UnitUnfurnishedActualRentAmount">
		<unitUnfurnishedActualRentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</unitUnfurnishedActualRentAmount>
	</xsl:template>

	<xsl:template match="UNIT_RENT_SCHEDULE[@UnitUnfurnishedMarketRentAmount != '']/@UnitUnfurnishedMarketRentAmount">
		<unitUnfurnishedMarketRentAmount>
			<value><xsl:value-of select="."/></value>
			<type>currency</type>
		</unitUnfurnishedMarketRentAmount>
	</xsl:template>

	<xsl:template match="VALUATION_METHODS/INCOME_ANALYSIS/MULTIFAMILY_RENT_SCHEDULE/UNIT_RENT_SCHEDULE" mode="leaseDates">
		<!-- leaseStartDate -->
		<xsl:apply-templates select="@LeaseStartDate"/>
		<!-- leaseExpirationDate -->
		<xsl:apply-templates select="@LeaseExpirationDate"/>
	</xsl:template>

	<xsl:template match="VALUATION_METHODS/INCOME_ANALYSIS/MULTIFAMILY_RENT_SCHEDULE/UNIT_RENT_SCHEDULE" mode="rentAmounts">
		<!-- unitActualRentAmount -->
		<xsl:apply-templates select="@UnitActualRentAmount"/>
		<!-- unitFurnishedActualRentAmount -->
		<xsl:apply-templates select="@UnitFurnishedActualRentAmount"/>
		<!-- unitFurnishedMarketRentAmount -->
		<xsl:apply-templates select="@UnitFurnishedMarketRentAmount"/>
		<!-- unitMarketRentAmount -->
		<xsl:apply-templates select="@UnitMarketRentAmount"/>
		<!-- unitUnfurnishedActualRentAmount -->
		<xsl:apply-templates select="@UnitUnfurnishedActualRentAmount"/>
		<!-- unitUnfurnishedMarketRentAmount -->
		<xsl:apply-templates select="@UnitUnfurnishedMarketRentAmount"/>
	</xsl:template>
	
</xsl:stylesheet>