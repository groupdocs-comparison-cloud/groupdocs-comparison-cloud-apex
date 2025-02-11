// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="InfoResult.cls">
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
 * Represents document information.
 */
public with sharing class InfoResult {
    /**
     * Document format.
     */
    public String Format { get; set; }

    /**
     * Document file extension.
     */
    public String Extension { get; set; }

    /**
     * Document file size.
     */
    public Long Size { get; set; }

    /**
     * Pages count.
     */
    public Integer PageCount { get; set; }

    /**
     * Get a string representation of the object.
     * @return String representation of the object.
     */
    public override String toString() {
        String result = 'class InfoResult {\n';
        result += '  Format: ' + this.Format + '\n';
        result += '  Extension: ' + this.Extension + '\n';
        result += '  Size: ' + this.Size + '\n';
        result += '  PageCount: ' + this.PageCount + '\n';
        result += '}\n';
        return result;
    }
}
