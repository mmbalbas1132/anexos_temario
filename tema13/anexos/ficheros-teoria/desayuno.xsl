<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <!-- Configuración de salida -->
  <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

  <!-- Plantilla principal -->
  <xsl:template match="/carta">
    <html>
      <head>
        <title>Menú de Desayunos</title>
      </head>
      <body>
        <!-- Título principal -->
        <h1>Menú de Desayunos</h1>
        <table border="1" style="width: 50%; text-align: left;">
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Precio (€)</th>
              <th>Descripción</th>
            </tr>
          </thead>
          <tbody>
            <!-- Aplicar plantilla a cada desayuno -->
            <xsl:apply-templates select="desayuno"/>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>

  <!-- Plantilla para cada desayuno -->
  <xsl:template match="desayuno">
    <tr>
      <td>
        <!-- Mostrar el nombre del desayuno -->
        <xsl:value-of select="nombre"/>
      </td>
      <td>
        <!-- Mostrar el precio del desayuno -->
        <xsl:value-of select="precio"/>
      </td>
      <td>
        <!-- Mostrar la descripción del desayuno -->
        <xsl:value-of select="descripcion"/>
        <!-- Añadir texto adicional con disable-output-escaping -->
        <xsl:text disable-output-escaping="yes"> (¡Delicioso!)</xsl:text>
      </td>
    </tr>
  </xsl:template>

  <!-- Plantilla para manejar elementos adicionales -->
  <xsl:template match="*">
    <!-- Copiar cualquier otro elemento no especificado -->
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>