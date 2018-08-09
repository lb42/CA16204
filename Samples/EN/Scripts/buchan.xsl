<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs h" version="2.0">

    <xsl:output omit-xml-declaration="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:apply-templates select="//h:body"/>
    </xsl:template>

    <xsl:template match="h:body">
        <body>
            <xsl:for-each-group select="*" group-starting-with="h:a">
                <xsl:for-each select="current-group()">
                    <div type="chapter">
                        <xsl:apply-templates />
                    </div>  
                </xsl:for-each>
            </xsl:for-each-group>
        </body>
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
