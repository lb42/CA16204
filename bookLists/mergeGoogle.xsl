<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <xsl:output exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:param name="hitFile" select="document('bassettGoogle-list.xml')"/>
 
    <xsl:template match="/">
  
        <listBibl>
            <xsl:for-each select="//*:bibl">
                <xsl:variable name="id" select="substring-after(@xml:id,'B')"/>
                <xsl:variable name="key" select="@n"/>
               <xsl:copy select=".">
                   <xsl:copy-of select="@*"/>
              
                    <xsl:copy-of select="*"/>
                  
                    <xsl:if test="$hitFile//titles/title[@id = $id]">
                        <ref><xsl:attribute name="target">
                                <xsl:value-of
                                    select="concat('gb:',$hitFile//titles/title[@id =
                                    $id][1]/@googleId)"/>
                            </xsl:attribute>Google Books</ref>
                        <xsl:text>
 </xsl:text>
                    </xsl:if>
                 
               </xsl:copy>
              </xsl:for-each>
        </listBibl>
    </xsl:template>
</xsl:stylesheet>
