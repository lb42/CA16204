<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs h" version="2.0">

    <xsl:output omit-xml-declaration="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:apply-templates select="//h:table[@class = 'c9']/h:tbody"/>
    </xsl:template>

    <xsl:template match="h:table[@class = 'c9']/h:tbody">
        <div type="chapter" xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="h:div[@class = 'c6']">
        <xsl:message>Position is <xsl:value-of select="position()"/></xsl:message>
        <xsl:choose>
            <xsl:when test="position() eq 2">
                <head>
                    <xsl:apply-templates/>
                </head>
            </xsl:when>
            <xsl:when test="h:a"/>
            <xsl:otherwise>
                <milestone unit="structure" rend="stars"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="h:div[@class = 'c4']">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="h:div[@class = 'c7']">
        <gap reason="graphic" n="{//h:img/@src}"/>
    </xsl:template>

    <xsl:template match="h:table[@class = 'c3']/h:tbody/h:tr/h:td">
        <quote>
            <xsl:for-each select="h:i">
                <l>
                    <xsl:apply-templates/>
                </l>
            </xsl:for-each>
        </quote>
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

    <xsl:template match="h:br">
        <lb/>
    </xsl:template>

    <xsl:template match="h:a"/>


</xsl:stylesheet>
