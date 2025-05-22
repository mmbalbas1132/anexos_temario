<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- Plantilla principal -->
    <xsl:template match="/articulo">
        <articulo>
            <!-- Mover el resumen al principio -->
            <xsl:copy-of select="resumen"/>
            <!-- Copiar el resto del contenido -->
            <titulo>
                <xsl:copy-of select="titulo"/>
            </titulo>
            <autores>
                <!-- Combinar autores con la palabra "por" -->
                <xsl:text>por </xsl:text>
                <xsl:for-each select="autores/autor">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </autores>
            <texto>
                <!-- Transformar etiquetas <parrafo> en <p> y omitir imágenes -->
                <xsl:apply-templates select="texto/*[not(self::imagen)]"/>
            </texto>
        </articulo>
    </xsl:template>

    <!-- Transformar <parrafo> en <p> -->
    <xsl:template match="parrafo">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Omitir imágenes -->
    <xsl:template match="imagen"/>

    <!-- Copiar cualquier otro elemento sin cambios -->
    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>