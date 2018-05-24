<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="u o xs c html ss x2 x xsi"
    xmlns:u="urn:schemas-microsoft-com:office:spreadsheet"
    xmlns:c="urn:schemas-microsoft-com:office:component:spreadsheet"
    xmlns:html="http://www.w3.org/TR/REC-html40" xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
    xmlns:x2="http://schemas.microsoft.com/office/excel/2003/xml"
    xmlns:x="urn:schemas-microsoft-com:office:excel"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:t="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <xsl:param name="authorFile" select="document('authors.tei')"/>
    <xsl:template match="/">
        <listBibl>
            <xsl:apply-templates select="*:Workbook/ss:Worksheet/*:Table"/>
        </listBibl>
    </xsl:template>
    <xsl:template match="*:Workbook/ss:Worksheet/*:Table">
        <xsl:for-each select="*:Row[position() gt 1]">
            <xsl:variable name="title">
                <xsl:value-of select="*:Cell[3]/*:Data"/>
            </xsl:variable>
            <xsl:variable name="titleKey">
                <xsl:choose>
                    <xsl:when test="contains($title, ':')">
                        <xsl:value-of
                            select="concat(t:sanitize(substring-before($title, ':')), '|')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat(t:sanitize($title), '|')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="authId">
                <xsl:value-of select="*:Cell[2]/*:Data"/>
            </xsl:variable>
          
            <xsl:variable name="authSex">
                <xsl:value-of
                    select="substring($authorFile//author[substring-after(@xml:id, ':') = $authId]/@xml:id, 1, 1)"
                />
            </xsl:variable>
            
            <xsl:variable name="authString">
                <xsl:value-of
                    select="$authorFile//author[substring-after(@xml:id, ':') = $authId]/name[1]"/>
            </xsl:variable>
            
            <xsl:variable name="authKey">
                <xsl:value-of select="substring-before($authString, ',')"/>
                <!-- not sanitized for
                    consitency with the vwwp-list etc. -->
            </xsl:variable>
            
            <bibl>
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="concat('B', *:Cell[1]/*:Data)"/>
                </xsl:attribute>
                <xsl:attribute name="n">
                    <xsl:value-of select="concat($titleKey, $authKey)"/>
                </xsl:attribute>
                <author>
                    <xsl:attribute name="ref">
                        <xsl:value-of select="concat($authSex, ':',$authId)"/>
                    </xsl:attribute>                   
                    <xsl:value-of select="$authString"/>
                </author>
                <title>
                    <xsl:value-of select="*:Cell[3]/*:Data"/>
                </title>
                <publisher>
                    <xsl:value-of select="*:Cell[4]/*:Data"/>
                </publisher>
                <date>
                    <xsl:value-of select="*:Cell[5]/*:Data"/>
                </date>
            </bibl>
        </xsl:for-each>
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
