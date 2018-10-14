<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
version="2.0">

<xsl:output method="text"/>
    
    <xsl:template match="/">
<!--<xsl:text>
bassetId|title|date|authSex|onlineID
</xsl:text>-->
        <xsl:apply-templates select="//bibl[ref[starts-with(@target,'pg')]]"/>
        <xsl:message><xsl:value-of select="count(//bibl[ref[starts-with(@target,'pg')]])"/> PG titles</xsl:message>
    </xsl:template>
    
    <xsl:template match="bibl">    
<xsl:variable name="authorCode">
    <xsl:value-of select="substring-after(author/@ref,':')"/>
</xsl:variable>
     <xsl:if test="not(document('nonBritishAuthors.xml')//name[@xml:id=$authorCode])
         and date &lt; 1900 and date &gt; 1839         ">
       <xsl:value-of select="date"/>
        <xsl:text>|</xsl:text>
        <xsl:value-of select="substring-before(author/@ref,':')"/>
        <xsl:text>|</xsl:text>
        
        <xsl:value-of select="normalize-space(substring-before(author,','))"/>
        <xsl:text>|</xsl:text> <xsl:value-of select="normalize-space( title)"/>
            <xsl:text>|</xsl:text>
         <!--        <xsl:value-of select="substring-before(@target,':')"/>
   -->         <xsl:text>http://www.gutenberg.org/ebooks/</xsl:text>
          <xsl:value-of select="substring-after(ref[starts-with(@target,'pg')][1]/@target,':')"/>   
            <xsl:text>
</xsl:text> 
        </xsl:if>
  
    </xsl:template>
</xsl:stylesheet>
