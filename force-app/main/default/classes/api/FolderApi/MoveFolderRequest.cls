// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="MoveFolderRequest.cls">
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
 * Request model for {@link FolderApi#moveFolder} operation.
 */
public with sharing class MoveFolderRequest {
    
    /**
     * Folder path to move e.g. '/folder'
     */
    public String srcPath { get; set; }

    /**
     * Destination folder path to move to e.g. '/dst'
     */
    public String destPath { get; set; }

    /**
     * Source storage name
     */
    public String srcStorageName { get; set; }

    /**
     * Destination storage name
     */
    public String destStorageName { get; set; }

    /**
     * Initializes a new instance of the MoveFolderRequest class.
     */
    public MoveFolderRequest() {
    }

    /**
     * Initializes a new instance of the MoveFolderRequest class.
     * 
     * @param srcPath Folder path to move e.g. '/folder'
     * @param destPath Destination folder path to move to e.g. '/dst'
     * @param srcStorageName Source storage name
     * @param destStorageName Destination storage name
     */
    public MoveFolderRequest(String srcPath, String destPath, String srcStorageName, String destStorageName) {
        this.srcPath = srcPath;
        this.destPath = destPath;
        this.srcStorageName = srcStorageName;
        this.destStorageName = destStorageName;
    }
}
