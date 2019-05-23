<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs t" version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="//t:listBibl">
        <xsl:for-each select="t:bibl">
            <xsl:sort select="t:date"/>
                  <xsl:value-of select="@xml:id"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="t:date"/>
                <xsl:text>,</xsl:text>
                <xsl:choose>
                    <xsl:when test="t:ref[@size]">
                        <xsl:value-of select="t:ref/@size"/>
                    </xsl:when>
                    <xsl:otherwise>0</xsl:otherwise>
                </xsl:choose>
                <xsl:text>,G</xsl:text>
                <xsl:value-of select="substring-after(t:ref[1]/@target, ':')"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="substring(t:author/@ref, 1, 1)"/>
                <xsl:text>,</xsl:text>
                <xsl:choose>
                    <xsl:when test="t:date lt '1860'">T1</xsl:when>
                    <xsl:when test="t:date lt '1880'">T2</xsl:when>
                    <xsl:when test="t:date lt '1900'">T3</xsl:when>
                    <xsl:when test="t:date lt '1921'">T4</xsl:when>
                </xsl:choose>
               
                
                <xsl:text>
</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
