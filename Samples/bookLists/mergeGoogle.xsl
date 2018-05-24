<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <xsl:output exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:param name="hitFile" select="document('bassettGoogle-list.xml')"/>
    <xsl:param name="vwwpFile" select="document('vwwp-list.xml')"/>
    <xsl:param name="iaFile" select="document('internetArchive-list.xml')"/>
    <xsl:param name="gutenFile" select="document('guten-list.xml')"/>
    
  
    <xsl:template match="/">
  <xsl:comment>
     <listPrefixDef>
 <prefixDef ident="ia"
  matchPattern="([A-Za-z0-9]+)"
  replacementPattern="https://archive.org/details/$1">
  <p> Private URIs using the <code>ia</code> 
     prefix are pointers to one or more pages on Internet Archive.
  </p>
 </prefixDef>
         <prefixDef ident="gb"
  matchPattern="([A-Za-z0-9]+)"
  replacementPattern="https://books.google.co.uk/books?id=$1">
  <p> Private URIs using the <code>gb</code> 
     prefix are pointers to one or more pages on Google Books
  </p>
 </prefixDef>
 <prefixDef ident="vw"
  matchPattern="(VAB[0-9]*)"
  replacementPattern="http://purl.dlib.indiana.edu/iudl/vwwp/encodedtext/$1">
  <p> Private URIs using the <code>vw</code> prefix can be
     expanded to form URIs which retrieve the relevant
     TEI XML file from the Victorian Women Writers Project
  </p>
 </prefixDef>
         <prefixDef ident="pg"
  matchPattern="([a-z]+[a-z0-9]*)"
  replacementPattern="http://www.gutenberg.org/ebooks/$1">
  <p> Private URIs using the <code>pg</code> prefix can be
     expanded to form URIs which point to the relevant download page at Project Gutenberg
  </p>
 </prefixDef>
</listPrefixDef>
  </xsl:comment>
        
        <listBibl>
            <xsl:for-each select="//*:bibl">
                <xsl:variable name="id" select="substring-after(@xml:id,'B')"/>
                <xsl:variable name="key" select="@n"/>
               <xsl:copy select=".">
                   <xsl:copy-of select="@*"/>
               <!-- <xsl:element name="bibl">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="concat('B', $id)"/>
                    </xsl:attribute>
                    <xsl:attribute name="key">
                        <xsl:value-of select="$key"/>
                    </xsl:attribute>-->
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
                    <xsl:if test="$vwwpFile//bibl[@n = $key]">
                        <ref><xsl:attribute name="target">
                            <xsl:value-of
                                select="concat('vw:',$vwwpFile//bibl[@n = $key][1]/@xml:id)"/>
                        </xsl:attribute>VWWP</ref>
                        <xsl:text>
 </xsl:text>
                    </xsl:if>
                    <xsl:if test="$iaFile//bibl[@n = $key]">
                        <ref><xsl:attribute name="target">
                            <xsl:value-of
                                select="concat('ia:',$iaFile//bibl[@n = $key][1]/@xml:id)"/>
                        </xsl:attribute>Internet Archive</ref>
                        <xsl:text>
 </xsl:text>
                    </xsl:if>
                    <xsl:if test="$gutenFile//bibl[@n = $key]">
                        <ref><xsl:attribute name="target">
                            <xsl:value-of
                                select="concat('pg:',$gutenFile//bibl[@n = $key][1]/@xml:id)"/>
                        </xsl:attribute>Project Gutenberg</ref>
                        <xsl:text>
 </xsl:text>
                    </xsl:if>
               </xsl:copy>
              </xsl:for-each>
        </listBibl>
    </xsl:template>
</xsl:stylesheet>
