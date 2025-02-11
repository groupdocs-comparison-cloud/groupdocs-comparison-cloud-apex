// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="MoveFileRequest.cls">
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
 * Request model for {@link FileApi#moveFile} operation.
 */
public with sharing class MoveFileRequest  
{
    /**
     * Initializes a new instance of the MoveFileRequest class.
     */
    public MoveFileRequest()
    {
    }

    /**
     * Initializes a new instance of the MoveFileRequest class.
     * 
     * @param srcPath Source file path e.g. '/src.ext'
     * @param destPath Destination file path e.g. '/dest.ext'
     * @param srcStorageName Source storage name
     * @param destStorageName Destination storage name
     * @param versionId File version ID to move
     */
    public MoveFileRequest(String srcPath, String destPath, String srcStorageName, String destStorageName, String versionId)             
    {
        this.srcPath = srcPath;
        this.destPath = destPath;
        this.srcStorageName = srcStorageName;
        this.destStorageName = destStorageName;
        this.versionId = versionId;
    }
    
    /**
     * Source file path e.g. '/src.ext'
     */
    public String srcPath { get; set; }

    /**
     * Destination file path e.g. '/dest.ext'
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
     * File version ID to move
     */
    public String versionId { get; set; }
}
