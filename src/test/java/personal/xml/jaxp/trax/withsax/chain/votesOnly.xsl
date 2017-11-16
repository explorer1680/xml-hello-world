<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="finalVote/vote">
        <xsl:value-of select="candidate"/><xsl:text>
  </xsl:text>
    </xsl:template>

    <xsl:template match="person">
    </xsl:template>

</xsl:stylesheet>