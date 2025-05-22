<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="2.0">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <head><title>Alumnos aprobados</title></head>
      <body>
        <h1 style="color: chocolate">
          <xsl:value-of select="instituto/@nombre"/>
        </h1>
        <h2 style="margin-left:15px;margin-top:-30px;">Alumnos aprobados</h2>
        <xsl:apply-templates select="//modulo"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="modulo">
    <div style="border:solid 2px gray;padding:2px;width: 200px;box-shadow: 10px 10px 10px gray;">
      <b>CICLO: </b><xsl:value-of select="./@ciclo"/><br/>
      <b>MODULO: </b><xsl:value-of select="./@nombre"/>
    </div>
    <ul>
      <xsl:apply-templates select="alumno[nota &gt;= 5]"/>
    </ul>
  </xsl:template>

  <xsl:template match="alumno[nota &gt;= 5]">
    <li><span style="color: chocolate">
      <xsl:value-of select="nombre"/></span>
      <xsl:text> </xsl:text>
      <b><xsl:value-of select="nota"/></b>
    </li>
  </xsl:template>

  <xsl:template match="alumno[nota &lt; 5]"/>
</xsl:stylesheet>
