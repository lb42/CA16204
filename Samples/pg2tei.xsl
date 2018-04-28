<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs h" 
    version="2.0">
    
    <xsl:param name="novelId">XXXXXX</xsl:param>
 
  <xsl:output encoding="UTF-8" omit-xml-declaration="yes" method="xml" />
  
    <xsl:template match="/">
        <text xml:id="{concat('C',$novelId)}"  xmlns="http://www.tei-c.org/ns/1.0">
        <xsl:apply-templates/>
        </text>
    </xsl:template>
   
   <xsl:template match="h:pre"/>
    
    
    <xsl:template match="h:h3[@align='center']">
      <head>
          <xsl:apply-templates/>
      </head>
    </xsl:template>
    
    <xsl:template match="h:em">
   <hi><xsl:apply-templates/></hi>
    </xsl:template>
   
  <xsl:template match="h:p">
      <p><xsl:apply-templates></xsl:apply-templates></p>
  </xsl:template>  
  
</xsl:stylesheet>