// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="PreviewApi.cls">
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
public class PreviewApi {
    
    private ApiInvoker apiInvoker;
    private Configuration configuration;

    /**
     * Initializes a new instance of the PreviewApi class.
     * 
     * @param appSid Application identifier (App SID)
     * @param appKey Application private key (App Key)
     */
    public PreviewApi(String appSid, String appKey) {
        this.configuration = new Configuration(appSid, appKey);
        initialize();
    }

    /**
     * Initializes a new instance of the PreviewApi class.
     * 
     * @param configuration Configuration settings
     */
    public PreviewApi(Configuration configuration) {
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
     * Creates a preview images of document pages and returns an array of links to saved result.
     * 
     * @param request Request. {@link PreviewRequest}
     * @return {@link List<Link>}
     */
    public List<Link> preview(PreviewRequest request) {
        // verify the required parameter 'previewOptions' is set
        if (request.previewOptions == null) {
            throw new ApiException(400, 'Missing required parameter \'previewOptions\' when calling preview');
        }

        // create path and map variables
        String resourcePath = this.configuration.getServerUrl() + '/comparison/preview';
        resourcePath = resourcePath.replaceAll('\\*', '').replaceAll('&amp;', '&').replaceAll('/\\?', '?');
        String postBody = SerializationHelper.serialize(request.previewOptions);
        String response = this.apiInvoker.invokeApi(resourcePath, 'POST', postBody, null, null, null);

        if (response != null) {
            return (List<Link>)SerializationHelper.deserialize(response, List<Link>.class);
        }
        return null;
    }
}