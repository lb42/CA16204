<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0" version="2.0">
    
    <xsl:output exclude-result-prefixes="#all" omit-xml-declaration="yes"/>

    <!-- select from the input  -->
    
     <xsl:param name="prefix">gut</xsl:param>
    
       
    
    <xsl:template match="/">    
     <listBibl xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:for-each select="//t:bibl[t:ref[starts-with(@target,'gut')]]">
               
              <xsl:copy select=".">
                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="*"/>
                    
               
                <xsl:text>
 </xsl:text>
           </xsl:copy> </xsl:for-each>
          
        </listBibl>
    </xsl:template>
</xsl:stylesheet>
