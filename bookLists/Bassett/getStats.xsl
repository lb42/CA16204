<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
     xpath-default-namespace="http://www.tei-c.org/ns/1.0"
     xmlns:t="http://www.tei-c.org/ns/1.0"
     
    version="2.0">
    <xsl:template match="/">
        <xsl:text>All,Male,Female
</xsl:text>
        <xsl:text>All,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl)"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'M')])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'F')])"/>
        <xsl:text>     
</xsl:text>
        <xsl:text>Digitized,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'M')])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'F')])"/>
        <xsl:text>     
</xsl:text>
        <xsl:text>&lt;1845,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[t:d(date) = 1])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'M')][t:d(date) = 1])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'F')][t:d(date) = '1'])"/>
        <xsl:text>     
</xsl:text>
        <xsl:text>Digitized,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][t:d(date) = '1'])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'M')][t:d(date) = '1'])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'F')][t:d(date) = '1'])"/>
        <xsl:text>     
</xsl:text>   
        <xsl:text>1845 - 1855,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[t:d(date) = 2])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'M')][t:d(date) = 2])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'F')][t:d(date) = '2'])"/>
        <xsl:text>     
</xsl:text>
        <xsl:text>Digitized,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][t:d(date) = '2'])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'M')][t:d(date) = '2'])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'F')][t:d(date) = '2'])"/>
        <xsl:text>     
</xsl:text>   
        <xsl:text>1855 - 1865,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[t:d(date) = 3])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'M')][t:d(date) = 3])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'F')][t:d(date) = '3'])"/>
        <xsl:text>     
</xsl:text>
        <xsl:text>Digitized,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][t:d(date) = '3'])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'M')][t:d(date) = '3'])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'F')][t:d(date) = '3'])"/>
        <xsl:text>     
</xsl:text>    
        <xsl:text>1865 - 1875,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[t:d(date) = 4])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'M')][t:d(date) = '4'])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'F')][t:d(date) = '4'])"/>
        <xsl:text>     
</xsl:text>
        <xsl:text>Digitized,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][t:d(date) = '4'])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'M')][t:d(date) = '4'])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'F')][t:d(date) = '4'])"/>
        <xsl:text>     
</xsl:text>  
        <xsl:text>1875 - 1885,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[t:d(date) = 5])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'M')][t:d(date) = '5'])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'F')][t:d(date) = '5'])"/>
        <xsl:text>     
</xsl:text>
        <xsl:text>Digitized,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][t:d(date) = '5'])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'M')][t:d(date) = '5'])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'F')][t:d(date) = '5'])"/>
        <xsl:text>     
</xsl:text>   
        <xsl:text>1885 - 1895,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[t:d(date) = 6])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'M')][t:d(date) = '6'])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[starts-with(author/@ref,'F')][t:d(date) = '6'])"/>
        <xsl:text>     
</xsl:text>
        <xsl:text>Digitized,</xsl:text><xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][t:d(date) = '6'])"/><xsl:text>,</xsl:text>
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'M')][t:d(date) = '6'])"/>
        <xsl:text>,</xsl:text> 
        <xsl:value-of select="count(/TEI/text/body/listBibl/bibl[ref][starts-with(author/@ref,'F')][t:d(date) = '6'])"/>
        <xsl:text>     
</xsl:text>     
    </xsl:template>
    <xsl:function name="t:d">
        <xsl:param name="year"/>
        <xsl:choose>
            <xsl:when test="$year lt '1845'">1</xsl:when>
            <xsl:when test="$year lt '1855'">2</xsl:when>
            <xsl:when test="$year lt '1865'">3</xsl:when> 
            <xsl:when test="$year lt '1875'">4</xsl:when> 
            <xsl:when test="$year lt '1885'">5</xsl:when> 
            <xsl:when test="$year lt '1895'">6</xsl:when>
            <xsl:otherwise>7</xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>