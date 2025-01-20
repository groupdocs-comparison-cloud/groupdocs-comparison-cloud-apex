// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="FileInfoClient.cls">
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
 * Represents file information.
 */
public with sharing class FileInfoClient {

    /** 
     * The name of the file. 
     */
    public String Name;

    /** 
     * The MIME type of the file. 
     */
    public String MimeType;

    /** 
     * The content of the file as a Blob. 
     */
    public Blob FileContent;

    /** 
     * Constructor to initialize FileInfo with parameters. 
     * 
     * @param name The name of the file.
     * @param mimeType The MIME type of the file.
     * @param fileContent The content of the file as a Blob.
     */
    public FileInfoClient(String name, String mimeType, Blob fileContent) {
        this.name = name;
        this.mimeType = mimeType;
        this.fileContent = fileContent;
    }

    /** 
     * Default constructor. 
     */
    public FileInfoClient() {
        
    }
}
