// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="DeleteFolderRequest.cls">
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
 * Request model for {@link FolderApi#deleteFolder} operation.
 */
public with sharing class DeleteFolderRequest {
    
    /**
     * Folder path e.g. '/folder'
     */
    public String path { get; set; }

    /**
     * Storage name
     */
    public String storageName { get; set; }

    /**
     * Enable to delete folders, subfolders, and files
     */
    public Boolean recursive { get; set; }

    /**
     * Initializes a new instance of the DeleteFolderRequest class.
     */
    public DeleteFolderRequest() {
    }

    /**
     * Initializes a new instance of the DeleteFolderRequest class.
     * 
     * @param path Folder path e.g. '/folder'
     * @param storageName Storage name
     * @param recursive Enable to delete folders, subfolders, and files
     */
    public DeleteFolderRequest(String path, String storageName, Boolean recursive) {
        this.path = path;
        this.storageName = storageName;
        this.recursive = recursive;
    }
}
