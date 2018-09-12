<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
   <xsl:template match="/"> 
       <xsl:apply-templates select="//t:text"/>
</xsl:template>

<xsl:template match="t:text">
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="t:div[t:head]">
    <xsl:if test="t:p">
    <div type="chapter">    <head>
        <xsl:value-of select="preceding-sibling::t:div[1]/t:head[1]"/>
        </head>
        <xsl:apply-templates/>
    </div>
    </xsl:if>
</xsl:template>

<xsl:template match="t:eg"/>
    <xsl:template match="t:table[@summary]"/>
    <xsl:template match="t:p[t:lb]"/>
    <xsl:template match="t:p[t:anchor]"/>
    
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