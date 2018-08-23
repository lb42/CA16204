<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"     
    exclude-result-prefixes="xs t"
    version="2.0">
        <xsl:output method="text" omit-xml-declaration="yes"/>
        <xsl:template match="t:text">
            <xsl:variable name="wc">
            <xsl:value-of select="string-length(normalize-space(.)) -
                string-length(translate(normalize-space(.),' ,.:',''))"
                />
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$wc  &lt; 10000">size-0</xsl:when>
                <xsl:when test="$wc  &lt; 20000">size-1</xsl:when>
                <xsl:when test="$wc  &gt; 20000">size-2</xsl:when>
            </xsl:choose>
            <xsl:value-of select="concat(concat(' (',$wc),')')"/>
        </xsl:template>
    
    <xsl:template match="t:teiHeader"/>
        
</xsl:stylesheet>