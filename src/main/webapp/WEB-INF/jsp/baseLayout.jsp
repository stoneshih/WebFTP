<%--
    Document   : baseLayout
    Created on : Dec 19, 2008, 1:28:41 AM
    Author     : eswar@vaannila.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><tiles:getAsString name="title" ignore="true" /></title>
    </head>
    <body>
        <table border="1" cellpadding="2" cellspacing="2" align="center" width="1600">
            <tr>
                <td height="20%" colspan="2">
                    <tiles:insert attribute="header" ignore="true" />
                </td>
            </tr>
            <tr>
                <td width="20%" height="250">
                    <tiles:insert attribute="menu" />
                </td>
                <td style="vertical-align:top;">
                    <tiles:insert attribute="body" />
                </td>
            </tr>
            <tr>
                <td height="20%" colspan="2">
                    <tiles:insert attribute="footer" />
                </td>
            </tr>
        </table>
    </body>
</html>
