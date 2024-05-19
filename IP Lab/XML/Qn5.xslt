●	Transform an XML document containing a list of movies into an HTML table 
    with columns for title, director, and rating. 
    If the rating is above a certain amount, display it in yellow.
<?xml version="1.0" encoding="UTF-8"?>
<movies>
    <movie>
        <title>Movie 1</title>
        <director>Director 1</director>
        <rating>7.5</rating>
    </movie>
    <movie>
        <title>Movie 2</title>
        <director>Director 2</director>
        <rating>9.2</rating>
    </movie>
</movies>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/movies">
        <html>
            <body>
                <table border="1">
                    <tr>
                        <th>Title</th>
                        <th>Director</th>
                        <th>Rating</th>
                    </tr>
                    <xsl:for-each select="movie">
                        <tr>
                            <td><xsl:value-of select="title" /></td>
                            <td><xsl:value-of select="director" /></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="rating > 8.0">
                                        <span style="background-color:yellow;">
                                        <xsl:value-of select="rating" />
                                        </span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="rating" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
