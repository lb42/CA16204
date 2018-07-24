<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns="http://www.tei-c.org/ns/1.0"
    
    exclude-result-prefixes="xs t xsi"
    version="2.0">
    
    <xsl:param name="novelId">XXXXXX</xsl:param>
    <xsl:param name="wordCount">0</xsl:param>
    <xsl:output encoding="UTF-8" omit-xml-declaration="yes" method="xml" />
    
    <xsl:template match="/">
        <xsl:processing-instruction name="xml-model"  >
        <xsl:text> href="../../../../WG1/distantreading.github.io/Schema/eltec-1.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>
    <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="t:TEI">
        <TEI>
  <!--      <xsl:attribute name="xmlns">http://www.tei-c.org/ns/1.0</xsl:attribute>
  -->      <xsl:attribute name="xml:id"><xsl:value-of select="$novelId"/></xsl:attribute>
        <xsl:attribute name="xml:lang">ENG</xsl:attribute>
        <xsl:apply-templates />
        </TEI>
    </xsl:template>
    
    <!-- simplify header -->
    
    <xsl:variable name="title">
        <xsl:value-of select="//t:fileDesc/t:titleStmt/t:title[1]"/>
    </xsl:variable>   
    
    <xsl:template match="t:title[@type='filing']"/>
        
    <xsl:template match="t:extent">
        <extent>    
            <measure unit="words"><xsl:value-of select="$wordCount"/></measure>
        </extent>
    </xsl:template>
    
    <xsl:template match="t:publicationStmt">
      <publicationStmt>  <p>Published as part of ELTeC</p></publicationStmt>
    </xsl:template>
    
    <xsl:template match="t:seriesStmt|t:notesStmt"></xsl:template>
    
    <xsl:template match="t:sourceDesc">
       <sourceDesc> <bibl>
            <title><xsl:value-of select="$title"/><xsl:text> : VWWP edition
</xsl:text></title>
            <author><xsl:value-of select="descendant::t:author"/></author>
            <publisher>Digital Library Program, Indiana University</publisher>
            <pubPlace>Bloomington, IN</pubPlace>                   
            <idno><xsl:value-of select="//t:publicationStmt/t:idno"/></idno>
        <relatedItem>
            <bibl>
                <title><xsl:value-of select="$title"/></title>
                <author><xsl:value-of select="descendant::t:author"/></author>
                <xsl:copy-of select="descendant::t:publicationStmt/*"/>
            </bibl>
        </relatedItem></bibl></sourceDesc>
    </xsl:template>
    
    <xsl:template match="t:encodingDesc">
      <encodingDesc>  
          <xsl:attribute name="n">eltec-1</xsl:attribute>
        <p/></encodingDesc>
    </xsl:template>
    
    <xsl:template match="t:profileDesc">
        <profileDesc>
            <langUsage>    <language ident="eng">English</language>
            </langUsage>
            <textDesc>
                <authorGender xmlns="http://distantreading.net/eltec/ns" key="F"></authorGender>
                <size xmlns="http://distantreading.net/eltec/ns" key="medium"></size>
                <canonicity xmlns="http://distantreading.net/eltec/ns" key="low"></canonicity>
                <timeSlot xmlns="http://distantreading.net/eltec/ns" key="T3"></timeSlot>
            </textDesc>
        </profileDesc>
    </xsl:template>
    <xsl:template match="t:revisionDesc">
        <revisionDesc>
            <change when="2018-07-23">LB convert to ELTeC-1</change>
            <xsl:for-each select="t:change[@when]">
                <xsl:sort order="descending" select="@when"/>
                <change>
                    <xsl:attribute name="when" select="@when"/>
                    <xsl:value-of select="@who"/>
                    <xsl:text>: </xsl:text>
                    <xsl:value-of select="."/>
                </change>
            </xsl:for-each>
        </revisionDesc>
    </xsl:template>
   
      <!-- simplify front and back matter -->
    
    <xsl:template match="t:docTitle|t:byline|t:docEdition|t:docImprint|t:docDate">
        <p><xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="t:titlePage">
        <div type="titlepage">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
       
    <xsl:template match="t:div[not(@type='chapter') and not(@type='part') and not (@type='book')]">
        <xsl:choose>
            <xsl:when test="@type='contents'">
                <gap reason="toc"/>
            </xsl:when>
            <xsl:when test="@type='publishers_catalog'">
                <gap reason="publicity"/>
            </xsl:when>
            <xsl:when test="ancestor::t:floatingText">
                <xsl:apply-templates/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="t:note/@place"/>
    
    <xsl:template match="t:choice[t:corr]">
        <corr>
            <xsl:value-of select="t:corr"/>
        </corr>
    </xsl:template>
    
    <xsl:template match="t:choice[t:orig]">
        <xsl:value-of select="t:reg"/>
        <xsl:copy-of select="t:orig/t:pb"/>
    </xsl:template>
    
    <xsl:template match="t:sic"/><!-- can appear outside choice for some reason -->
    
    <xsl:template match="t:epigraph|t:lg">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:cit">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:cit/t:bibl">
    <xsl:apply-templates select="descendant::text()"/>
    </xsl:template>
    
    <xsl:template match="t:div/t:cit/t:bibl">
   <p>     <xsl:apply-templates select="descendant::text()"/>
 </p>   </xsl:template>
    
    
    <xsl:template match="t:cit/t:quote">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="t:closer|t:label">
        <p><xsl:apply-templates/></p>
    </xsl:template>
   
      
    <xsl:template match="t:q">
        <quote>
            <xsl:apply-templates/>
        </quote>
    </xsl:template>
    
    <xsl:template match="t:ab[@type='typography']">
        <milestone type="section" rend="stars"/>
    </xsl:template>
    
    <xsl:template match="t:persName|t:said|t:postscript|t:salute|t:signed|t:distinct|t:sound">      
            <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:hi[t:foreign]">
        <xsl:copy-of select="t:foreign"/>
    </xsl:template>
    
    <xsl:template match="t:foreign[t:hi]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:value-of select="t:hi"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:hi[@rend='sc']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:hi/@rend"/>
    
    <xsl:template match="t:hi/t:hi">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:floatingText">
        <quote>
            <xsl:apply-templates/>
        </quote>
    </xsl:template>
<xsl:template match="t:lb"/>
    <xsl:template match="t:floatingText/t:body">
        <xsl:apply-templates/>
    </xsl:template>
  <!--  <xsl:template match="t:floatingText/t:body/t:div">
        <xsl:apply-templates/>
    </xsl:template> -->
    <xsl:template match="t:floatingText/t:body/t:head">
        <p><xsl:apply-templates/></p>
    </xsl:template>   
    <xsl:template match="* | @* | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
        <!-- could normalize() here -->
    </xsl:template>
    <xsl:template match="comment()">
       <xsl:comment> <xsl:value-of select="."/></xsl:comment>
     </xsl:template>
    
 
    
</xsl:stylesheet>