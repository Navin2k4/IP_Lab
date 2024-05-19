●	Transform an XML document containing a list of employees into an HTML 
table with columns for name, job title, and salary. If the employee's salary 
is over a certain amount, display it in bold.

<?xml version="1.0" encoding="UTF-8"?>
<employees>
    <employee>
        <name>John Doe</name>
        <jobTitle>Software Engineer</jobTitle>
        <salary>80000</salary>
    </employee>
    <employee>
        <name>Jane Smith</name>
        <jobTitle>Project Manager</jobTitle>
        <salary>120000</salary>
    </employee>
</employees>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/employees">
        <html>
            <body>
                <table border="1">
                    <tr>
                        <th>Name</th>
                        <th>Job Title</th>
                        <th>Salary</th>
                    </tr>
                    <xsl:for-each select="employee">
                        <tr>
                            <td><xsl:value-of select="name" /></td>
                            <td><xsl:value-of select="jobTitle" /></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="salary > 100000">
                                        <b><xsl:value-of select="salary" /></b>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="salary" />
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
