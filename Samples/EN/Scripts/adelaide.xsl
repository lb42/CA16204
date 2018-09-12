<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs h" version="2.0">

    <xsl:output omit-xml-declaration="yes" />

    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <text>
            <front><div type="titlepage"><p><xsl:apply-templates select="//h:div[@class='titlepage']"/></p></div>
                <div type="liminal"><xsl:apply-templates select="//h:div[@class='introduction']"/> </div>                      
            </front>
            <body>
        <xsl:apply-templates select="//h:body/h:div[@class='chapter']"/>
            </body>
        </text>
    </xsl:template>

    <xsl:template match="h:div[@class='chapter']">
        <div type="chapter" >
            <xsl:apply-templates/>
        </div>
    </xsl:template>

  <xsl:template match="h:div[@class='stanza']">
      <quote>
          <xsl:apply-templates/>
      </quote>
  </xsl:template>
    
    <xsl:template match="h:div[@class='contents']|h:div[@class='frontmatter']"/>
    <xsl:template match="h:div[@class='dochead']"/>
    <xsl:template match="h:div[@class='docfoot']"/>
    <xsl:template match="h:div[@class='colophon']|h:div[@class='titleverso']">
        <xsl:comment><xsl:apply-templates/></xsl:comment>
    </xsl:template>
    <xsl:template match="h:div[@class='illustration']">
<xsl:variable name="imgURI">
    <xsl:value-of select="//h:img/@src"/>
</xsl:variable>        
        <gap reason="graphic" n="{$imgURI}"/>
    </xsl:template>
    
    <xsl:template match="h:div[@class='header']">     
            <xsl:apply-templates/>
    </xsl:template>

<xsl:template match="h:h3|h:h4">
    <head><xsl:apply-templates/></head>
</xsl:template>
    
    <xsl:template match="h:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="h:div[@class='stanza']/h:p">
        <l>
            <xsl:apply-templates/>
        </l>
    </xsl:template>
    
    <xsl:template match="h:i|h:em">
        <hi>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>

    <xsl:template match="h:a"/>
        
</xsl:stylesheet>
