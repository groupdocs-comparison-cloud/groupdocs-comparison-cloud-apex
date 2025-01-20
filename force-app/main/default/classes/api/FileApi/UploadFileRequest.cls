// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="UploadFileRequest.cls">
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
 * Request model for {@link FileApi#uploadFile} operation.
 */
public with sharing class UploadFileRequest {
    
    /**
     * Path where to upload including filename and extension e.g. /file.ext or /Folder 1/file.ext.
     * If the content is multipart and path does not contain the file name, it tries to get it from filename parameter from Content-Disposition header.
     */
    public String path { get; set; }

    /**
     * File to upload, represented as a Blob in Apex.
     */
    public Blob file { get; set; }

    /**
     * Storage name
     */
    public String storageName { get; set; }

    /**
     * Initializes a new instance of the UploadFileRequest class.
     */
    public UploadFileRequest() {
    }

    /**
     * Initializes a new instance of the UploadFileRequest class.
     * 
     * @param path Path where to upload including filename and extension e.g. /file.ext or /Folder 1/file.ext.
     * @param file File to upload, represented as a Blob in Apex.
     * @param storageName Storage name
     */
    public UploadFileRequest(String path, Blob file, String storageName) {
        this.path = path;
        this.file = file;
        this.storageName = storageName;
    }
}
