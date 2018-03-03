<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="h t" version="2.0">
    <!-- <doc>
    <str name="creator">Price, Eleanor C. (Eleanor Catherine)</str>
    <str name="date">1983-01-01T00:00:00Z</str>
    <str name="identifier">foreignersnovel01pric</str>
    <str name="language">eng</str>
    <str name="publisher">London : Chatto &amp; Windus</str>
    <str name="title">The foreigners : a novel</str>
    <str name="volume">1</str>
  </doc>-->
    <xsl:template match="/">
        
        <listBibl n="IA19cennov">
            <xsl:apply-templates select="//doc"/>
        </listBibl>
    </xsl:template>
    <xsl:template match="doc">
        <xsl:variable name="auth">
            <xsl:value-of select="str[@name='creator']"/>
        </xsl:variable>
        <xsl:variable name="authorId">
            <xsl:value-of select="substring-before($auth, ',')"/>
        </xsl:variable>
        <xsl:variable name="titleId">
            <xsl:value-of select="str[@name='identifier']"/>
        </xsl:variable>
        <xsl:variable name="titleKey">
            <xsl:choose>
                <xsl:when test="contains(str[@name='title'], ':')">
                    <xsl:value-of select="t:sanitize(substring-before(str[@name='title'],':'))"/>
                </xsl:when>
                <xsl:when test="contains(str[@name='title'], ';')">
                    <xsl:value-of select="t:sanitize(substring-before(str[@name='title'],';'))"/>
                </xsl:when>
                <xsl:when test="contains(str[@name='title'], ', or')">
                    <xsl:value-of select="t:sanitize(substring-before(str[@name='title'],', or'))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="t:sanitize(str[@name='title'])"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="concat('|',$authorId)"/>
            
 <!--           <xsl:value-of select="concat('|',substring-before(tokenize($auth,' ')[last()],'.'))"/>
-->        </xsl:variable>
        <bibl xml:id="{$titleId}" n="{$titleKey}">
            <author>
                <xsl:value-of select="$auth"/>
            </author>
            <title>
                <xsl:value-of select="str[@name='title']"/>
            </title>
            <xsl:value-of select="str[@name='publisher']"/>
        </bibl>
    </xsl:template>
    
    <xsl:function name="t:sanitize" as="xs:string">
        <xsl:param name="text"/>
        <xsl:variable name="alltext">
            <xsl:value-of select="($text)" separator=""/>
        </xsl:variable>
        <xsl:variable name="result"
            select="
                lower-case(replace(normalize-space($alltext),
                '[^\w\[\]\\(\)_]+', ''))"/>
        <xsl:value-of
            select="
                if (string-length($result) &gt; 127) then
                    concat(substring($result, 1, 127), '...')
                else
                    $result"
        />
    </xsl:function>
</xsl:stylesheet>
