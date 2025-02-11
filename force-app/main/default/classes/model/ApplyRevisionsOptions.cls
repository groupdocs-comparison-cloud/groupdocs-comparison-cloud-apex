// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="ApplyRevisionsOptions.cls">
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
 * Options for applying revisions to a document.
 */
public class ApplyRevisionsOptions {

    /** 
     * Information about the source file.
     */
    public FileInfo sourceFile { get; set; }

    /** 
     * Revisions to apply or reject.
     */
    public List<RevisionInfo> revisions { get; set; }

    /** 
     * Indicates whether to apply all revisions in the document.
     */
    public Boolean acceptAll { get; set; }

    /** 
     * Indicates whether to reject all revisions in the document.
     */
    public Boolean rejectAll { get; set; }

    /** 
     * Path to the resultant document (if not specified, the document will not be saved).
     */
    public String outputPath { get; set; }

    /** 
     * Returns the string representation of the object.
     * 
     * @return String presentation of the object.
     */
    public override String toString() {
        return 'class ApplyRevisionsOptions {\n' +
               '  SourceFile: ' + this.sourceFile + '\n' +
               '  Revisions: ' + this.revisions + '\n' +
               '  AcceptAll: ' + this.acceptAll + '\n' +
               '  RejectAll: ' + this.rejectAll + '\n' +
               '  OutputPath: ' + this.outputPath + '\n' +
               '}\n';
    }
}
