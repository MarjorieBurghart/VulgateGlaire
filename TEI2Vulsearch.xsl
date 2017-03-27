<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"     
    version="2.0">
    
    <!-- Appliquer cette feuille de style au fichier Bible_Vulgate_Glaire.xml
    Pour afficher dans une page web un livre au format Vulsearch, indiquer simplement l'abréviation du livre souhaité dans le paramètre ID 
    (la liste des abréviations est celle de Vulsearch). 
    Le résultat peut être copié-collé dans un fichier texte. 
    -->    
    
    <xsl:param name="ID">Gn</xsl:param>
    
    
    
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Vulgate en Français</title>
            </head>
            <body>
                <xsl:variable name="currentID">VULGFR_<xsl:value-of select="$ID"/></xsl:variable>
                <xsl:apply-templates select="//tei:div[@xml:id = $currentID]"/>
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='book']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='chapter']">
        <xsl:apply-templates/>        
    </xsl:template>
    
    <xsl:template match="tei:ab">
        <xsl:value-of select="../@n"/>:<xsl:value-of select="@n"/><xsl:text> </xsl:text><xsl:apply-templates/><br/>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='italics']">
        &lt;<xsl:apply-templates/>&gt; 
    </xsl:template>
</xsl:stylesheet>