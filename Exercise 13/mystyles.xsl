<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template name="mystyles">
        <style type="text/css">
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
            }
            h2 {
                color: #333;
                text-align: center;
            }
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 10px;
                border: 1px solid #ccc;
            }
            th {
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: left;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #e9e9e9;
            }
        </style>
    </xsl:template>
    <xsl:template match="/">
        <html>
            <head>
                <title>Favourite Books</title>
                <xsl:call-template name="mystyles"/>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Year</th>
                    </tr>
                    <xsl:for-each select="/books/book">
                        <tr>
                            <td><xsl:value-of select="title" /></td>
                            <td><xsl:value-of select="author" /></td>
                            <td><xsl:value-of select="year" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
