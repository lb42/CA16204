<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <xsl:message>Starting...</xsl:message>
        <div type="chapter" xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:apply-templates select='//div[@class="mw-parser-output"]'/>  
    </div>
    </xsl:template>
    
    <xsl:template match="div[a[@class='image']]">
        <gap reason="image"/>
    </xsl:template>
    
    <xsl:template match="div[@class='tiInherit']">
        <xsl:comment><xsl:apply-templates/></xsl:comment>
    </xsl:template>
    
    
    <xsl:template match="div[not(@class)]">
            <xsl:message>Something ...</xsl:message>
           <xsl:apply-templates/> 
    </xsl:template>
    
    <xsl:template match="div[@id='headerContainer']"/>

    <xsl:template match="span[@data-page-number]">
        <pb n="{@data-page-number}"/>
    </xsl:template>
    
    <xsl:template match="p[span[@style='font-size: 120%;']]">
        <head><xsl:apply-templates/></head>
    </xsl:template>
    
    <xsl:template match="span[@style='font-variant:small-caps']">
        <label>
            <xsl:apply-templates/>
        </label>
    </xsl:template>
    
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <!--<xsl:template match="p[br]"/>
    -->
    
    <xsl:template match="i">
        <hi><xsl:apply-templates/></hi>
    </xsl:template>
    
    
   <!--  <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
  -->  
</xsl:stylesheet>