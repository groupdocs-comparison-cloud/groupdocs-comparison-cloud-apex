// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="StorageApi.cls">
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
public with sharing class StorageApi {
    private ApiInvoker apiInvoker;
    private Configuration configuration;

    /**
     * Initializes a new instance of the StorageApi class.
     * 
     * @param appSid Application identifier (App SID)
     * @param appKey Application private key (App Key)
     */
    public StorageApi(String appSid, String appKey) {
        this.configuration = new Configuration(appSid, appKey);
        initializeApiInvoker();
    }

    /**
     * Initializes a new instance of the StorageApi class.
     * 
     * @param configuration Configuration settings
     */
    public StorageApi(Configuration configuration) {
        this.configuration = configuration;
        initializeApiInvoker();
    }

    private void initializeApiInvoker() {
        List<IRequestHandler> requestHandlers = new List<IRequestHandler>();
        requestHandlers.add(new AuthRequestHandler(this.configuration));
        requestHandlers.add(new DebugLogRequestHandler(this.configuration));
        requestHandlers.add(new ApiExceptionRequestHandler());
        this.apiInvoker = new ApiInvoker(requestHandlers, this.configuration.Timeout);
    }

    /**
     * Get disc usage.
     * 
     * @param request Request. {@link GetDiscUsageRequest}
     * @return {@link DiscUsage}
     */
    public DiscUsage getDiscUsage(GetDiscUsageRequest request) {
        // create path and map variables
        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/disc';
        if (request.storageName != null) {
            resourcePath += '?storageName=' + EncodingUtil.urlEncode(request.storageName, 'UTF-8');
        }

        String response = this.apiInvoker.invokeApi(resourcePath, 'GET', null, null, null, null);
        if (response != null) {
            return (DiscUsage)JSON.deserialize(response, DiscUsage.class);
        }
        return null;
    }

    /**
     * Get file versions.
     * 
     * @param request Request. {@link GetFileVersionsRequest}
     * @return {@link FileVersions}
     */
    public FileVersions getFileVersions(GetFileVersionsRequest request) {
        // verify the required parameter 'path' is set
        if (request.path == null) {
            throw new ApiException(400, 'Missing required parameter path when calling getFileVersions');
        }

        // create path and map variables
        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/version/' + EncodingUtil.urlEncode(request.path, 'UTF-8');
        if (request.storageName != null) {
            resourcePath += '?storageName=' + EncodingUtil.urlEncode(request.storageName, 'UTF-8');
        }

        String response = this.apiInvoker.invokeApi(resourcePath, 'GET', null, null, null, null);
        if (response != null) {
            return (FileVersions)JSON.deserialize(response, FileVersions.class);
        }
        return null;
    }

    /**
     * Check if file or folder exists.
     * 
     * @param request Request. {@link ObjectExistsRequest}
     * @return {@link ObjectExist}
     */
    public ObjectExist objectExists(ObjectExistsRequest request) {
        // verify the required parameter 'path' is set
        if (request.path == null) {
            throw new ApiException(400, 'Missing required parameter path when calling objectExists');
        }

        // create path and map variables
        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/exist/' + EncodingUtil.urlEncode(request.path, 'UTF-8');
        if (request.storageName != null) {
            resourcePath += '?storageName=' + EncodingUtil.urlEncode(request.storageName, 'UTF-8');
        }
        if (request.versionId != null) {
            resourcePath += '&versionId=' + EncodingUtil.urlEncode(request.versionId, 'UTF-8');
        }

        String response = this.apiInvoker.invokeApi(resourcePath, 'GET', null, null, null, null);
        if (response != null) {
            return (ObjectExist)JSON.deserialize(response, ObjectExist.class);
        }
        return null;
    }

    /**
     * Check if storage exists.
     * 
     * @param request Request. {@link StorageExistsRequest}
     * @return {@link StorageExist}
     */
    public StorageExist storageExists(StorageExistsRequest request) {
        // verify the required parameter 'storageName' is set
        if (request.storageName == null) {
            throw new ApiException(400, 'Missing required parameter storageName when calling storageExists');
        }

        // create path and map variables
        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/' + EncodingUtil.urlEncode(request.storageName, 'UTF-8') + '/exist';

        String response = this.apiInvoker.invokeApi(resourcePath, 'GET', null, null, null, null);
        if (response != null) {
            return (StorageExist)JSON.deserialize(response, StorageExist.class);
        }
        return null;
    }
}
