<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="TYPE">ausAuth</xsl:param>
   
    <xsl:template match="div[@id='content']">
        <xsl:apply-templates select="ol"/>
    </xsl:template>
    
    <xsl:template match="ol">
        <listName>
            <desc><xsl:value-of select="preceding-sibling::p"/></desc>
       <xsl:apply-templates/>
        </listName>
    </xsl:template>
    <xsl:template match="li/a">
        <name type="{$TYPE}" xml:id="{substring-after(@href,'?aid=')}">
            <xsl:value-of select="."/>
        </name>
        
    </xsl:template>
</xsl:stylesheet>