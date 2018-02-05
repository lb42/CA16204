<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs t" version="2.0">
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//t:author">
        <author>
            <persName>
                <xsl:value-of select="//t:hi[@itemprop = 'author']/t:ref/t:hi"/>
            </persName>
            <idno type="wikidata">
                <xsl:value-of select="//t:hi[@itemprop = 'author']/@itemid"/>
            </idno>
        </author>
    </xsl:template>
    <xsl:template match="t:table[@rend = 'pr_quality']"/>
    <xsl:template match="t:cell/@valign"/>
    
    <xsl:template match="t:hi[@itemprop]"/>
    <xsl:template match="t:hi[@rend='sup']">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:hi[@rend='lang-la']">
        <foreign xml:lang="la">
            <xsl:apply-templates/>
        </foreign>
    </xsl:template>
    <xsl:template match="t:ref[t:graphic]">
        <figure>
            <xsl:apply-templates/>
        </figure>
    </xsl:template>
    <xsl:template match="t:hi[t:hi[@rend = 'pagenum ws-pagenum']]">
        <pb n="{t:hi/@xml:id}"/>
    </xsl:template>
    <!-- <xsl:template match="t:hi[@style='letter-spacing:0.3em;']">
        <sp><speaker><xsl:value-of select="t:hi"/></speaker>
     <xsl:apply-templates  select="following-sibling::t:p[1]"/></sp>
    </xsl:template> -->
    <!-- needs tweaking to suppress second appearance of following p -->
    <xsl:template match="t:hi[@style = 'letter-spacing:0.3em;']">
        <p>
            <label>
                <xsl:value-of select="t:hi"/>
            </label>
        </p>
    </xsl:template>
    <xsl:template match="t:hi[@style = 'font-variant:small-caps;']">
        <name>
            <xsl:apply-templates/>
        </name>
    </xsl:template>
    
    <xsl:template match="t:div[t:head[starts-with(.,'Menu de navigation')]]"/>
        
        
        <xsl:template match="t:div/t:hi"/>
    
    
    <!--<xsl:template match="t:hi[not(t:hi)]">       
                   <hi> <xsl:apply-templates/></hi>
    </xsl:template>-->
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
