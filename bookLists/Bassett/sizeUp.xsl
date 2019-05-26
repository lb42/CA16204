<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" 
    version="2.0">
    <xsl:output method="text" omit-xml-declaration="yes" ></xsl:output>
    <xsl:template match="/">
        <xsl:for-each select="//bibl/ref[starts-with(@target,'pg')]">
            <xsl:variable name="gutenNum">
                <xsl:value-of select="substring-after(@target,':')"/>
            </xsl:variable>
            <xsl:variable name="gutenFile">
                <xsl:value-of select="concat($gutenNum,'.txt')"/>
            </xsl:variable>
            
            <xsl:text>curl -Of http://www.gutenberg.org/files/</xsl:text>
            <xsl:value-of select="concat($gutenNum,'/',$gutenFile)"/>
            <xsl:text>; wc -w >>sizes.txt </xsl:text>
            <xsl:value-of select="concat($gutenFile,'; rm ', $gutenFile)"/>
   <xsl:text>; 
</xsl:text>         
        </xsl:for-each></xsl:template>
    
       <!--     
            
            http://www.gutenberg.org/cache/epub/6753/pg6753.txt"
  -->  
</xsl:stylesheet>