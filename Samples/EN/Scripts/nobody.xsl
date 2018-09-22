<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs h t" version="2.0">
    
    <xsl:output omit-xml-declaration="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
       <text > 
           <front>
               <xsl:apply-templates select="//t:div[@type='front']"/>
               <div type="liminal">
                  <xsl:apply-templates select="//t:p[@rend='bookintro']"/>
                   <xsl:apply-templates select="//t:p[@rend='rightside']"/>
                   <xsl:apply-templates select="//t:p[@rend='smaller']"/>
                   
               </div>
           </front>
        <body>
        <xsl:apply-templates select="//t:body/t:div[2]"/>
        </body></text>
    </xsl:template>
    
    <xsl:template match="t:div[t:head[t:ref]]"/>
    <xsl:template match="t:table"/>
      
    
    <xsl:template match="t:div">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
   <xsl:template match="t:p">
        <p><xsl:apply-templates></xsl:apply-templates></p>
    </xsl:template>
    <xsl:template match="t:head">
        <head><xsl:apply-templates></xsl:apply-templates></head>
    </xsl:template>
    <xsl:template match="t:hi[@rend='pagenum']">
        <pb>
            <xsl:attribute name="n">
                <xsl:value-of select="."/>
            </xsl:attribute>
        </pb>
    </xsl:template>
    
    <xsl:template match="t:hi[@rend='smallcaps']">
        <label>
            <xsl:apply-templates/>
        </label>
    </xsl:template>
    
    <xsl:template match="t:hi[@rend='firstword']">
       <label>
           <xsl:value-of select="substring-after(substring-before(preceding::t:p[1]/t:graphic/@url,'.png'),'cap')"/>
           <xsl:apply-templates/>
        </label>
    </xsl:template>
    
    <xsl:template match="t:hi[@rend='italic']">
        <hi><xsl:apply-templates/></hi>
    </xsl:template>
    
    <xsl:template match="t:p[@rend='dropcap']"/>
    
    
    <xsl:template match="t:p[@rend='first']">
   <p>     <xsl:apply-templates/>
  </p>  </xsl:template>
    
    <xsl:template match="t:p[@rend='caption']">
        <xsl:variable name="figNum">
            <xsl:value-of select="substring-after(substring-before(preceding-sibling::t:p[1]/t:graphic/@url[1],'.png'),'files/')"/>
        </xsl:variable>
        <gap reason="graphic" n="{$figNum}"/>
            <xsl:comment><xsl:value-of select="."/></xsl:comment>
    </xsl:template>
        

</xsl:stylesheet>