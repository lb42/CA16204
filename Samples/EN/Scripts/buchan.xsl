<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs h" version="2.0">

    <xsl:output omit-xml-declaration="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:apply-templates select="//h:body"/>
    </xsl:template>
    
<xsl:template match="h:pre|h:p[@class='toc']|h:br|h:a|h:eg|h:table"/>
    
    
    <xsl:template match="h:body">
        <body>
            <xsl:for-each-group select="*" group-starting-with="h:a">
                <div type="chapter">
                    <xsl:for-each select="current-group()">
                   
                        <xsl:apply-templates select="."/>
                      
                </xsl:for-each></div>
            </xsl:for-each-group>
        </body>
    </xsl:template>
    
<xsl:template match="h:h2">
    <head><xsl:apply-templates/></head>
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

    


</xsl:stylesheet>
