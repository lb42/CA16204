<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
    
    <xsl:variable name="sex">
        <xsl:value-of select="substring(bibl/author/@ref,1,1)"/>
    </xsl:variable>
    <xsl:variable name="title">
        <xsl:value-of select="/bibl/title"/>
    </xsl:variable>
    <xsl:variable name="date">
        <xsl:value-of select="/bibl/date"/>
    </xsl:variable>
  
    <xsl:variable name="timeSlot">
        <xsl:choose>
            <xsl:when test="$date le '1859'">T1</xsl:when>
            <xsl:when test="$date le '1879'">T2</xsl:when>
            <xsl:when test="$date le '1899'">T3</xsl:when>
            <xsl:when test="$date le '1920'">T4</xsl:when>            
        </xsl:choose></xsl:variable>
    
    <xsl:variable name="wordCount" as="xs:int">
        <xsl:value-of select="bibl/@wc"/>
    </xsl:variable>
    <xsl:variable name="size">
        <xsl:choose>
            <xsl:when test="$wordCount le 50000">short</xsl:when>
            <xsl:when test="$wordCount le 150000">medium</xsl:when>
            <xsl:when test="$wordCount gt 150000">long</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="pageCount">
        <xsl:value-of select="/bibl/@pc"/>
    </xsl:variable>
        <teiHeader xmlns="http://www.tei-c.org/ns/1.0">
            <fileDesc>
                <titleStmt>
                    <title><xsl:value-of select="concat(bibl/title,' : ELTec edition')"/></title>
                    <author><xsl:value-of select="bibl/author"/></author>
                    <respStmt><resp>ELTeC conversion</resp>
                    <name>Lou Burnard</name></respStmt>
                </titleStmt>               
            <extent>    
                <measure unit="words"><xsl:value-of select="bibl/@wc"/>
                </measure>
                <measure unit="pages"><xsl:value-of select="bibl/@pc"/>
                </measure>
            </extent>
            <publicationStmt>  <p>Published as part of ELTeC</p></publicationStmt>
            <sourceDesc> <bibl>
                <title><xsl:value-of select="bibl/title"/></title>
                <author><xsl:value-of select="bibl/author"/></author>
                                
                <idno><xsl:value-of select="bibl/idno"/></idno>
                <relatedItem>
                    <bibl>
                        <title><xsl:value-of select="bibl/title"/></title>
                        <author><xsl:value-of select="bibl/author"/></author>
                        <publisher><xsl:value-of select="bibl/publisher"/></publisher>
                        <date><xsl:value-of select="bibl/date"/></date>
                    </bibl>
                </relatedItem></bibl></sourceDesc></fileDesc>
            <encodingDesc>  
                <xsl:attribute name="n">eltec-1</xsl:attribute>
                <p/></encodingDesc>
            <profileDesc>
                <langUsage><language ident="eng">English</language>
                </langUsage>
                <textDesc>
                    <authorGender xmlns="http://distantreading.net/eltec/ns" key="{$sex}"></authorGender>
                    <size xmlns="http://distantreading.net/eltec/ns" key="{$size}"></size>
                    <canonicity xmlns="http://distantreading.net/eltec/ns" key="medium"></canonicity>
                    <timeSlot xmlns="http://distantreading.net/eltec/ns" key="{$timeSlot}"></timeSlot>
                </textDesc>
            </profileDesc>
            <revisionDesc>
                <change when="2018-07-23">LB convert to ELTeC-1</change>
            </revisionDesc>
            
        </teiHeader>
    </xsl:template> 
    
</xsl:stylesheet>