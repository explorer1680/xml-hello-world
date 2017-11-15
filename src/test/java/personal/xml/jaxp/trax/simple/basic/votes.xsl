<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <finalVotes>
            <xsl:apply-templates/>
        </finalVotes>
    </xsl:template>

    <xsl:template match="votes/voter">
        <vote>
            <person>
                <xsl:value-of select="@personid"/>
            </person>
            <candidate>
                <xsl:value-of select="vote"/>
            </candidate>
        </vote>
    </xsl:template>

</xsl:stylesheet>