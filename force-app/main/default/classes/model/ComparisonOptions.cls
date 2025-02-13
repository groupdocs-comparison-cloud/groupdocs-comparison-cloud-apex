// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="ComparisonOptions.cls">
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
 * Defines comparison options.
 */
public with sharing virtual class ComparisonOptions {

    /** 
     * Enum for ChangeType. Used only for Changes resource (/comparison/changes).
     */
    public enum ChangeTypeEnum {
        None,
        Modified,
        Inserted,
        Deleted,
        Added,
        NotModified,
        StyleChanged,
        Resized,
        Moved,
        MovedAndResized,
        ShiftedAndResized
    }

    /** 
     * Changes type. Used only for Changes resource (/comparison/changes).
     */
    public ChangeTypeEnum ChangeType;

    /** 
     * Information about the source file.
     */
    public FileInfo SourceFile;

    /** 
     * Information about target file(s).
     */
    public List<FileInfo> TargetFiles;

    /** 
     * Comparison settings.
     */
    public Settings Settings;

    /** 
     * Path to the resultant document (if not specified, the document will not be saved).
     */
    public String OutputPath;

    /** 
     * Returns the string representation of the object.
     * 
     * @return String presentation of the object.
     */
    public override virtual String toString() {
        return 'class ComparisonOptions {\n' +
               '  SourceFile: ' + this.SourceFile + '\n' +
               '  TargetFiles: ' + this.TargetFiles + '\n' +
               '  Settings: ' + this.Settings + '\n' +
               '  ChangeType: ' + this.ChangeType + '\n' +
               '  OutputPath: ' + this.OutputPath + '\n' +
               '}\n';
    }
}
