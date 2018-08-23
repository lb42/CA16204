<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="h t"
    version="2.0">
    
    <xsl:template match="/">
       <listBibl>
       <xsl:for-each select="//dl">
           <xsl:variable name="title">
               <xsl:value-of select="dd/h3/a"/>
           </xsl:variable>
           <xsl:variable name="VABno">
               <xsl:value-of select="substring-before(substring-after(dd/h3/a/@href,'='),'.xml')"/>
           </xsl:variable>
           <xsl:variable name="titleKey">             
               <xsl:choose>
                   <xsl:when test="contains($title, ':')">
                       <xsl:value-of select="t:sanitize(substring-before($title, ':'))"/>
                   </xsl:when>
                   <xsl:when test="contains($title, ',')">
                       <xsl:value-of select="t:sanitize(substring-before($title, ','))"/>
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:value-of select="t:sanitize($title)"/>
                   </xsl:otherwise>
               </xsl:choose>
               <xsl:value-of select="concat('|',substring-before(dd[3],','))"/>
           </xsl:variable>
           <bibl xml:id="{$VABno}" n="{$titleKey}">
               <title><xsl:value-of select="$title"/></title>
               <author><xsl:value-of select="dd[3]"/></author>
               <publisher><xsl:value-of select="dd[5]"/></publisher>
           </bibl>
       </xsl:for-each>
       </listBibl>
    </xsl:template>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>pare back a string to contain only alphanumerics and some punctuation</desc>
    </doc>
    <xsl:function name="t:sanitize" as="xs:string">
        <xsl:param name="text"/>
        <xsl:variable name="alltext">
            <xsl:value-of select="($text)" separator=""/>
        </xsl:variable>
        <xsl:variable name="result"
            select="lower-case(replace(normalize-space($alltext),
            '[^\w\[\]\\(\)_]+',''))"/>
        <xsl:value-of select="if (string-length($result)&gt;127) then
            concat(substring($result,1,127),'...') else $result"/>
    </xsl:function>
    
</xsl:stylesheet>