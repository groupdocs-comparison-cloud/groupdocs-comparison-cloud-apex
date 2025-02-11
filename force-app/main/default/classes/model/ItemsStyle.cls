// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="ItemsStyle.cls">
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
 * ItemsStyle Object fields.
 */
public with sharing class ItemsStyle {
    /**
     * Font color for changed components.
     */
    public String FontColor { get; set; }

    /**
     * Highlight color for changed components.
     */
    public String HighlightColor { get; set; }

    /**
     * Start tag for changed components.
     */
    public String BeginSeparatorString { get; set; }

    /**
     * End tag for changed components.
     */
    public String EndSeparatorString { get; set; }

    /**
     * Bold style for changed components.
     */
    public Boolean Bold { get; set; }

    /**
     * Italic style for changed components.
     */
    public Boolean Italic { get; set; }

    /**
     * Strike through style for changed components.
     */
    public Boolean StrikeThrough { get; set; }

    /**
     * Underline style for changed components.
     */
    public Boolean Underline { get; set; }

    /**
     * Get a string representation of the object.
     * @return String representation of the object.
     */
    public override String toString() {
        String result = 'class ItemsStyle {\n';
        result += '  FontColor: ' + FontColor + '\n';
        result += '  HighlightColor: ' + HighlightColor + '\n';
        result += '  BeginSeparatorString: ' + BeginSeparatorString + '\n';
        result += '  EndSeparatorString: ' + EndSeparatorString + '\n';
        result += '  Bold: ' + Bold + '\n';
        result += '  Italic: ' + Italic + '\n';
        result += '  StrikeThrough: ' + StrikeThrough + '\n';
        result += '  Underline: ' + Underline + '\n';
        result += '}\n';
        return result;
    }
}
