<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs whc"
    version="3.0">
    
    <!-- Same match as the original template except we keep the result in a variable. -->
    <xsl:template match="whc:webhelp_child_links" mode="copy_template">
        <xsl:param name="ditaot_topicContent" tunnel="yes"/>
        <xsl:variable name="child_links">
            <xsl:next-match/>
        </xsl:variable>
        <xsl:variable name="flip_tiles" select="$ditaot_topicContent//*[contains(@class, 'cleva_release_intro_flip')]"/>
        <xsl:apply-templates select="$child_links" mode="add_flip">
            <xsl:with-param name="flip_tiles" select="$flip_tiles" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <!-- Copy template to keep all elements unmodified. -->
    <xsl:template match="node() | @*" mode="add_flip">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Match each link to add additional elements. -->
    <xsl:template match="*[contains(@class, 'topic/link')]" mode="add_flip">
        <xsl:param name="flip_tiles" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="$flip_tiles">
                <div class="wh_tile">
                    <div class="flip-container-child">
                        <div class="flip-card-child">
                            <!-- Front side of the flip card -->
                            <div class="flip-card-front-child">
                                <!-- Calls back the copy template -->
                                <xsl:apply-templates select="* except *[contains(@class, 'topic/desc')]" mode="#current"/>
                            </div>
                            <!-- Back side of the flip card -->
                            <div class="flip-card-back-child">
                                <!-- Calls back the copy template -->
                                <xsl:apply-templates select="*[contains(@class, 'topic/desc')]" mode="#current"/>
                            </div>
                        </div>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:include href="move-search-in-header.xsl"></xsl:include>
    
</xsl:stylesheet>
