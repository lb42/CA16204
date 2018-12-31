<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
version="2.0">

<xsl:output method="text"/>
    
    <xsl:template match="/">
<xsl:text>
bassetId|title|where|onlineID
</xsl:text>
        <xsl:apply-templates select="//t:bibl[t:ref]"/>
    </xsl:template>
    <xsl:template match="t:bibl">
        <xsl:variable name="me">
        <xsl:value-of select="substring-after(@xml:id,'B')"/>
<xsl:text>|</xsl:text> <xsl:value-of select="t:title"/>
        </xsl:variable>
        <xsl:for-each select="t:ref">
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
