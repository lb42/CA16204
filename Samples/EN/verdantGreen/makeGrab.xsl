<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" 
    version="2.0">

  <xsl:output encoding="UTF-8" omit-xml-declaration="yes" method="text" />


<xsl:template match="/ul/li/a">
curl <xsl:value-of select="@href"/>
<xsl:text> | saxon - verdant.xsl</xsl:text>
<xsl:text> >verdantGreen</xsl:text>
<xsl:value-of select="substring-after(@href,'chapter')"/>
<xsl:text>.xml</xsl:text>
</xsl:template>
</xsl:stylesheet>
