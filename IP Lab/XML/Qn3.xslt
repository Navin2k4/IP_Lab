●	Transform an XML document containing a list of students into an HTML table
 with columns for name, grade, and GPA.
  If the student's GPA is below a certain amount, display it in red.
<?xml version="1.0" encoding="UTF-8"?>
<students>
    <student>
        <name>Alice Johnson</name>
        <grade>A</grade>
        <gpa>3.8</gpa>
    </student>
    <student>
        <name>Bob Brown</name>
        <grade>B</grade>
        <gpa>2.5</gpa>
    </student>
</students>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/students">
        <html>
            <body>
                <table border="1">
                    <tr>
                        <th>Name</th>
                        <th>Grade</th>
                        <th>GPA</th>
                    </tr>
                    <xsl:for-each select="student">
                        <tr>
                            <td><xsl:value-of select="name" /></td>
                            <td><xsl:value-of select="grade" /></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="gpa < 3.0">
                                        <span style="color:red;"><xsl:value-of select="gpa" /></span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="gpa" />
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
