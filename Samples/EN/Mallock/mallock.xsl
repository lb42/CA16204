<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <xsl:apply-templates select="//h:div[@class='chapter']"/>
    </xsl:template>
    
    <xsl:template match="h:div[@class='chapter']">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="h:h2|h:h3">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    
    <xsl:template match="h:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="h:i">
        <hi>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    
    <xsl:template match="h:a[@href]">
        <xsl:variable name="target">
            <xsl:value-of select="substring-after(@href,'#')"/></xsl:variable>
        <note>
            <xsl:attribute name="n"><xsl:value-of select="normalize-space(.)"/></xsl:attribute>
            <xsl:apply-templates select="//h:div[@class='footnotes']/h:p[h:a[@name=$target]]"/>
        </note>
    </xsl:template>
    
    <xsl:template match="h:a[@name]"/>
    
    <xsl:template match="h:blockquote"><quote><xsl:apply-templates/></quote></xsl:template>
    <xsl:template match="h:br"><lb/></xsl:template>
    
</xsl:stylesheet>