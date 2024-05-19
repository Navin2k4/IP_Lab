●	Transform an XML document containing a list of products into an HTML table with columns
for product name, price, and availability. If the product is not available, display a message saying so.

<?xml version="1.0" encoding="UTF-8"?>
<products>
    <product>
        <name>Product 1</name>
        <price>10.99</price>
        <available>true</available>
    </product>
    <product>
        <name>Product 2</name>
        <price>15.99</price>
        <available>false</available>
    </product>
</products>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/products">
        <html>
            <body>
                <table border="1">
                    <tr>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:for-each select="product">
                        <tr>
                            <td><xsl:value-of select="name" /></td>
                            <td><xsl:value-of select="price" /></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="available='true'">Available</xsl:when>
                                    <xsl:otherwise>Not Available</xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
