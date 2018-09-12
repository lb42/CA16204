<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:e="http://distantreading.net/ns"
    exclude-result-prefixes="xs"
    version="2.0">
 <xsl:param name="punx">
     <xsl:text>" ',.;:!?“”‘’—- _  
</xsl:text>
 </xsl:param>
 
 <xsl:template match="/">    
     <xsl:apply-templates select="//t:p"/>
 </xsl:template>
    
    <xsl:template match="t:head">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:p">
  <!--      <xsl:value-of select="normalize-space(.)"/><xsl:text>
        <xsl:value-of select="translate(normalize-space(translate(.,$punx,'')),' ', '')"/><xsl:text>
  -->     <xsl:value-of select="translate(.,$punx,'')"/><xsl:text>
      </xsl:text>
    </xsl:template>



</xsl:stylesheet>
