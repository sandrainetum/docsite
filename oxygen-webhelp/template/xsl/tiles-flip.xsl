<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:toc="http://www.oxygenxml.com/ns/webhelp/toc"
    xmlns:oxygen="http://www.oxygenxml.com/functions"
    exclude-result-prefixes="xs toc oxygen"
    version="3.0">
    
    <xsl:template match="/toc:toc/toc:topic[oxygen:isTileVisible(.)]" mode="create-tiles">
        <xsl:param name="tileTemplate"/>
        <div class="wh_tile" data-id="{normalize-space(@id)}">
            <div class="flip-container">
                <div class="flip-card">
                    <!-- Front side of the flip card -->
                    <div class="flip-card-front">
                        <div class="wh_tile_text">
                            <div class="wh_tile_title">
                                <span class="topicref">
                                    <a href="{normalize-space(@href)}" data-id="{normalize-space(@id)}">
                                        <xsl:value-of select="normalize-space(toc:title)"/>
                                    </a>
                                </span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Back side of the flip card -->
                    <div class="flip-card-back">
                        <div class="wh_tile_shortdesc">
                            <xsl:apply-templates select="toc:shortdesc"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="toc:shortdesc">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Test if a tile will be output for a topic -->
    <xsl:function name="oxygen:isTileVisible" as="xs:boolean">
        <xsl:param name="cTopic"/>
        <xsl:sequence select="oxygen:shouldDisplayTile($cTopic)"/>
    </xsl:function>
</xsl:stylesheet>
