<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs t h"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
   
  
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">
  
  
    
    <xsl:variable name="textId">
        <xsl:value-of select="/t:TEI/@xml:id"/>
    </xsl:variable>
    
    <xsl:template match="t:div[@type='chapter']">
        <xsl:variable name="chapNum"><xsl:value-of select="format-number(count(preceding::t:div[@type='chapter'])+1,'000')"/>
        </xsl:variable>
        <xsl:variable name="pbNum">
            <xsl:value-of select="doc('listChaps.xml')/listChap/chap[@n=$chapNum]/@pb"/> 
        </xsl:variable>
    <pb n="{$pbNum}"/>
    <div type='chapter' xml:id="{concat($textId,$chapNum)}">
        <head><xsl:value-of select="doc('listChaps.xml')/listChap/chap[@n=$chapNum]"/></head>
        <xsl:apply-templates/>
    </div>
    </xsl:template>
    
  <xsl:template match="t:div[@type='chapter']/t:head"/>
    
    <xsl:template match="* | @* | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
        <!-- could normalize() here -->
    </xsl:template>
</xsl:stylesheet>