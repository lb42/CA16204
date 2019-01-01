<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
version="2.0">

    <xsl:variable name="today">
        <xsl:value-of select="current-date()"/>
    </xsl:variable>
    
    <xsl:param name="gutenNum"/>
      
      <xsl:variable name="gutenKey">
          <xsl:value-of select="concat('pg:',$gutenNum)"/>
      </xsl:variable>
        
<!-- first output commands to grab texts -->
        <!--  <xsl:text>curl http://www.gutenberg.org/files/</xsl:text>
            <xsl:value-of select="$gutenNum"/>
            <xsl:text>/</xsl:text> <xsl:value-of select="$gutenNum"/>
            <xsl:text>-h/</xsl:text><xsl:value-of select="$gutenNum"/>
            <xsl:text>-h.htm  | tidy -asxml > EN</xsl:text><xsl:value-of select="$gutenNum"/>
            <xsl:text>.xhtml
</xsl:text>    -->       
<!-- next generate initial headers, each in a separate file -->
       
     
    <xsl:template match="/">
        
        <xsl:message>Processing Gutenberg Text <xsl:value-of select="$gutenNum"/> ( <xsl:value-of 
            select="document('bassetPlus.xml')//bibl[ref[@target=$gutenKey]]/title"/>)</xsl:message>      
        
        
        <xsl:variable name="sex">
            <xsl:value-of select="substring(document('bassetPlus.xml')//bibl[ref[@target=$gutenKey]]/author/@ref,1,1)"/>
        </xsl:variable>
        <xsl:variable name="author">
            <xsl:value-of select="document('bassetPlus.xml')//bibl[ref[@target=$gutenKey]]/author"/>
        </xsl:variable>
        
        <xsl:variable name="title">
            <xsl:value-of select="document('bassetPlus.xml')//bibl[ref[@target=$gutenKey]]/title"/>
        </xsl:variable>
        <xsl:variable name="date">
            <xsl:value-of select="document('bassetPlus.xml')//bibl[ref[@target=$gutenKey]]/date"/>
        </xsl:variable>
        
        <xsl:variable name="timeSlot">
            <xsl:choose>
                <xsl:when test="$date le '1859'">T1</xsl:when>
                <xsl:when test="$date le '1879'">T2</xsl:when>
                <xsl:when test="$date le '1899'">T3</xsl:when>
                <xsl:when test="$date le '1920'">T4</xsl:when>            
            </xsl:choose></xsl:variable>
        
        
        <xsl:variable name="size">????</xsl:variable>
        <!--  <xsl:choose>
                        <xsl:when test="$wordCount le 50000">short</xsl:when>
                        <xsl:when test="$wordCount le 150000">medium</xsl:when>
                        <xsl:when test="$wordCount gt 150000">long</xsl:when>
                    </xsl:choose>-->
        
        <xsl:variable name="pageCount">?</xsl:variable>
        
        
        <teiHeader xmlns="http://www.tei-c.org/ns/1.0">
            <fileDesc>
                <titleStmt>
                    <title><xsl:value-of select="concat($title,' : ELTec edition')"/></title>
                    <author><xsl:value-of select="$author"/></author>
                    <respStmt><resp>ELTeC conversion</resp>
                        <name>Lou Burnard</name></respStmt>
                </titleStmt>               
                <extent>    
                    <measure unit="words">?</measure>
                    <measure unit="pages">?</measure>
                </extent>
                <publicationStmt>  <p>Published as part of ELTeC <date><xsl:value-of
                    select="$today"/></date></p></publicationStmt>
                <sourceDesc> <bibl>
                    <title><xsl:value-of select="concat('Gutenberg text of ',$title)"/></title>
                    <author><xsl:value-of select="$author"/></author>
                    <ref target="{concat('gut:',$gutenNum)}"/>
                    <relatedItem>
                        <bibl type="copyText">
                            <title><xsl:value-of select="$title"/></title>
                            <author><xsl:value-of select="$author"/></author>
                            <publisher><xsl:value-of select="document('bassetPlus.xml')//bibl[ref[@target=$gutenKey]]/publisher"/></publisher>
                            <date><xsl:value-of select="$date"/></date>
                            
                            
                            <xsl:apply-templates select="document('bassetPlus.xml')//bibl[ref[@target=$gutenKey]]"/>
                        </bibl>
                    </relatedItem></bibl></sourceDesc></fileDesc>
            <encodingDesc>  
                <xsl:attribute name="n">eltec-1</xsl:attribute>
                <p/></encodingDesc>
            <profileDesc>
                <langUsage><language ident="eng">English</language>
                </langUsage>
                <textDesc>
                    <authorGender xmlns="http://distant-reading.net/eltec/ns" key="{$sex}"></authorGender>
                    <size xmlns="http://distant-reading.net/eltec/ns" key="{$size}"></size>
                    <canonicity xmlns="http://distant-reading.net/eltec/ns" key="medium"></canonicity>
                    <timeSlot xmlns="http://distant-reading.net/eltec/ns" key="{$timeSlot}"></timeSlot>
                </textDesc>
            </profileDesc>
            <revisionDesc>
                <change when="{$today}">LB convert to ELTeC-1</change>
            </revisionDesc>
            
        </teiHeader>
        
    </xsl:template>
    
     <xsl:template match="bibl">
          
     </xsl:template>
    
</xsl:stylesheet>
