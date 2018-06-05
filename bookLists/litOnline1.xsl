<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
 <listBibl>       <xsl:apply-templates select="//body/ul"/>
</listBibl>    </xsl:template>
  <xsl:template match="ul[@class='contents']">    
        <xsl:variable name="author">
            <xsl:value-of select="li[1]/text()"/>
        </xsl:variable>
        <xsl:for-each select="li/ul/li/a[contains(.,'(18') and not(contains(.,'[in,'))]">
            <bibl><author><xsl:value-of select="$author"/></author>
            <title><xsl:apply-templates/></title></bibl>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>