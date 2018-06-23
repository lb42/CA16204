<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:t="http://www.tei-c.org/ns/1.0"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
       exclude-result-prefixes="#all"
     version="2.0">
    
    <xsl:template match="/">
       <listBibl xmlns="http://www.tei-c.org/ns/1.0">
       <xsl:for-each select="//bibl[date[. gt '1830']]">
           <xsl:variable name="title">
               <xsl:value-of select="title"/>
           </xsl:variable>
           <xsl:variable name="author">
               <xsl:value-of select="author"/>
           </xsl:variable>
           
           <xsl:variable name="theKey">             
               <xsl:choose>
                   <xsl:when test="contains($title, ':')">
                       <xsl:value-of select="t:sanitize(substring-before($title, ':'))"/>
                   </xsl:when>
                   <xsl:when test="contains($title, ';')">
                       <xsl:value-of select="t:sanitize(substring-before($title, ';'))"/>
                   </xsl:when>
                   <xsl:when test="contains($title, ',')">
                       <xsl:value-of select="t:sanitize(substring-before($title, ','))"/>
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:value-of select="t:sanitize($title)"/>
                   </xsl:otherwise>
               </xsl:choose>
               <xsl:text>|</xsl:text>
               <xsl:choose>
                   <xsl:when test="contains($author, ',')">
               <xsl:value-of select="substring-before($author,',')"/>
                   </xsl:when>
                   <xsl:otherwise><xsl:value-of select="$author"/></xsl:otherwise></xsl:choose>
           </xsl:variable>
          
       <xsl:copy select=".">
           <xsl:copy select="@*"/>
           <xsl:attribute name="n">
               <xsl:value-of select="$theKey"/>
           </xsl:attribute>
           <xsl:copy-of select="*"></xsl:copy-of>
       </xsl:copy><xsl:text>
</xsl:text>
       
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