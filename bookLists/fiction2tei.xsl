<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    xmlns:h="http://www.w3.org/1999/xhtml"
    version="2.0">
    <xsl:template match="/">
        <xsl:apply-templates select="//h:table"/>
    </xsl:template>
 <xsl:template match="h:table">
     <xsl:for-each select="h:tr[position() gt 1]">
        
        <xsl:variable name="date">
            <xsl:apply-templates select="h:td[7]/h:p"/>
        </xsl:variable>
   <xsl:if test="$date gt '1800'">
     <bibl>
         <xsl:attribute name="xml:id">
               <xsl:text>ht:</xsl:text><xsl:value-of select="h:td[1]/h:p"/>
         </xsl:attribute>
<author>
    <xsl:value-of select="h:td[5]/h:p"/>  
 </author>
         <title>
             <xsl:value-of select="h:td[11]/h:p"/>  
         </title>
         
     <imprint>
         <xsl:apply-templates select="h:td[6]/h:p"/>  
     </imprint>    
         <date>         <xsl:value-of select="$date"/>
         </date>
     <!--    <place>         <xsl:value-of select="h:td[8]/h:p"/>
         </place>
       <subject>         <xsl:value-of select="h:td[10]/h:p"/>
         </subject>
-->
         <pages>         <xsl:value-of select="h:td[14]/h:p"/>
         </pages>
     </bibl>
    <xsl:text>
    </xsl:text>  </xsl:if> 
 </xsl:for-each>   </xsl:template>
    
    <xsl:template match="h:td">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>