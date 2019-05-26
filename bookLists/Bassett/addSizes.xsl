<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:e="http://distant-reading.net/ns"
    exclude-result-prefixes="xs e"
    version="2.0">
  
    <xsl:key name="wcounts" match="sz" use="@n"/>
    
       <xsl:template match="bibl/ref[starts-with(@target,'pg')]">
            <ref>   
                <xsl:variable name="gutenKey">
                    <xsl:value-of select="substring-after(@target,':')"/>
                </xsl:variable>
   <!--             <xsl:message><xsl:value-of select="concat('Looking up ', $gutenKey)"/></xsl:message>
  -->              <xsl:variable name="wc">
                <xsl:for-each select="document('sizes.xml')">
                    <xsl:value-of select="key('wcounts',$gutenKey)[1]/@w"/>
              </xsl:for-each> </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$wc gt '0'">
                        <xsl:attribute name="wcount"><xsl:value-of select="$wc"/></xsl:attribute>
                        <xsl:attribute name="size"><xsl:value-of select="e:szCode($wc)"/></xsl:attribute>                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:message><xsl:value-of select="concat('No size info for ', $gutenKey)"/></xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
              <xsl:apply-templates select="@*"/></ref>
       </xsl:template>
    
    <xsl:function name="e:szCode">
        <xsl:param name="count" as="xs:integer"/>
            <xsl:choose>
                <xsl:when test="$count lt 50000">short</xsl:when>
                <xsl:when test="$count lt 100000">medium</xsl:when>
                <xsl:when test="$count gt 100000">long</xsl:when>
            </xsl:choose>
     </xsl:function>
    
    <xsl:template match="* | @* | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
    
</xsl:stylesheet>