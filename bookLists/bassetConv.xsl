<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="h t" version="2.0">
    <xsl:template match="/">
        <xsl:variable name="year">
            <xsl:value-of
                select="substring-before(substring-after(//h:p[@class = 'entry'], 'year '), ':')"/>
        </xsl:variable>
        <listBibl n="{$year}">
            <xsl:apply-templates select="//h:ol"/>
        </listBibl>
    </xsl:template>
    <xsl:template match="h:ol/h:li">
        <xsl:variable name="auth">
            <xsl:value-of select="substring-before(., '&#160;')"/>
        </xsl:variable>
        <xsl:variable name="authorId">
            <xsl:value-of select="substring-after(h:i/h:a/@href, 'aid=')"/>
        </xsl:variable>
        <xsl:variable name="titleId">
            <xsl:value-of select="substring-before(substring-after(h:i/h:a/@href,'tid='),'&amp;')"/>
        </xsl:variable>
        <xsl:variable name="titleKey">
            <xsl:choose>
                <xsl:when test="contains(h:i, ':')">
                    <xsl:value-of select="t:sanitize(substring-before(h:i, ':'))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="t:sanitize(h:i)"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="concat('|',substring-before(tokenize($auth,' ')[last()],'.'))"/>
        </xsl:variable>
        <bibl xml:id="{$titleId}" n="{$titleKey}">
            <author n="{$authorId}">
                <xsl:value-of select="$auth"/>
            </author>
            <title>
                <xsl:value-of select="h:i"/>
            </title>
            <xsl:value-of select="text()[preceding-sibling::h:i][1]"/>
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
