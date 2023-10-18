<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="iso-8859-1" indent="yes"/>

    <xsl:template match="/">
        <html>
            <link rel="stylesheet" type="text/css" href="film.css" />
            <head>
                <title> Cinématographie </title>
            </head>
            <body>
                <h1> Cinématographie </h1>
                <h1> Table des matières des films</h1>
                <xsl:apply-templates select="films/film" mode="tdm">
                    <xsl:sort select="@annee" order="ascending" data-type="number" />
                    <xsl:sort select="exploitation/nbrEntree" order="descending" data-type="number" />
                </xsl:apply-templates>
                <h1> Liste détaillée des films </h1>
                <xsl:apply-templates select="films/film" mode="complet">
                    <xsl:sort select="@annee" order="descending" data-type="number" />
                    <xsl:sort select="exploitation/nbrEntree" order="descending" data-type="number" />
                </xsl:apply-templates>
              <!--  <xsl:apply-templates select="films/film[@annee=2023]" />
                <xsl:apply-templates select="films/film[@annee&lt;2023]" /> -->
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film" mode="complet">
       <h2>
           <xsl:if test="@annee=2023">
               <nouv class="nouveaute">Nouveauté : </nouv>
           </xsl:if>
           <xsl:value-of select="titre" />
       </h2>
        <i>
            film américain de <xsl:value-of select="duree/@temps" /> <xsl:value-of select="duree/@unite" /> sorti en <xsl:value-of select="@annee"/>
        </i>
        <br/>
        *réalisé par <xsl:value-of select="realisateur" />*
        <ul>
            <xsl:apply-templates select="acteurs/acteur"/>
        </ul>
        <xsl:apply-templates select="scenario" />
    </xsl:template>

    <xsl:template match="film" mode="tdm">
        <h2>
            <xsl:if test="@annee=2023">
                <nouv class="nouveaute">Nouveauté : </nouv>
            </xsl:if>
            <xsl:value-of select="titre" />
        </h2>
        <i>
            film américain de <xsl:value-of select="duree/@temps" /> <xsl:value-of select="duree/@unite" /> sorti en <xsl:value-of select="@annee"/>
        </i>
        <br/>
        *réalisé par <xsl:value-of select="realisateur" />*
        <ul>
            <xsl:apply-templates select="acteurs/acteur"/>
        </ul>
        <xsl:apply-templates select="scenario" />
    </xsl:template>

  <!--  <xsl:template match="film[@annee&lt;2023]">
        <h2>
            <xsl:value-of select="titre" />
        </h2>
        <i>
            film américain de <xsl:value-of select="duree/@temps" /> <xsl:value-of select="duree/@unite" /> sorti en <xsl:value-of select="@annee"/>
        </i>
        <br/>
        *réalisé par <xsl:value-of select="realisateur" />*
        <ul>
            <xsl:apply-templates select="acteurs/acteur"/>
        </ul>
        <br/>
        <xsl:apply-templates select="scenario" />
    </xsl:template> -->

    <xsl:template match="acteur">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>

    <xsl:template match="scenario">
        <p class="histoireType">
            <xsl:value-of select="." />
        </p>
    </xsl:template>

</xsl:stylesheet>



