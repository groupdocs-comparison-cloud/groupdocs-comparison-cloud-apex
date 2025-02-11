// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="PreviewOptions.cls">
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
 * Defines preview options.
 */
public with sharing virtual class PreviewOptions {

    /** 
     * Enum for Format.
     */
    public enum FormatEnum {
        Jpeg,
        Png,
        Bmp
    }

    /** 
     * Preview image format.
     */
    public FormatEnum Format;

    /** 
     * Input file info.
     */
    public FileInfo FileInfo;

    /** 
     * Path to folder with preview results.
     */
    public String OutputFolder;

    /** 
     * Preview width.
     */
    public Integer Width;

    /** 
     * Preview height.
     */
    public Integer Height;

    /** 
     * Page numbers that will be previewed.
     */
    public List<Integer> PageNumbers;

    /** 
     * Returns the string representation of the object.
     * 
     * @return String presentation of the object.
     */
    public override virtual String toString() {
        return 'class PreviewOptions {\n' +
               '  FileInfo: ' + this.FileInfo + '\n' +
               '  Format: ' + this.Format + '\n' +
               '  OutputFolder: ' + this.OutputFolder + '\n' +
               '  Width: ' + this.Width + '\n' +
               '  Height: ' + this.Height + '\n' +
               '  PageNumbers: ' + this.PageNumbers + '\n' +
               '}\n';
    }
}