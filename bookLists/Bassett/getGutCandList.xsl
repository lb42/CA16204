<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
  <!--  <xsl:output method="text"/>
 -->   <!-- First step in assembling gutenberg candidate texts is to choose potential
     targets from the bassetPlusPlus list 
     
     we exclude texts by authors tagged as american, canadian, or australian by Bassett
     and select titles within the date range 1840-1920
     
        This stylesheet exports candidate numbers like this
        <cand n="bassetId" g="gutenbergID"/>
     Second step is to make a random selection from the cand list using shuf
     Third step is to generate from that selection
       - skeleton TEI header made by extracting data from bassetPlusPlus list again
       - shell script for grabbing the text from gutenberg and running it through various filters
        -->
    
    <xsl:template match="/">
        <xsl:message>Scanning <xsl:value-of select="count(//bibl[ref[starts-with(@target, 'pg')]])"/> PG titles</xsl:message>
        
   <listCand>
       <xsl:for-each select="//bibl[ref[starts-with(@target, 'pg')]]">
           <xsl:sort select="author"/>
           <xsl:apply-templates select="."/>
       </xsl:for-each>
   </listCand>     
     </xsl:template>
    
    <xsl:template match="bibl">
        <xsl:variable name="authorCode">
            <xsl:value-of select="substring-after(author/@ref, ':')"/>
        </xsl:variable>
        <xsl:variable name="gutenNum">
            <xsl:value-of select="substring-after(ref[starts-with(@target, 'pg')][1]/@target, ':')"
            />
        </xsl:variable>
        
        <xsl:if test="not(document('nonBritishAuthors.xml')//name[@xml:id = $authorCode])
                and date &lt; 1880 and date &gt; 1859">
           <!-- <xsl:value-of select="date"/>
            <xsl:text>|</xsl:text>
            <xsl:value-of select="substring-before(author/@ref, ':')"/>
            <xsl:text>|</xsl:text>
            <xsl:value-of select="normalize-space(substring-before(author, ','))"/>
            <xsl:text>|</xsl:text>
            <xsl:value-of select="normalize-space(title)"/>
            <xsl:text>|curl http://www.gutenberg.org/files/</xsl:text>
            <xsl:value-of select="$gutenNum"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="$gutenNum"/>
            <xsl:text>-h/</xsl:text>
            <xsl:value-of select="$gutenNum"/>
            <xsl:text>-h.htm > </xsl:text>
            <xsl:value-of select="$gutenNum"/>
            <xsl:text>.htm-->
            <cand>
                <xsl:attribute name="bassettNum"><xsl:value-of select="@xml:id"/></xsl:attribute>
                <xsl:attribute name="gutenNum"><xsl:value-of select="$gutenNum"/></xsl:attribute> 
                <xsl:value-of select="normalize-space(substring-before(author, ','))"/>
                <xsl:text>: </xsl:text>
                <xsl:value-of select="normalize-space(title)"/>
                <xsl:text>(</xsl:text><xsl:value-of select="date"/><xsl:text>)</xsl:text>
            </cand><xsl:text>
</xsl:text>

        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
