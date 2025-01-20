// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="ChangeInfo.cls">
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
 * ChangeInfo Object fields.
 */
public class ChangeInfo {

    /** 
     * Default constructor for ChangeInfo.
     */
    public ChangeInfo() {}

    /** 
     * Constructor for ChangeInfo.
     *
     * @param id The ID of the change.
     * @param comparisonAction The action to take with this change (accept or reject).
     */
    public ChangeInfo(Integer id, ComparisonActionEnum comparisonAction) {
        this.Id = id;
        this.ComparisonAction = comparisonAction.ordinal();
    }

    /** 
     * Action (accept or reject). This field shows what to do with this change.
     */
    public enum ComparisonActionEnum {
        None,
        Accept,
        Reject
    }

    /** 
     * Type of change (Inserted, Deleted, or StyleChanged).
     */
    public enum TypeEnum {
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
     * Action (accept or reject). This field shows what to do with this change.
     */
    public /*ComparisonActionEnum*/ Integer ComparisonAction { get; set; }

    /** 
     * Type of change (Inserted, Deleted, or StyleChanged).
     */
    public /*TypeEnum*/ Integer Type { get; set; }

    /** 
     * ID of the change.
     */
    public Integer Id { get; set; }

    /** 
     * Text of the changed element.
     */
    public String Text { get; set; }

    /** 
     * Changed text of the target document.
     */
    public String TargetText { get; set; }

    /** 
     * Array of authors who made this change (used for multi-comparison).
     */
    public List<String> Authors { get; set; }

    /** 
     * Array of style changes.
     */
    public List<StyleChangeInfo> StyleChangeInfo { get; set; }

    /** 
     * Page where the current change is placed.
     */
    public PageInfo PageInfo { get; set; }

    /** 
     * Coordinates of the changed element.
     */
    public Rectangle Box { get; set; }

    /** 
     * Returns the string representation of the object.
     * 
     * @return String presentation of the object.
     */
    public override String toString() {
        return 'class ChangeInfo {\n' +
                '  Id: ' + this.Id + '\n' +
                '  ComparisonAction: ' + this.ComparisonAction + '\n' +
                '  Type: ' + this.Type + '\n' +
                '  Text: ' + this.Text + '\n' +
                '  TargetText: ' + this.TargetText + '\n' +
                '  Authors: ' + this.Authors + '\n' +
                '  StyleChangeInfo: ' + this.StyleChangeInfo + '\n' +
                '  PageInfo: ' + this.PageInfo + '\n' +
                '  Box: ' + this.Box + '\n' +
                '}';
    }
}
