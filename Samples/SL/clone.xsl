<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    xmlns:e="http://distantreading.net/eltec"
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">
   <!-- by default this stylesheet copies all existing tagging unchanged--> 
    
   <!-- add templates for elements you want to change here -->
    <xsl:variable name="fileId">
        <xsl:value-of select="//t:TEI/@xml:id"/>
    </xsl:variable>
    
    <xsl:variable name="fileSize">
        <xsl:value-of select="document('sizes.xml')/f[@n='$fileId']"/>
    </xsl:variable>
    
    <xsl:variable name="textDate">
        <xsl:value-of select="substring-before(substring-after(//t:titleStmt/t:title,'('),')')"/>
    </xsl:variable>
    
    <xsl:template match="e:size/@key">
        <xsl:choose>
            <xsl:when test="$fileSize lt '50000'">short</xsl:when>
            <xsl:when test="$fileSize gt '150000'">long</xsl:when>
        <xsl:otherwise>medium</xsl:otherwise></xsl:choose>
    </xsl:template>
    
    <xsl:template match="e:period/@key">
        <xsl:choose>
            <xsl:when test="$textDate le '1859'">T1</xsl:when>
            <xsl:when test="$textDate gt '1900'">T4</xsl:when>
            <xsl:when test="$textDate gt '1860' and $textDate le '1879'">T2</xsl:when>
            <xsl:when test="$textDate gt '1860' and $textDate le '1879'">T3</xsl:when>
       </xsl:choose>
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
</xsl:stylesheet>