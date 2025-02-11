// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="ApiExceptionRequestHandler.cls">
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
/**
 * ApiExceptionRequestHandler handles exceptions based on the HTTP response status codes.
 */
public with sharing class ApiExceptionRequestHandler implements IRequestHandler {
    private String method;

    public String processUrl(String url) {
        return url;
    }

    /**
     * stores the request information.
     *
     * @param request The HttpRequest object that is about to be sent.
     */
    public void beforeSend(HttpRequest request) {
        this.method = request.getMethod();
    }

    /**
     * Checks the response status code.
     *
     * @param response The HttpResponse object received from the server.
     * @param result The response body as a string.
     */
    public void processResponse(HttpResponse response, string result) {
        if (this.method == 'DELETE' && response.getStatusCode() == 204) {
            return;
        }

        if (this.method == 'POST' && response.getStatusCode() == 201) {
            return;
        }

        if (this.method == 'PUT' && response.getStatusCode() == 201) {
            return;
        }

        if (response.getStatusCode() != 200) {
            this.throwApiException(response, result);
        }
    }

    /**
     * Throws an ApiException based on the HTTP response and the result string.
     *
     * @param webResponse The HttpResponse object containing the response information.
     * @param result The response body as a string.
     */
    private void throwApiException(HttpResponse webResponse, string result) {
        Integer statusCode = webResponse.getStatusCode();

        try {
            String responseData = result;

            if (SerializationHelper.deserialize(responseData, AuthErrorResponse.class) instanceof AuthErrorResponse){
                AuthErrorResponse authErrorResponseArg = (AuthErrorResponse)SerializationHelper.deserialize(responseData, AuthErrorResponse.class);
                if(authErrorResponseArg.error != null){
                    throw new ApiException(statusCode, authErrorResponseArg.error);
                }
            }

            if (SerializationHelper.deserialize(responseData, ApiErrorResponse.class) instanceof ApiErrorResponse){
                ApiErrorResponse apiErrorResponseArg = (ApiErrorResponse)SerializationHelper.deserialize(responseData, ApiErrorResponse.class);
                if (apiErrorResponseArg.Error != null && apiErrorResponseArg.error.message != null){
                    throw new ApiException(statusCode, apiErrorResponseArg.Error.Message);
                }
            }

            if (SerializationHelper.deserialize(responseData, Error.class) instanceof Error) {
                Error apiError = (Error) SerializationHelper.deserialize(responseData, Error.class);
                throw new ApiException(statusCode, apiError.Message);
            }
            throw new ApiException(statusCode, webResponse.getStatus());
        } finally {
            //webResponse.Close();
        }
    }
}
