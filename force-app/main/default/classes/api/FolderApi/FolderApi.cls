// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="FolderApi.cls">
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
public with sharing class FolderApi {
    private ApiInvoker apiInvoker;
    private Configuration configuration;

    /**
     * Initializes a new instance of the FolderApi class.
     * 
     * @param appSid Application identifier (App SID)
     * @param appKey Application private key (App Key)
     */
    public FolderApi(String appSid, String appKey) {
        this.configuration = new Configuration(appSid, appKey);
        initializeApiInvoker();
    }

    /**
     * Initializes a new instance of the FolderApi class.
     * 
     * @param configuration Configuration settings
     */
    public FolderApi(Configuration configuration) {
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
     * Copy folder
     * 
     * @param request Request. {@link CopyFolderRequest}
     */
    public void copyFolder(CopyFolderRequest request) {
        if (request.srcPath == null) {
            throw new ApiException(400, 'Missing required parameter srcPath when calling copyFolder');
        }
        if (request.destPath == null) {
            throw new ApiException(400, 'Missing required parameter destPath when calling copyFolder');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/folder/copy/' + EncodingUtil.urlEncode(request.srcPath, 'UTF-8');
        resourcePath += '?destPath=' + EncodingUtil.urlEncode(request.destPath, 'UTF-8');
        if (request.srcStorageName != null) {
            resourcePath += '&srcStorageName=' + EncodingUtil.urlEncode(request.srcStorageName, 'UTF-8');
        }
        if (request.destStorageName != null) {
            resourcePath += '&destStorageName=' + EncodingUtil.urlEncode(request.destStorageName, 'UTF-8');
        }

        this.apiInvoker.invokeApi(resourcePath, 'PUT', null, null, null, null);
    }

    /**
     * Create the folder
     * 
     * @param request Request. {@link CreateFolderRequest}
     */
    public void createFolder(CreateFolderRequest request) {
        if (request.path == null) {
            throw new ApiException(400, 'Missing required parameter path when calling createFolder');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/folder/' + EncodingUtil.urlEncode(request.path, 'UTF-8');
        if (request.storageName != null) {
            resourcePath += '?storageName=' + EncodingUtil.urlEncode(request.storageName, 'UTF-8');
        }

        this.apiInvoker.invokeApi(resourcePath, 'PUT', null, null, null, null);
    }

    /**
     * Delete folder
     * 
     * @param request Request. {@link DeleteFolderRequest}
     */
    public void deleteFolder(DeleteFolderRequest request) {
        if (request.path == null) {
            throw new ApiException(400, 'Missing required parameter path when calling deleteFolder');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/folder/' + EncodingUtil.urlEncode(request.path, 'UTF-8');
        if (request.storageName != null) {
            resourcePath += '?storageName=' + EncodingUtil.urlEncode(request.storageName, 'UTF-8');
        }
        if (request.recursive != null) {
            resourcePath += '&recursive=' + request.recursive;
        }

        this.apiInvoker.invokeApi(resourcePath, 'DELETE', null, null, null, null);
    }

    /**
     * Get all files and folders within a folder
     * 
     * @param request Request. {@link GetFilesListRequest}
     * @return {@link FilesList}
     */
    public FilesList getFilesList(GetFilesListRequest request) {
        if (request.path == null) {
            throw new ApiException(400, 'Missing required parameter path when calling getFilesList');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/folder/' + EncodingUtil.urlEncode(request.path, 'UTF-8');
        if (request.storageName != null) {
            resourcePath += '?storageName=' + EncodingUtil.urlEncode(request.storageName, 'UTF-8');
        }

        String response = this.apiInvoker.invokeApi(resourcePath, 'GET', null, null, null, null);
        if (response != null) {
            return (FilesList)JSON.deserialize(response, FilesList.class);
        }
        return null;
    }

    /**
     * Move folder
     * 
     * @param request Request. {@link MoveFolderRequest}
     */
    public void moveFolder(MoveFolderRequest request) {
        if (request.srcPath == null) {
            throw new ApiException(400, 'Missing required parameter srcPath when calling moveFolder');
        }
        if (request.destPath == null) {
            throw new ApiException(400, 'Missing required parameter destPath when calling moveFolder');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/folder/move/' + EncodingUtil.urlEncode(request.srcPath, 'UTF-8');
        resourcePath += '?destPath=' + EncodingUtil.urlEncode(request.destPath, 'UTF-8');
        if (request.srcStorageName != null) {
            resourcePath += '&srcStorageName=' + EncodingUtil.urlEncode(request.srcStorageName, 'UTF-8');
        }
        if (request.destStorageName != null) {
            resourcePath += '&destStorageName=' + EncodingUtil.urlEncode(request.destStorageName, 'UTF-8');
        }

        this.apiInvoker.invokeApi(resourcePath, 'PUT', null, null, null, null);
    }
}
