// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="DownloadFileRequest.cls">
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
 * Request model for {@link FileApi#downloadFile} operation.
 */
public with sharing class DownloadFileRequest  
{
    /**
     * Initializes a new instance of the DownloadFileRequest class.
     */
    public DownloadFileRequest()
    {
    }

    /**
     * Initializes a new instance of the DownloadFileRequest class.
     * 
     * @param path File path e.g. '/folder/file.ext'
     * @param storageName Storage name
     * @param versionId File version ID to download
     */
    public DownloadFileRequest(String path, String storageName, String versionId)             
    {
        this.path = path;
        this.storageName = storageName;
        this.versionId = versionId;
    }
    
    /**
     * File path e.g. '/folder/file.ext'
     */
    public String path { get; set; }
    
    /**
     * Storage name
     */
    public String storageName { get; set; }
    
    /**
     * File version ID to download
     */
    public String versionId { get; set; }
}
