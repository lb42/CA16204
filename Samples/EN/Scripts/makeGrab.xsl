<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" 
    version="2.0">
    
<!-- run this against an HTML index page containing links to wiki chapters 
    to generate a shell script which downloads and transforms them all -->
    
  <xsl:output encoding="UTF-8" omit-xml-declaration="yes" method="text" />


  <xsl:template match="//a[starts-with(@href,'https://en.wikisource.org/wiki/')]">
      <xsl:text>curl "</xsl:text><xsl:value-of select="@href"/>
<xsl:text>" | tidy -utf8 -asxml -n >temp.xml; saxon temp.xml Scripts/dewikify.xsl</xsl:text>
<xsl:text> ></xsl:text>
<xsl:value-of select="substring-before(substring-after(@href,'Volume_'),'/')"/>
<xsl:value-of select="substring-after(@href,'Chapter')"/>
<xsl:text>.xml</xsl:text>
</xsl:template>
</xsl:stylesheet>
