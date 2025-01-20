// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="Error.cls">
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
// --------------------------------------------------------------------------------------------------------------------/** 
/** 
 * Represents an error object containing error details.
 */
public with sharing class Error {
    
    /** 
     * Code of the error.
     */
    public String code { get; set; }

    /** 
     * Message describing the error.
     */
    public String message { get; set; }

    /** 
     * Detailed description of the error.
     */
    public String description { get; set; }

    /** 
     * Inner error details, if any.
     */
    public ErrorDetails innerError { get; set; }

    /** 
     * Returns the string representation of the object.
     * 
     * @return String presentation of the object.
     */
    public override String toString() {
        return 'class Error {\n' +
               '  Code: ' + this.code + '\n' +
               '  Message: ' + this.message + '\n' +
               '  Description: ' + this.description + '\n' +
               '  InnerError: ' + this.innerError + '\n' +
               '}\n';
    }
}

