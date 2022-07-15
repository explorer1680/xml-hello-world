<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:template match="SALES_COMPARISON/RESEARCH/SUBJECT[@_HasPriorSalesIndicator != '']/@_HasPriorSalesIndicator">
		<hasPriorSalesIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</hasPriorSalesIndicator>
	</xsl:template>
	
	<xsl:template match="SALES_COMPARISON/RESEARCH[@SalesHistoryResearchedIndicator != '']/@SalesHistoryResearchedIndicator">
		<salesHistoryResearchedIndicator>
			<value><xsl:value-of select="."/></value>
			<type>boolean</type>
		</salesHistoryResearchedIndicator>
	</xsl:template>
</xsl:stylesheet>