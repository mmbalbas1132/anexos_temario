<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" indent="yes"/>

  <!-- Plantilla principal -->
  <xsl:template match="/articulo">
    <html>
      <head>
        <title>
          <xsl:value-of select="titulo"/>
        </title>
      </head>
      <body>
        <!-- Título principal -->
        <h1>
          <xsl:value-of select="titulo"/>
        </h1>

        <!-- Subapartado AUTOR -->
        <h2>AUTOR</h2>
        <hr/>
        <p>
          <xsl:choose>
            <xsl:when test="count(autores/autor) = 1">
              <xsl:value-of select="autores/autor"/>
            </xsl:when>
            <xsl:when test="count(autores/autor) = 2">
              <xsl:value-of select="autores/autor[1]"/>
              <xsl:text> y </xsl:text>
              <xsl:value-of select="autores/autor[2]"/>
            </xsl:when>
          </xsl:choose>
        </p>

        <!-- Subapartado RESUMEN -->
        <h2>RESUMEN</h2>
        <hr/>
        <p>
          <xsl:value-of select="resumen"/>
        </p>

        <!-- Subapartado TRAMA -->
        <h2>TRAMA</h2>
        <hr/>
        <xsl:apply-templates select="texto/*"/>
      </body>
    </html>
  </xsl:template>

  <!-- Plantilla para manejar las imágenes -->
  <xsl:template match="imagen">
    <p>
      <b>
        <xsl:text>Imagen: </xsl:text>
        <xsl:value-of select="."/>
        <xsl:text> (Alineación: </xsl:text>
        <xsl:value-of select="@alin"/>
        <xsl:text>)</xsl:text>
      </b>
    </p>
  </xsl:template>

  <!-- Plantilla para manejar los párrafos -->
  <xsl:template match="parrafo">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
</xsl:stylesheet>