<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="h t" 
     version="2.0">
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:for-each select="//bibl">
            <xsl:sort select="title"/>
            <xsl:value-of select="@n"/>
            <xsl:text>
</xsl:text>
        </xsl:for-each>
    </xsl:template>
  
</xsl:stylesheet>
