<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="u o xs c html ss x2 x xsi"
    xmlns:u="urn:schemas-microsoft-com:office:spreadsheet"
    xmlns:c="urn:schemas-microsoft-com:office:component:spreadsheet"
    xmlns:html="http://www.w3.org/TR/REC-html40" xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
    xmlns:x2="http://schemas.microsoft.com/office/excel/2003/xml"
    xmlns:x="urn:schemas-microsoft-com:office:excel"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    version="2.0">
    <xsl:template match="/">
        <listBibl><xsl:apply-templates select="*:Workbook/ss:Worksheet/*:Table"/></listBibl>
    </xsl:template>
 <xsl:template match="*:Workbook/ss:Worksheet/*:Table">
     <xsl:for-each select="*:Row[position() gt 1]">
         <xsl:variable name="addNameStr">
             <xsl:value-of  select="*:Cell[5]/*:Data"/>                              
         </xsl:variable>
       
     <author>
         <xsl:attribute name="xml:id">
             <xsl:value-of select="*:Cell[8]/*:Data"/>
             <xsl:text>:</xsl:text><xsl:value-of select="*:Cell[1]/*:Data"/>
         </xsl:attribute>
<name>
    <xsl:apply-templates select="*:Cell[4]/*:Data"/>  
    <xsl:text>, </xsl:text>
    <xsl:apply-templates select="*:Cell[2]/*:Data"/>           
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="*:Cell[3]/*:Data"/> 
    <xsl:if test="starts-with($addNameStr,'(pseudonym)')">
        <xsl:text> (pseud.)</xsl:text>
    </xsl:if>
    <xsl:text> (</xsl:text>
    <xsl:apply-templates select="*:Cell[6]/*:Data"/>              
    <xsl:text>-</xsl:text>
    <xsl:apply-templates select="*:Cell[7]/*:Data"/>              
    <xsl:text>).</xsl:text> 
</name>
         <xsl:if test="string-length($addNameStr) gt 4 and
             not($addNameStr = '(pseudonym)')">
         <name type="addname">
             <xsl:choose>
                 <xsl:when test="starts-with($addNameStr,'(')">
                     <xsl:value-of select="substring-after(
                         $addNameStr,';')"/>
                 </xsl:when>
                 <xsl:otherwise>
                    <xsl:value-of select="$addNameStr"/> 
                 </xsl:otherwise>
             </xsl:choose>
             
         </name>
         
     </xsl:if></author>
 </xsl:for-each>   </xsl:template>
    <xsl:template match="*:Data">
        <xsl:choose>
            <xsl:when test=".='NULL'"></xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>