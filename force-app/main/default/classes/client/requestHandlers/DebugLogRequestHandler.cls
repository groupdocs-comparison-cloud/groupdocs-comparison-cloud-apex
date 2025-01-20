// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="DebugLogRequestHandler.cls">
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
 * DebugLogRequestHandler logs the details of the HTTP requests and responses for debugging purposes.
 */
public class DebugLogRequestHandler implements IRequestHandler {
    
    private Configuration configuration;

    /**
     * Constructs a DebugLogRequestHandler instance.
     *
     * @param configuration The configuration object containing debug settings.
     */
    public DebugLogRequestHandler(Configuration configuration) {
        this.configuration = configuration;
    }

    public String processUrl(String url) {
        return url;
    }

    /**
     * Prepares the request for logging if debugging is enabled.
     *
     * @param request The HttpRequest object that is about to be sent.
     */
    public void beforeSend(HttpRequest request) {
        if (this.configuration.debugMode) {
            this.logRequest(request);
        }
    }

    /**
     * Processes the response from the HTTP request and logs it if debugging is enabled.
     *
     * @param response The HttpResponse object received from the server.
     * @param result The response body as a string.
     */
    public void processResponse(HttpResponse response, string result) {
        if (this.configuration.debugMode) {
            this.logResponse(response, result);
        }
    }

    /**
     * Logs the details of the HTTP request.
     *
     * @param request The HttpRequest object being logged.
     */
    private void logRequest(HttpRequest request) {
        String header = request.getMethod() + ': ' + request.getEndpoint();
        this.log(header, '');
    }

    /**
     * Logs the details of the HTTP response.
     *
     * @param response The HttpResponse object being logged.
     * @param result The response body as a string.
     */
    private void logResponse(HttpResponse response, string result) {
        String header = '\nResponse ' + response.getStatusCode() + ': ' + response.getStatus();
        String sb = '';

        for (String key : response.getHeaderKeys()) {
            sb += key + ': ' + response.getHeader(key) + '\n';
        }
        sb += result;
        this.log(header, sb);
    }

    /**
     * Outputs the log messages to the debug log.
     *
     * @param header The header message to log.
     * @param sb The detailed message to log.
     */
    private void log(String header, String sb) {
        System.debug(header);
        System.debug(sb);
    }
}
