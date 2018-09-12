<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:e="http://distantreading.net/eltec/ns"
    version="2.0">
    
    <xsl:output method="text" omit-xml-declaration="yes"/>
    
   <xsl:template match="/"> 
       <xsl:message><xsl:value-of select="t:TEI/@xml:id"/>
           <xsl:text> claimed wordcount: </xsl:text>
<xsl:value-of select="//t:extent/t:measure[@unit='words']"/>
       <xsl:text> (</xsl:text>
           <xsl:value-of select="//e:size/@key"/>
           <xsl:text>) </xsl:text>           
       </xsl:message>
       <xsl:apply-templates select="//t:text"/>
       
</xsl:template>

<xsl:template match="t:text">
    <xsl:apply-templates/>
</xsl:template>


</xsl:stylesheet>