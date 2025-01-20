// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="ApiInvoker.cls">
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
 * ApiInvoker is a class responsible for making API calls to the GroupDocs service.
 */
public with sharing class ApiInvoker {
    private static final String GROUPDOCS_CLIENT_HEADER_NAME = 'x-groupdocs-client';
    private static final String GROUPDOCS_CLIENT_VERSION_HEADER_NAME = 'x-groupdocs-client-version';
    private Map<String, String> defaultHeaderMap = new Map<String, String>();
    private List<IRequestHandler> requestHandlers;
    private Integer timeout;

    /**
     * Constructs an ApiInvoker instance
     *
     * @param requestHandlers List of IRequestHandler instances to process requests.
     * @param timeout The timeout for HTTP requests in milliseconds.
     */
    public ApiInvoker(List<IRequestHandler> requestHandlers, Integer timeout) {
        String sdkVersion = String.valueOf('1.0');//TODO move to the config
        this.addDefaultHeader(GROUPDOCS_CLIENT_HEADER_NAME, 'apex sdk');//.net sdk
        this.addDefaultHeader(GROUPDOCS_CLIENT_VERSION_HEADER_NAME, sdkVersion.split('\\.')[0] + '.' + sdkVersion.split('\\.')[1]);
        this.requestHandlers = requestHandlers;
        this.timeout = timeout;
    }

    /**
     * Invokes an API.
     *
     * @param path The API endpoint path.
     * @param method The HTTP method.
     * @param body The request body as a JSON string.
     * @param headerParams Map of additional header parameters.
     * @param formParams Map of form parameters for the request.
     * @param contentType The content type of the request.
     * @return The response from the API as a string.
     */
    public String invokeApi(String path, String method, String body, Map<String, String> headerParams, Map<String, Object> formParams, String contentType) {
        if (contentType == null)
        {
            contentType = 'application/json';
        }
        return (String)this.invokeInternal(path, method, false, body, headerParams, formParams, contentType);
    }

    /**
     * Invokes an API, returns the response as a Blob.
     *
     * @param path The API endpoint path.
     * @param method The HTTP method.
     * @param body The request body as a JSON string.
     * @param headerParams Map of additional header parameters.
     * @param formParams Map of form parameters for the request.
     * @param contentType The content type of the request.
     * @return The response from the API as a Blob.
     */
    public Blob invokeBinaryApi(String path, String method, String body, Map<String, String> headerParams, Map<String, Object> formParams, String contentType) {
        if (contentType == null)
        {
            contentType = 'application/json';
        }
        return (Blob)this.invokeInternal(path, method, true, body, headerParams, formParams, contentType);
    }

    /**
     * Converts a Blob to a FileInfoClient object.
     *
     * @param stream The Blob stream to convert.
     * @param paramName The name of the file parameter.
     * @return A FileInfoClient object containing the file information.
     */
    public FileInfoClient toFileInfo(Blob content, String paramName) {
        String contentType = paramName.equalsIgnoreCase('File') ? 'application/octet-stream' : 'application/json';
        FileInfoClient fileInfo = new FileInfoClient();
        fileInfo.Name=paramName;
        fileInfo.MimeType=contentType;
        fileInfo.FileContent=content;
        return fileInfo;
    }

    /**
     * Constructs multipart form data for the given parameters.
     *
     * @param postParameters The parameters to include in the form data.
     * @param boundary The boundary string for the multipart request.
     * @return A Blob containing the multipart form data.
     */
    private Blob getMultipartFormData(Map<String, Object> postParameters, String boundary) {
        Blob formData = Blob.valueOf('');
        Boolean needsClrf = false;

        for (String key : postParameters.keySet()) {
            if (needsClrf) {
                formData = concatBlobs(formData, Blob.valueOf('\r\n'));
            }
            needsClrf = true;

            if (postParameters.get(key) instanceof FileInfoClient) {
                FileInfoClient fileInfo = (FileInfoClient)postParameters.get(key);
                string info = '--'+boundary+'\r\nContent-Disposition: form-data; name="'+key+'"; filename="'+key+'"\r\nContent-Type: '+fileInfo.MimeType+'\r\n\r\n';
                formData = concatBlobs(formData, Blob.valueOf(info));
                formData = concatBlobs(formData, fileInfo.FileContent);
            } else {
                String stringData = JSON.serialize(postParameters.get(key));
                string info ='--'+boundary+'\r\n'
                        +'Content-Disposition: form-data; name="'+key+'"\r\n\r\n'
                        +stringData+'\r\n';
                formData = concatBlobs(formData, Blob.valueOf(info));
            }
        }
        formData = concatBlobs(formData, Blob.valueOf('\r\n--'+boundary+'--\r\n'));
        return formData;
    }

    /**
     * Concatenates two Blob objects into one.
     *
     * @param b1 The first Blob to concatenate.
     * @param b2 The second Blob to concatenate.
     * @return A new Blob that is the concatenation of b1 and b2.
     */
    private Blob concatBlobs(Blob b1, Blob b2){
        String combinedDataAsHex = EncodingUtil.convertToHex(b1) + EncodingUtil.convertToHex(b2);
        return EncodingUtil.convertFromHex(combinedDataAsHex);
    }

    /**
     * Adds a default header to the request if it doesn't already exist.
     *
     * @param key The header key.
     * @param value The header value.
     */
    private void addDefaultHeader(String key, String value) {
        if (!this.defaultHeaderMap.containsKey(key)) {
            this.defaultHeaderMap.put(key, value);
        }
    }

    /**
     * Invokes the API with the prepared request.
     *
     * @param path The API endpoint path.
     * @param method The HTTP method.
     * @param binaryResponse Boolean indicating if the response should be binary.
     * @param body The request body as a JSON string.
     * @param headerParams Map of additional header parameters.
     * @param formParams Map of form parameters for the request.
     * @param contentType The content type of the request.
     * @return The response from the API.
     */
    private Object invokeInternal(String path, String method, Boolean binaryResponse, String body, Map<String, String> headerParams, Map<String, Object> formParams, String contentType) {
        if (formParams == null) {
            formParams = new Map<String, Object>();
        }

        if (headerParams == null) {
            headerParams = new Map<String, String>();
        }

        for (IRequestHandler handler : requestHandlers) {
            path = handler.processUrl(path);
        }

        HttpRequest request = new HttpRequest();
        request = this.PrepareRequest(path, method, formParams, headerParams, body, contentType);
        return this.ReadResponse(request, binaryResponse);
    }
        
    /**
     * Prepares the HTTP request based on the provided parameters.
     *
     * @param path The API endpoint path.
     * @param method The HTTP method.
     * @param formParams Map of form parameters for the request.
     * @param headerParams Map of additional header parameters.
     * @param body The request body as a string.
     * @param contentType The content type of the request.
     * @return The prepared HttpRequest object.
     */
    private HttpRequest prepareRequest(String path, String method, Map<String, Object> formParams, Map<String, String> headerParams, String body, String contentType) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(path);
        request.setMethod(method);
        request.setTimeout(timeout);
    
        Blob formData = null;
        if (formParams.size() > 0) {
            String formDataBoundary = 'GroupDocsViewerForCloud_ApexSDKFormBoundary';
            request.setHeader('Content-Type', 'multipart/form-data; boundary=' + formDataBoundary);
    
            formData = getMultipartFormData(formParams, formDataBoundary);
            request.setHeader('Content-Length', String.valueOf(formData.size()));
        } else {
            request.setHeader('Content-Type', contentType);
        }
    
        for (String key : headerParams.keySet()) {
            request.setHeader(key, headerParams.get(key));
        }
    
        for (String key : this.defaultHeaderMap.keySet()) {
            if (!headerParams.containsKey(key)) {
                request.setHeader(key, this.defaultHeaderMap.get(key));
            }
        }
        
        if (method == 'GET') {
            // No body for GET requests
        } else if (method == 'POST' || method == 'PUT' || method == 'DELETE') {
            if (formData != null) {
                request.setBodyAsBlob(formData);
            }
    
            if (body != null) {
                request.setBody(body);
            }
        } else {
            throw new ApiException(500, 'unknown method type ' + method);
        }
    
        for (IRequestHandler handler : this.requestHandlers) {
            handler.beforeSend(request);
        }
        return request;
    }
    
    /**
     * Reads the response from the HTTP request.
     *
     * @param request The HttpRequest object that was sent.
     * @param binaryResponse Boolean indicating if the response should be binary.
     * @return The response body as either a Blob or a string.
     */
    private Object readResponse(HttpRequest request, Boolean binaryResponse) {
        try {
            Http http = new Http();
            HttpResponse response = http.send(request);
            for (IRequestHandler handler : this.requestHandlers) {
                handler.processResponse(response, response.getBody());
            }
            if (binaryResponse) {
                return response.getBodyAsBlob();
            } else {
                return response.getBody(); 
            }
        } catch (Exception e) {
            system.debug('readResponse exception :::' +e.getMessage());
            throw e; 
        } 
    }
}
