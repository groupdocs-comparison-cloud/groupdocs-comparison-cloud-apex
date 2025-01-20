// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="InfoApi.cls">
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
 * GroupDocs.Comparison.Cloud.Sdk API.
 */
public with sharing class InfoApi {
    private ApiInvoker apiInvoker;
    private Configuration configuration;

    /**
     * Initializes a new instance of the InfoApi class.
     * 
     * @param appSid Application identifier (App SID)
     * @param appKey Application private key (App Key)
     */
    public InfoApi(String appSid, String appKey) {
        this(new Configuration(appSid, appKey));
    }

    /**
     * Initializes a new instance of the InfoApi class.
     * 
     * @param configuration Configuration settings
     */
    public InfoApi(Configuration configuration) {
        this.configuration = configuration;

        List<IRequestHandler> requestHandlers = new List<IRequestHandler>();
        requestHandlers.add(new AuthRequestHandler(this.configuration));
        requestHandlers.add(new DebugLogRequestHandler(this.configuration));
        requestHandlers.add(new ApiExceptionRequestHandler());
        this.apiInvoker = new ApiInvoker(requestHandlers, this.configuration.Timeout);
    }

    /**
     * Gets document information.
     * 
     * @param request Request. {@link GetDocumentInfoRequest}
     * @return {@link InfoResult}
     */
    public InfoResult getDocumentInfo(GetDocumentInfoRequest request) {
        if (request.fileInfo == null) {
            throw new ApiException(400, 'Missing required parameter \'fileInfo\' when calling getDocumentInfo');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/info';
        String postBody = SerializationHelper.serialize(request.fileInfo); // http body (model) parameter
        String response = this.apiInvoker.invokeApi(resourcePath, 'POST', postBody, null, null, null);

        if (response != null) {
            return (InfoResult)SerializationHelper.deserialize(response, InfoResult.class);
        }

        return null;
    }

    /**
     * Retrieves supported file formats list.
     * 
     * @return {@link FormatsResult}
     */
    public FormatsResult getSupportedFileFormats() {
        String resourcePath = this.configuration.getServerUrl() + '/comparison/formats';
        String response = this.apiInvoker.invokeApi(resourcePath, 'GET', null, null, null, null);

        if (response != null) {
            return (FormatsResult)SerializationHelper.deserialize(response, FormatsResult.class);
        }

        return null;
    }
}

