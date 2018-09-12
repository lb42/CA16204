<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
version="2.0">

<xsl:output method="text"/>
    
    <xsl:template match="/">
<xsl:text>
bassetId|title|date|authSex|onlineID
</xsl:text>
        <xsl:apply-templates select="//t:bibl[t:ref[starts-with(@target,'pg')]]"/>
    </xsl:template>
    <xsl:template match="t:bibl">
      
      <!-- --> 
        <xsl:value-of select="t:date"/>
        <xsl:text>|</xsl:text>
        <xsl:value-of select="t:author"/>
        <xsl:text>|</xsl:text> <xsl:value-of select="t:title"/>
            <xsl:text>|</xsl:text>
         <!--        <xsl:value-of select="substring-before(@target,':')"/>
   -->         <xsl:text>|</xsl:text>
        <xsl:value-of select="substring-before(t:author/@ref,':')"/>
            <xsl:text>|</xsl:text>
        <xsl:value-of select="substring-after(t:ref[starts-with(@target,'pg')][1]/@target,':')"/>   
            <xsl:text>
</xsl:text>  
       
  
    </xsl:template>
</xsl:stylesheet>
