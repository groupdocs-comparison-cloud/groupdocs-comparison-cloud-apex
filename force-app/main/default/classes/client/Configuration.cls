// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="Configuration.cls">
//  Copyright (c) Aspose Pty Ltd
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
public with sharing class Configuration {
    private static final String API_VERSION = '/v2.0';
    private String apiBaseUrl = 'https://api.groupdocs.cloud';

    /** 
     * Request timeout, default value is 100000 ms 
     */
    public Integer Timeout { get; set; }

    /** 
     * Application identifier (App SID) 
     */
    public String AppSid { get; set; }

    /** 
     * Application private key (App Key) 
     */
    public String AppKey { get; set; }

    /** 
     * Enables printing out additional information about each request 
     */
    public Boolean DebugMode { get; set; }

    /** 
     * Initializes a new instance of the Configuration class.
     * 
     * @param appSid Application identifier (App SID)
     * @param appKey Application private key (App Key)
     */
    public Configuration(String appSid, String appKey) {
        if (String.isEmpty(appSid)) {
            throw new IllegalArgumentException('Get your App SID and App Key at https://dashboard.groupdocs.cloud');
        }

        if (String.isEmpty(appKey)) {
            throw new IllegalArgumentException('Get your App SID and App Key at https://dashboard.groupdocs.cloud');
        }

        this.AppSid = appSid;
        this.AppKey = appKey;
        this.Timeout = 100000;
        this.DebugMode = false;
    }

    /** 
     * Server URL, default value is https://api.groupdocs.cloud 
     */
    public String getApiBaseUrl() {
        return apiBaseUrl;
    }

    public void setApiBaseUrl(String value) {
        if (!String.isEmpty(value)) {
            apiBaseUrl = value.trim().replaceAll('/$', ''); // Trim trailing slash
        }
    }

    /** 
     * Retrieves server URL e.g. https://api.groupdocs.cloud/v1 
     * 
     * @return Server URL 
     */
    public String getServerUrl() {
        return apiBaseUrl.trim() + API_VERSION;
    }
}
