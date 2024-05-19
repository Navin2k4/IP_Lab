●	Transform an XML document containing a list of products into an HTML table
    with columns for product name, price, and discounted price (if applicable).
    If the product is on sale, display the discounted price in green.

<?xml version="1.0" encoding="UTF-8"?>
<products>
    <product>
        <name>Product 1</name>
        <price>20.00</price>
        <discountedPrice>15.00</discountedPrice>
    </product>
    <product>
        <name>Product 2</name>
        <price>30.00</price>
        <discountedPrice></discountedPrice>
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
                        <th>Discounted Price</th>
                    </tr>
                    <xsl:for-each select="product">
                        <tr>
                            <td><xsl:value-of select="name" /></td>
                            <td><xsl:value-of select="price" /></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="discountedPrice != ''">
                                        <span style="color:green;">
                                        <xsl:value-of select="discountedPrice" />
                                        </span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="price" />
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
