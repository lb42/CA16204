<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs h" version="2.0">

    <xsl:output omit-xml-declaration="yes" encoding="UTF-8"/>


    <xsl:template match="/">
        <xsl:apply-templates select="//h:div[@class = 'chapter']"/>
    </xsl:template>

    <xsl:template match="h:div[@class = 'chapter']">
        <div type="chapter" xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="h:h2 | h:h3">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>

    <xsl:template match="h:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="h:i">
        <hi>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>

    <xsl:template match="h:a[@href]">
        <xsl:variable name="target">
            <xsl:value-of select="substring-after(@href, '#')"/>
        </xsl:variable>
        <note>
            <xsl:attribute name="n">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
            <xsl:apply-templates select="//h:div[@class = 'footnotes']/h:p[h:a[@name = $target]]"/>
        </note>
    </xsl:template>

    <xsl:template match="h:a[@name]"/>
    <xsl:template match="h:div[@class = 'footnotes']"/>

    <xsl:template match="h:blockquote[//h:br]">
        <quote>
          <!--  <xsl:choose>
                <xsl:when test="h:i">
         -->           <xsl:for-each-group select="*" group-starting-with="h:br">
                        <xsl:for-each select="current-group()//h:br">
                            <xsl:choose>
                                <xsl:when test="ancestor::h:i">
                                    <l>
                                        <hi>
                                            <xsl:apply-templates
                                                select="preceding-sibling::text()[1]"/>
                                        </hi>
                                    </l>
                                </xsl:when>
                                <xsl:otherwise>
                                    <l>
                                        <xsl:apply-templates 
                                            select="preceding-sibling::text()[1]"/>
                                    </l>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:for-each-group>
              <!--  </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each-group select="*" group-starting-with="h:br">
                        <xsl:for-each select="current-group()">
                            <l>
                                <xsl:apply-templates select="preceding-sibling::text()[1]"/>
                            </l>
                        </xsl:for-each>
                    </xsl:for-each-group>

                </xsl:otherwise>
            </xsl:choose>-->
        </quote>
    </xsl:template>

    <!--<xsl:template match="h:blockquote[h:br]">
        <quote>
            <xsl:for-each-group select="*" group-starting-with="h:br">
                <xsl:for-each select="current-group()">
                    <l>
                        <xsl:apply-templates select="preceding-sibling::text()[1]"/>
                    </l>  
                </xsl:for-each>
            </xsl:for-each-group>
        </quote>
    </xsl:template>
    -->
    <!--<xsl:template match="h:br">
        <lb/>
    </xsl:template>-->

</xsl:stylesheet>
