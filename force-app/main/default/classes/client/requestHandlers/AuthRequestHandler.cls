// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="AuthRequestHandler.cls">
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
 * AuthRequestHandler handles authentication by managing the access token required for API requests.
 */
public with sharing class AuthRequestHandler implements IRequestHandler {
    private Configuration configurationField;
    private ApiInvoker apiInvoker;
    private String accessToken;

    /**
     * Constructs an AuthRequestHandler instance with the provided configuration.
     * @param configurationArg The configuration object containing API settings.
     */
    public AuthRequestHandler(Configuration configurationArg) {
        this.configurationField = configurationArg;

        List<IRequestHandler> requestHandlers = new List<IRequestHandler>{
            new DebugLogRequestHandler(this.configurationField),
            new ApiExceptionRequestHandler()
        };
        this.apiInvoker = new ApiInvoker(requestHandlers, this.configurationField.Timeout);
    }

    /**
     * Processes the URL before sending the request, ensuring that a valid access token is available.
     *
     * @param url The original URL to be processed.
     * @return The processed URL, which in this case is unchanged.
     */
    public String processUrl(String url) {
        if (String.isEmpty(accessToken)) {
            requestToken();
        }
        return url;
    }

    /**
     * Prepares the request by adding the Authorization header with the access token.
     *
     * @param request The HttpRequest object that is about to be sent.
     */
    public void beforeSend(HttpRequest request) {
        request.setHeader('Authorization', 'Bearer ' + accessToken);
    }

    /**
     * Processes the response from the HTTP request.
     *
     * @param response The HttpResponse object received from the server.
     * @param result The response body as a string.
     */
    public void processResponse(HttpResponse response, string result) {
        // No specific processing required for the response at this time.
    }

    /**
     * Requests a new access token from the authentication server.
     */
    private void requestToken() {
        String requestUrl = configurationField.getApiBaseUrl() + '/connect/token';
        String postData = 'grant_type=client_credentials';
        postData += '&client_id=' + configurationField.AppSid;
        postData += '&client_secret=' + configurationField.AppKey;
        String responseString = (String) apiInvoker.invokeApi(
            requestUrl,
            'POST',
            postData,
            null, // headerParams
            null, // formParams
            'application/x-www-form-urlencoded' // contentType
        );
        Map<String, Object> parsedJson = (Map<String, Object>) JSON.deserializeUntyped(responseString);
        accessToken = (String) parsedJson.get('access_token');
    }
}
