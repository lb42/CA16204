<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:gcse="http://www.googlebollox"
    xmlns:g="http://www.googlebollox"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs h g gcse" version="2.0">

    <xsl:output omit-xml-declaration="yes" encoding="UTF-8"/>
<xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:apply-templates select="//h:table[@class='c9']"/>
    </xsl:template>

<xsl:template match="h:form"/>

    <xsl:template match="h:table">
<xsl:choose>
    <xsl:when test="position() = 3">
        <div type="chapter" xmlns="http://www.tei-c.org/ns/1.0">
         <head>   <xsl:value-of select="//h:td/h:span[@class='c11']"/>
        </head>    <xsl:apply-templates/>
        </div></xsl:when>
    <xsl:when test="parent::h:td and @cellspacing='1'">
        <quote>
            <xsl:apply-templates/>
        </quote>
    </xsl:when>
    <xsl:otherwise>
        <xsl:apply-templates select="descendant::h:td"></xsl:apply-templates>
    </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="h:table[h:tr/h:td/h:span/h:a[@href]]"/>
        
    <xsl:template match="h:td">
        <xsl:if test="text()">
         <p>
            <xsl:apply-templates/>
         </p>   
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="h:td[h:a]"/>
        
<xsl:template match="h:i">
    <hi><xsl:apply-templates/></hi>
</xsl:template>
</xsl:stylesheet>
