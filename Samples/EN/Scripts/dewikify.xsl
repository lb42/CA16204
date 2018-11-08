<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:h="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs h" 
    version="2.0">

  <xsl:output encoding="UTF-8" omit-xml-declaration="yes"  />

<xsl:template match="/">
    <div type="chapter">
    <xsl:apply-templates select="//h:div[@class='prp-pages-output']"/>
    </div>
</xsl:template>

<xsl:template match="h:div[@class='tiInherit']//h:p">
    <head><xsl:apply-templates/></head>
</xsl:template>
    
<xsl:template match="h:p">
    <p><xsl:apply-templates/></p>
</xsl:template>
    
    <xsl:template match="//h:span[@data-page-number]">
        <pb n="{@data-page-number}"/>
    </xsl:template>
    <xsl:template match="h:i">
        <hi><xsl:apply-templates/></hi>
    </xsl:template>
</xsl:stylesheet>
