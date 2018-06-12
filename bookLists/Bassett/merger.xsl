<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output exclude-result-prefixes="#all" omit-xml-declaration="yes"/>

    <!-- Process the bassett TEI file 
        mergeing in links for $hitName from the file $hitFile -->
    
    <xsl:param name="hitFile">ht-bit.xml</xsl:param>
    <xsl:param name="hitName">Hathi Trust</xsl:param>
    <xsl:param name="prefix">ht</xsl:param>
    
    <xsl:param name="hitContext" select="document($hitFile)"/>
    
     <xsl:key name="bassettKeys" match="$hitContext//t:bibl" use="@n"/>
    
    <xsl:template match="/">
        <xsl:message><xsl:value-of select="concat(concat(concat('Merging links for ', $hitName),
            ' from '), $hitFile)"/></xsl:message>
        
      <TEI xmlns="http://www.tei-c.org/ns/1.0">
          <teiHeader>
        
        <listPrefixDef>
            <prefixDef ident="ht"
                matchPattern="([A-Za-z0-9]+)"
                replacementPattern="https://babel.hathitrust.org/cgi/pt?id=$1">
                <p> Private URIs using the <code>ht</code> 
                    are Hathi Trust identifiers
                </p>
            </prefixDef>
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
          </teiHeader>
        <text >
        <body><listBibl xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:for-each select="//t:bibl">
                <xsl:variable name="myKey">
                    <xsl:value-of select="@n"/>
                </xsl:variable>
                <xsl:copy select=".">
                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="*"/>
                    <xsl:for-each select="key('bassettKeys', $myKey, $hitContext)">
                        <xsl:message>Found!</xsl:message>
                        <xsl:variable name="myRef">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:variable>
                        <ref>
                            <xsl:attribute name="target">
                                <xsl:value-of select="concat(concat($prefix,':'),$myRef)"/>
                            </xsl:attribute>
                            <xsl:value-of select="$hitName"/>
                        </ref>
                    </xsl:for-each>
                </xsl:copy>
                <xsl:text>
 </xsl:text>
            </xsl:for-each>
        </listBibl></body></text></TEI>
    </xsl:template>
</xsl:stylesheet>
