<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
version="2.0">

<xsl:output method="text"/>
    
    <xsl:template match="/">
<xsl:text>
bassetId|title|where|onlineID
</xsl:text>
        <xsl:apply-templates select="//bibl[ref]"/>
    </xsl:template>
    <xsl:template match="bibl[ref]">
        <xsl:variable name="me">
        <xsl:value-of select="substring-after(@xml:id,'B')"/>
<xsl:text>|</xsl:text> <xsl:value-of select="title"/>
        </xsl:variable>
        <xsl:for-each select="ref">
            <xsl:value-of select="$me"/>
            <xsl:text>|</xsl:text>
            <xsl:value-of select="substring-before(@target,':')"/>
            <xsl:text>|</xsl:text>
            <xsl:value-of select="substring-after(@target,':')"/>   
            <xsl:text>
</xsl:text>  
        </xsl:for-each>
       
  
    </xsl:template>
</xsl:stylesheet>