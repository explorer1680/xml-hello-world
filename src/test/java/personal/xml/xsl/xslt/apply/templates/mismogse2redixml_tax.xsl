<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns="http://appraisalxchange.redihive.com/schema/Property" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <xsl:template match="_TAX[@_TotalSpecialTaxAmount != '']/@_TotalSpecialTaxAmount">
    <totalSpecialTaxAmount>
      <value><xsl:value-of select="."/></value>
      <type>currency</type>
    </totalSpecialTaxAmount>
  </xsl:template>


  <xsl:template match="_TAX[@_TotalTaxAmount != '']/@_TotalTaxAmount">
    <totalTaxAmount>
      <value><xsl:value-of select="."/></value>
      <type>currency</type>
    </totalTaxAmount>
  </xsl:template>


  <xsl:template match="_TAX[@_YearIdentifier != '']/@_YearIdentifier">
    <taxYearIdentifier>
      <value><xsl:value-of select="."/></value>
      <type>integer</type>
    </taxYearIdentifier>
  </xsl:template>


  <xsl:template match="_TAX/PROPERTY_TAX_EXTENSION">

    <xsl:if test="PROPERTY_TAX_EXTENSION_SECTION/@ExtensionSectionOrganizationName != '' or PROPERTY_TAX_EXTENSION_SECTION/PROPERTY_TAX_EXTENSION_SECTION_DATA/PROPERTY_TAX_AMOUNT/@GSEPropertyTaxTotalTaxAmount != ''">
      <propertyTaxExtension>
        <!-- propertyTaxExtensionSection -->
        <xsl:apply-templates select="PROPERTY_TAX_EXTENSION_SECTION"/>
      </propertyTaxExtension>
    </xsl:if>
  </xsl:template>


  <xsl:template match="_TAX/PROPERTY_TAX_EXTENSION/PROPERTY_TAX_EXTENSION_SECTION">
    <propertyTaxExtensionSection>
      <!-- taxExtensionSectionOrganizationName -->
      <xsl:apply-templates select="@ExtensionSectionOrganizationName"/>
      <!-- propertyTaxExtensionSectionData -->
      <xsl:apply-templates select="PROPERTY_TAX_EXTENSION_SECTION_DATA"/>
    </propertyTaxExtensionSection>
  </xsl:template>


  <xsl:template match="_TAX/PROPERTY_TAX_EXTENSION/PROPERTY_TAX_EXTENSION_SECTION[@ExtensionSectionOrganizationName != '']/@ExtensionSectionOrganizationName">
    <taxExtensionSectionOrganizationName>
      <value><xsl:value-of select="."/></value>
      <type>string</type>
    </taxExtensionSectionOrganizationName>
  </xsl:template>


  <xsl:template match="_TAX/PROPERTY_TAX_EXTENSION/PROPERTY_TAX_EXTENSION_SECTION/PROPERTY_TAX_EXTENSION_SECTION_DATA">
    <xsl:if test="PROPERTY_TAX_AMOUNT/@GSEPropertyTaxTotalTaxAmount != ''">
      <propertyTaxExtensionSectionData>
        <!-- propertyTaxAmount -->
        <xsl:apply-templates select="PROPERTY_TAX_AMOUNT"/>
      </propertyTaxExtensionSectionData>
    </xsl:if>
  </xsl:template>


  <xsl:template match="_TAX/PROPERTY_TAX_EXTENSION/PROPERTY_TAX_EXTENSION_SECTION/PROPERTY_TAX_EXTENSION_SECTION_DATA/PROPERTY_TAX_AMOUNT">
    <propertyTaxAmount>
      <!-- GSEPropertyTaxTotalTaxAmount -->
      <xsl:apply-templates select="@GSEPropertyTaxTotalTaxAmount"/>
    </propertyTaxAmount>
  </xsl:template>


  <xsl:template match="_TAX/PROPERTY_TAX_EXTENSION/PROPERTY_TAX_EXTENSION_SECTION/PROPERTY_TAX_EXTENSION_SECTION_DATA/PROPERTY_TAX_AMOUNT[@GSEPropertyTaxTotalTaxAmount != '']/@GSEPropertyTaxTotalTaxAmount">
    <GSEPropertyTaxTotalTaxAmount>
      <value><xsl:value-of select="."/></value>
      <type>currency</type>
    </GSEPropertyTaxTotalTaxAmount>
  </xsl:template>
</xsl:stylesheet>