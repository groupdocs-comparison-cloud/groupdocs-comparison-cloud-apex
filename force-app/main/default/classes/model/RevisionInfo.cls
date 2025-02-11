// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="RevisionInfo.cls">
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
 * Provides information about one revision.
 */
public with sharing class RevisionInfo {

    public RevisionInfo() {
    }

    public RevisionInfo(Integer id, ActionEnum action) {
        this.Id = id;
        this.action = action;
    }

    /**
     * Action (accept or reject). This field allows you to influence the display of the revision.
     */
    public enum ActionEnum {
        /**
         * Enum None for "None".
         */
        None,
        /**
         * Enum Accept for "Accept".
         */
        Accept,
        /**
         * Enum Reject for "Reject".
         */
        Reject
    }

    /**
     * RevisionHandler type, depending on the type the Action (accept or reject) logic changes.
     */
    public enum TypeEnum {
        /**
         * Enum Insertion for "Insertion".
         */
        Insertion,
        /**
         * Enum Deletion for "Deletion".
         */
        Deletion,
        /**
         * Enum FormatChange for "FormatChange".
         */
        FormatChange,
        /**
         * Enum StyleDefinitionChange for "StyleDefinitionChange".
         */
        StyleDefinitionChange,
        /**
         * Enum Moving for "Moving".
         */
        Moving
    }

    /**
     * Action (accept or reject). This field allows you to influence the display of the revision.
     */
    public ActionEnum action { get; set; }

    /**
     * RevisionHandler type, depending on the type the Action (accept or reject) logic changes.
     */
    public TypeEnum type { get; set; }

    /**
     * Id of the revision.
     */
    public Integer id { get; set; }

    /**
     * The text that is in revision.
     */
    public String text { get; set; }

    /**
     * Author.
     */
    public String author { get; set; }

    /**
     * Get a string representation of the object.
     * @return String representation of the object.
     */
    public override String toString() {
        return 'class RevisionInfo {\n' +
               '  Id: ' + this.id + '\n' +
               '  Action: ' + this.action + '\n' +
               '  Text: ' + this.text + '\n' +
               '  Author: ' + this.author + '\n' +
               '  Type: ' + this.type + '\n' +
               '}\n';
    }
}
