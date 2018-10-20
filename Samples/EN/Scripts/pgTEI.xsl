<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h t"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0"    

    version="2.0">
   <!-- by default this stylesheet copies all existing tagging unchanged--> 
    
   <!-- add templates for elements you want to change here -->
    
    <xsl:template match="TEI.2">
        <TEI >
            <teiHeader>
                <xsl:copy-of select="//fileDesc"/>
                <xsl:copy-of select="//revisionDesc"/>
            </teiHeader>
            <xsl:apply-templates select="text"/> 
        </TEI>
    </xsl:template>
    
    <xsl:template match="pgExtensions"/>
    <xsl:template match="@TEIform"/>
    <xsl:template match="div[divGen]" />
    <xsl:template match="lb|index|anchor|table"/>
    <xsl:template match="back"/>
    <xsl:template match="@rend"/>
    <xsl:template match="@lang"/>
    <xsl:template match="@sic"/>
    
    <xsl:template match="titlePage">
        <div type="titlepage">
            <xsl:for-each select="*">
                <p><xsl:value-of select="."/></p>               
            </xsl:for-each>
        </div>
    </xsl:template>
    
    <xsl:template match="div[@rend]" >
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="signed|dateline">
        <trailer><xsl:apply-templates/></trailer>
    </xsl:template>
    
    <xsl:template match="q">
        <xsl:text>"</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>"</xsl:text>
    </xsl:template>
    
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