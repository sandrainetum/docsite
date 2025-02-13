<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    version="3.0">
    
    <!-- Match the <li> element inside <ul> with the class 'ullinks' -->
    <xsl:template match="ul[@class='ullinks']/li[contains(@class, 'topic/link')]">
        <div class="wh_tile">
            <div class="flip-container">
                <div class="flip-card">
                    <!-- Front side of the flip card -->
                    <div class="flip-card-front">
                        <xsl:apply-templates select="strong"/>
                    </div>
                    <!-- Back side of the flip card -->
                    <div class="flip-card-back">
                        <xsl:apply-templates select="./div[contains(@class, 'topic/desc')]"/>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    
    <!-- Template for <strong> with a child <a> -->
    <xsl:template match="strong">
        <div class="wh_tile_text">
            <div class="wh_tile_title">
                <xsl:copy-of select="node()"/>
            </div>
        </div>
    </xsl:template>
    
    <!-- Template for <div> with class 'topic/desc' -->
    <xsl:template match="div[contains(@class, 'topic/desc')]">
        <div class="wh_tile_shortdesc">
            <xsl:copy-of select="node()"/>
        </div>
    </xsl:template>
    
    <!-- Identity template to copy other content -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
