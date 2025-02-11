// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="CompareApi.cls">
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
 * GroupDocs.Comparison.Cloud.Sdk API.
 */
public class CompareApi {
    
    private ApiInvoker apiInvoker;
    private Configuration configuration;

    /**
     * Initializes a new instance of the CompareApi class.
     * 
     * @param appSid Application identifier (App SID)
     * @param appKey Application private key (App Key)
     */
    public CompareApi(String appSid, String appKey) {
        this.configuration = new Configuration(appSid, appKey);
        initialize();
    }

    /**
     * Initializes a new instance of the CompareApi class.
     * 
     * @param configuration Configuration settings
     */
    public CompareApi(Configuration configuration) {
        this.configuration = configuration;
        initialize();
    }

    /**
     * Initializes request handlers and the API invoker
     */
    private void initialize() {
        List<IRequestHandler> requestHandlers = new List<IRequestHandler>();
        requestHandlers.add(new AuthRequestHandler(this.configuration));
        requestHandlers.add(new DebugLogRequestHandler(this.configuration));
        requestHandlers.add(new ApiExceptionRequestHandler());
        this.apiInvoker = new ApiInvoker(requestHandlers, this.configuration.Timeout);
    }

    /**
     * Compares source and target documents and returns a link to saved result.
     * 
     * @param request Request. {@link ComparisonsRequest}
     * @return {@link Link}
     */
    public Link comparisons(ComparisonsRequest request) {
        // verify the required parameter 'comparisonOptions' is set
        if (request.comparisonOptions == null) {
            throw new ApiException(400, 'Missing required parameter \'comparisonOptions\' when calling comparisons');
        }

        // create path and map variables
        String resourcePath = this.configuration.getServerUrl() + '/comparison/comparisons';
        resourcePath = resourcePath.replaceAll('\\*', '').replaceAll('&amp;', '&').replaceAll('/\\?', '?');
        String postBody = SerializationHelper.serialize(request.comparisonOptions);
        String response = this.apiInvoker.invokeApi(resourcePath, 'POST', postBody, null, null, null);

        if (response != null) {
            return (Link)SerializationHelper.deserialize(response, Link.class);
        }
        return null;
    }

    /**
     * Retrieves a list of changes between source and target documents.
     * 
     * @param request Request. {@link PostChangesRequest}
     * @return {@link List<ChangeInfo>}
     */
    public List<ChangeInfo> postChanges(PostChangesRequest request) {
        // verify the required parameter 'comparisonOptions' is set
        if (request.comparisonOptions == null) {
            throw new ApiException(400, 'Missing required parameter \'comparisonOptions\' when calling postChanges');
        }

        // create path and map variables
        String resourcePath = this.configuration.getServerUrl() + '/comparison/changes';
        resourcePath = resourcePath.replaceAll('\\*', '').replaceAll('&amp;', '&').replaceAll('/\\?', '?');
        String postBody = SerializationHelper.serialize(request.comparisonOptions);
        String response = this.apiInvoker.invokeApi(resourcePath, 'POST', postBody, null, null, null);
        if (response != null) {
            return (List<ChangeInfo>)SerializationHelper.deserialize(response, List<ChangeInfo>.class);
        }
        return null;
    }

    /**
     * Accepts or rejects changes to the resultant document and returns a link to saved result.
     * 
     * @param request Request. {@link PutChangesDocumentRequest}
     * @return {@link Link}
     */
    public Link putChangesDocument(PutChangesDocumentRequest request) {
        // verify the required parameter 'updatesOptions' is set
        if (request.updatesOptions == null) {
            throw new ApiException(400, 'Missing required parameter \'updatesOptions\' when calling putChangesDocument');
        }

        // create path and map variables
        String resourcePath = this.configuration.getServerUrl() + '/comparison/updates';
        resourcePath = resourcePath.replaceAll('\\*', '').replaceAll('&amp;', '&').replaceAll('/\\?', '?');
        String postBody = SerializationHelper.serialize(request.updatesOptions);
        String response = this.apiInvoker.invokeApi(resourcePath, 'PUT', postBody, null, null, null);

        if (response != null) {
            return (Link)SerializationHelper.deserialize(response, Link.class);
        }
        return null;
    }
}

