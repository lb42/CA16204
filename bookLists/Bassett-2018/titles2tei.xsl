<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
       xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns="http://www.tei-c.org/ns/1.0" 
    xmlns:t="http://www.tei-c.org/ns/1.0"
   version="2.0">
    <xsl:param name="authorFile" select="document('authors.tei')"/>
    <xsl:template match="/">
        <listBibl>
            <xsl:apply-templates select="//t:table"/>
        </listBibl>
    </xsl:template>
    <xsl:template match="t:table">
        <xsl:for-each select="t:row[position() gt 1]">
            <xsl:variable name="title">
                <xsl:value-of select="t:cell[@n='3']"/>
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
                <xsl:value-of select="t:cell[@n='2']"/>
            </xsl:variable>
               <xsl:variable name="authSex">
                <xsl:value-of
                    select="substring($authorFile//*:author[substring-after(@xml:id, ':') = $authId]/@xml:id, 1, 1)"
                />
            </xsl:variable>
                   <xsl:variable name="authString">
                <xsl:value-of
                    select="$authorFile//*:author[substring-after(@xml:id, ':') = $authId]/*:name[1]"/>
            </xsl:variable>
            <!-- 
            <xsl:message>Looking for <xsl:value-of select="$authId"/></xsl:message>
             <xsl:message>in <xsl:value-of select="$authorFile//*:author/@xml:id"/></xsl:message>    
    -->        
          <!--  <xsl:message><xsl:value-of select="$authSex"/></xsl:message>
            <xsl:message><xsl:value-of select="$authString"/></xsl:message>
        -->    
     
            <xsl:variable name="authKey">
                <xsl:value-of select="substring-before($authString, ',')"/>
                <!-- not sanitized for
                    consitency with the vwwp-list etc. -->
            </xsl:variable>
          <xsl:if test="$authId">
            <bibl>
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="concat('B', t:cell[@n='1'])"/>
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
                    <xsl:value-of select="t:cell[@n='3']"/>
                </title>
                <publisher>
                    <xsl:value-of select="t:cell[@n='5']"/>
<xsl:text>: </xsl:text>
                    <xsl:value-of select="t:cell[@n='6']"/>
                </publisher>
                <date>
                    <xsl:value-of select="substring(t:cell[@n='7'],1,4)"/>
                </date>
<!-- cell 4 contains number of volumes -->
            </bibl></xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:function name="t:sanitize" as="xs:string" >
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
