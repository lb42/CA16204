<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs t"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <xsl:template match="/">
        <xsl:apply-templates select="//t:title"/>
    </xsl:template>
    
    <xsl:template match="t:title">
     <!--   <xsl:message><xsl:value-of select="."/></xsl:message>
   -->     <xsl:for-each select="tokenize(t:sanitize(.), ' ')">
             <xsl:value-of select="."/><xsl:text>
 </xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:function name="t:sanitize" as="xs:string" >
        <xsl:param name="text"/>
        <xsl:variable name="alltext">
            <xsl:value-of select="($text)" separator=" "/>
        </xsl:variable>
        <xsl:variable name="result"
            select="
            lower-case(normalize-space(replace($alltext,'[.,:]','')))"/>
        <xsl:value-of
            select="
            if (string-length($result) &gt; 127) then
            concat(substring($result, 1, 127), '...')
            else
            $result"
        />
    </xsl:function>
</xsl:stylesheet>