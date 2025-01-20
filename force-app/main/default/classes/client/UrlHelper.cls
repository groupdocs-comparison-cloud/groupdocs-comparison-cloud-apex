// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="UrlHelper.cls">
//  Copyright (c) 2003-2024 Aspose Pty Ltd
// </copyright>
// <summary>
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
// 
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
// 
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
// </summary>
// --------------------------------------------------------------------------------------------------------------------
/** 
 * A helper class for managing URL parameters.
 */
public with sharing class UrlHelper {

    /** 
     * Adds a path parameter to the URL.
     * 
     * @param url The URL to which the path parameter will be added.
     * @param parameterName The name of the path parameter.
     * @param parameterValue The value of the path parameter.
     * @return The updated URL with the path parameter added or removed.
     */
    public static String addPathParameter(String url, String parameterName, Object parameterValue) {
        if (parameterValue == null || String.isEmpty(parameterValue.toString())) {
            url = url.replace('/{' + parameterName + '}', '');
        } else {
            url = url.replace('{' + parameterName + '}', parameterValue.toString());
        }
        
        return url;
    }

    /** 
     * Adds a query parameter to the URL. If the URL contains a path 
     * parameter, it will replace it with the given value.
     * 
     * @param url The URL to which the query parameter will be added.
     * @param parameterName The name of the query parameter.
     * @param parameterValue The value of the query parameter.
     * @return The updated URL with the query parameter added.
     */
    public static String addQueryParameterToUrl(String url, String parameterName, Object parameterValue) {
        if (url.contains('{' + parameterName + '}')) {
            url = addPathParameter(url, parameterName, parameterValue);
            return url;
        }

        if (url.contains('%7B' + parameterName + '%7D')) {
            url = url.replace('%7B', '{').replace('%7D', '}');
            url = addPathParameter(url, parameterName, parameterValue);
            return url;
        }

        if (parameterValue == null) {
            return url;
        }

        // Build the query string
        String delimiter = url.contains('?') ? '&' : '';
        String query = url.contains('?') ? url.substringAfter('?') : '';
        query = query.startsWith('?') ? query.substring(1) : query;

        // Escape the parameter value
        String encodedValue = EncodingUtil.urlEncode(parameterValue.toString(), 'UTF-8');

        // Construct the new query string
        url = url.split('\\?')[0] + '?' + query + delimiter + parameterName + '=' + encodedValue;

        return url;
    }
}
