<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:t="http://www.tei-c.org/ns/1.0" version="2.0">

   <!-- <xsl:output method="text" omit-xml-declaration="yes"/>
   -->
    <xsl:template match="/">
 <!--       <xsl:apply-templates select="//p[preceding-sibling::*[1][self::small]]"/>
 --> 
        <listChap><xsl:apply-templates select="//h4[contains(center,'CHAPTER')]"/>
</listChap>    </xsl:template>

    
    <xsl:template match="small">
      <xsl:variable name="pageNum">
            <xsl:value-of select="translate(substring-before(substring-after(font,'[Page'),']'),
                ' &#xA;&#x9;','')"/>
      </xsl:variable> 
    <xsl:variable name="string">
        <xsl:value-of select="translate(substring(following-sibling::text()[1],1,40),
            '&#xA;&#x9;','')"/>       
    </xsl:variable>
 <xsl:choose>
    <xsl:when test="string-length($string) gt 10">
        <xsl:text>s|</xsl:text>
        <xsl:value-of select="$string"/> 
        <xsl:text>|&lt;pb n="</xsl:text>
        <xsl:value-of select="$pageNum"/>
        <xsl:text>"/></xsl:text>
        <xsl:value-of select="$string"/> 
        <xsl:text>|;
</xsl:text>        
    </xsl:when>
   
</xsl:choose>
 </xsl:template>
 
<xsl:template match="p">
    <xsl:variable name="pageNum">
        <xsl:value-of
            select="
            translate(substring-before(substring-after(preceding-sibling::small[1]/font, '[Page'), ']'),
            ' &#xA;&#x9;', '')"
        />
    </xsl:variable>
        <xsl:variable name="string">
            <xsl:text>&lt;p></xsl:text>
            <xsl:value-of select="translate(substring(.,1,40),
                '&#xA;&#x9;','')"/>       
        </xsl:variable>
        <xsl:text>$s=~s|</xsl:text>
        <xsl:value-of select="$string"/> 
        <xsl:text>|&lt;pb n="</xsl:text>
        <xsl:value-of select="$pageNum"/>
        <xsl:text>"/></xsl:text>
       
        <xsl:value-of select="$string"/> 
        <xsl:text>|; 
</xsl:text></xsl:template>

    <xsl:template match="h4">
        <xsl:variable name="pageNum">
            <xsl:value-of
                select="
                    translate(substring-before(substring-after(preceding-sibling::small[1]/font, '[Page'), ']'),
                    ' &#xA;&#x9;', '')"
            />
        </xsl:variable>
        <xsl:variable name="chapNum">
            <xsl:value-of select="format-number(count(preceding::h4[contains(center,'CHAPTER')])+1,'000')"/>            
        </xsl:variable>
        <xsl:variable name="string">
            <xsl:value-of
                select="
                    translate(center,
                    '&#xA;&#x9;', '')"
            />
        </xsl:variable>
        <chap n="{$chapNum}" pb="{$pageNum}">
            <xsl:value-of select="$string"/>
        </chap>
    </xsl:template>

</xsl:stylesheet>
