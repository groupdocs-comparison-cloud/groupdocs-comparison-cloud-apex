// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="FileApi.cls">
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
public with sharing class FileApi {
    private ApiInvoker apiInvoker;
    private Configuration configuration;

    /**
     * Initializes a new instance of the FileApi class.
     * 
     * @param appSid Application identifier (App SID)
     * @param appKey Application private key (App Key)
     */
    public FileApi(String appSid, String appKey) {
        this.configuration = new Configuration(appSid, appKey);
        initializeApiInvoker();
    }

    /**
     * Initializes a new instance of the FileApi class.
     * 
     * @param configuration Configuration settings
     */
    public FileApi(Configuration configuration) {
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
     * Copy file
     * 
     * @param request Request. {@link CopyFileRequest}
     */
    public void copyFile(CopyFileRequest request) {
        if (request.srcPath == null) {
            throw new ApiException(400, 'Missing required parameter srcPath when calling copyFile');
        }
        if (request.destPath == null) {
            throw new ApiException(400, 'Missing required parameter destPath when calling copyFile');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/file/copy/' + EncodingUtil.urlEncode(request.srcPath, 'UTF-8');
        resourcePath += '?destPath=' + EncodingUtil.urlEncode(request.destPath, 'UTF-8');
        if (request.srcStorageName != null) {
            resourcePath += '&srcStorageName=' + EncodingUtil.urlEncode(request.srcStorageName, 'UTF-8');
        }
        if (request.destStorageName != null) {
            resourcePath += '&destStorageName=' + EncodingUtil.urlEncode(request.destStorageName, 'UTF-8');
        }
        if (request.versionId != null) {
            resourcePath += '&versionId=' + EncodingUtil.urlEncode(request.versionId, 'UTF-8');
        }

        this.apiInvoker.invokeApi(resourcePath, 'PUT', null, null, null, null);
    }

    /**
     * Delete file
     * 
     * @param request Request. {@link DeleteFileRequest}
     */
    public void deleteFile(DeleteFileRequest request) {
        if (request.path == null) {
            throw new ApiException(400, 'Missing required parameter path when calling deleteFile');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/file/' + EncodingUtil.urlEncode(request.path, 'UTF-8');
        if (request.storageName != null) {
            resourcePath += '?storageName=' + EncodingUtil.urlEncode(request.storageName, 'UTF-8');
        }
        if (request.versionId != null) {
            resourcePath += '&versionId=' + EncodingUtil.urlEncode(request.versionId, 'UTF-8');
        }

        this.apiInvoker.invokeApi(resourcePath, 'DELETE', null, null, null, null);
    }

    /**
     * Download file
     * 
     * @param request Request. {@link DownloadFileRequest}
     * @return {@link Blob}
     */
    public Blob downloadFile(DownloadFileRequest request) {
        if (request.path == null) {
            throw new ApiException(400, 'Missing required parameter path when calling downloadFile');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/file/' + EncodingUtil.urlEncode(request.path, 'UTF-8');
        if (request.storageName != null) {
            resourcePath += '?storageName=' + EncodingUtil.urlEncode(request.storageName, 'UTF-8');
        }
        if (request.versionId != null) {
            resourcePath += '&versionId=' + EncodingUtil.urlEncode(request.versionId, 'UTF-8');
        }

        return this.apiInvoker.invokeBinaryApi(resourcePath, 'GET', null, null, null, null);
    }

    /**
     * Move file
     * 
     * @param request Request. {@link MoveFileRequest}
     */
    public void moveFile(MoveFileRequest request) {
        if (request.srcPath == null) {
            throw new ApiException(400, 'Missing required parameter srcPath when calling moveFile');
        }
        if (request.destPath == null) {
            throw new ApiException(400, 'Missing required parameter destPath when calling moveFile');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/file/move/' + EncodingUtil.urlEncode(request.srcPath, 'UTF-8');
        resourcePath += '?destPath=' + EncodingUtil.urlEncode(request.destPath, 'UTF-8');
        if (request.srcStorageName != null) {
            resourcePath += '&srcStorageName=' + EncodingUtil.urlEncode(request.srcStorageName, 'UTF-8');
        }
        if (request.destStorageName != null) {
            resourcePath += '&destStorageName=' + EncodingUtil.urlEncode(request.destStorageName, 'UTF-8');
        }
        if (request.versionId != null) {
            resourcePath += '&versionId=' + EncodingUtil.urlEncode(request.versionId, 'UTF-8');
        }

        this.apiInvoker.invokeApi(resourcePath, 'PUT', null, null, null, null);
    }

    /**
     * Upload file
     * 
     * @param request Request. {@link UploadFileRequest}
     * @return {@link FilesUploadResult}
     */
    public FilesUploadResult uploadFile(UploadFileRequest request) {
        if (request.path == null) {
            throw new ApiException(400, 'Missing required parameter path when calling uploadFile');
        }
        if (request.file == null) {
            throw new ApiException(400, 'Missing required parameter file when calling uploadFile');
        }

        String resourcePath = this.configuration.getServerUrl() + '/comparison/storage/file/' + EncodingUtil.urlEncode(request.path, 'UTF-8');
        if (request.storageName != null) {
            resourcePath += '?storageName=' + EncodingUtil.urlEncode(request.storageName, 'UTF-8');
        }

        String response = this.apiInvoker.invokeApi(resourcePath, 'PUT', null, null, new Map<String, FileInfoClient>{'file' => this.apiInvoker.ToFileInfo(request.File, 'File')}, null);
        if (response != null) {
            return (FilesUploadResult)SerializationHelper.Deserialize(response, FilesUploadResult.class);
        }

        return null;
    }
}
