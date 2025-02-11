// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="Settings.cls">
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
 * Defines comparison process additional settings.
 */
public with sharing class Settings {

    /**
     * Enum for comparison details level.
     */
    public enum DetailsLevelEnum {
        Low,
        Middle,
        High
    }

    /**
     * Enum for type of metadata to clone.
     */
    public enum CloneMetadataEnum {
        DefaultValue,
        Source,
        Target,
        FileAuthor
    }

    /**
     * Enum for type of password saving.
     */
    public enum PasswordSaveOptionEnum {
        None,
        Source,
        Target,
        User
    }

    /**
     * Enum for result document paper size.
     */
    public enum PaperSizeEnum {
        DefaultValue,
        A0,
        A1,
        A2,
        A3,
        A4,
        A5,
        A6,
        A7,
        A8
    }

    // Class properties
    /**
     * Gets or sets the comparison details level.
     */
    public DetailsLevelEnum DetailsLevel { get; set; }

    /**
     * Gets or sets type of metadata to clone.
     */
    public /*CloneMetadataEnum*/ Integer CloneMetadata { get; set; }

    /**
     * Gets or sets type of password saving.
     */
    public /*PasswordSaveOptionEnum*/ Integer PasswordSaveOption { get; set; }

    /**
     * Gets or sets the result document paper size.
     */
    public /*PaperSizeEnum*/ Integer PaperSize { get; set; }

    /**
     * Indicates whether to add summary page to resultant document or not.
     */
    public Boolean GenerateSummaryPage { get; set; }

    /**
     * Indicates whether to show deleted components in resultant document or not.
     */
    public Boolean ShowDeletedContent { get; set; }

    /**
     * Indicates whether to show inserted components in resultant document or not.
     */
    public Boolean ShowInsertedContent { get; set; }

    /**
     * Indicates whether to detect style changes or not.
     */
    public Boolean StyleChangeDetection { get; set; }

    /**
     * Style for inserted components.
     */
    public ItemsStyle InsertedItemsStyle { get; set; }

    /**
     * Style for deleted components.
     */
    public ItemsStyle DeletedItemsStyle { get; set; }

    /**
     * Style for components with changed style.
     */
    public ItemsStyle ChangedItemsStyle { get; set; }

    /**
     * An array of delimiters to split text into words.
     */
    public List<String> WordsSeparatorChars { get; set; }

    /**
     * Indicates whether to use frames for shapes in Word Processing and for rectangles in Image documents.
     */
    public Boolean UseFramesForDelInsElements { get; set; }

    /**
     * Indicates whether to calculate coordinates for changed components.
     */
    public Boolean CalculateComponentCoordinates { get; set; }

    /**
     * Indicates whether to mark changed content.
     */
    public Boolean MarkChangedContent { get; set; }

    /**
     * Indicates whether to mark the children of the deleted or inserted element as deleted or inserted.
     */
    public Boolean MarkNestedContent { get; set; }

    /**
     * Gets or sets user metadata.
     */
    public Metadata MetaData { get; set; }

    /**
     * Gets or sets user password to resultant document.
     */
    public String Password { get; set; }

    /**
     * Gets or sets master for Diagram document.
     */
    public DiagramMasterSetting DiagramMasterSetting { get; set; }

    /**
     * Gets or sets original document size when picture is compared with other different formats.
     */
    public Size OriginalSize { get; set; }

    /**
     * Control to turn on comparison of header/footer contents.
     */
    public Boolean HeaderFootersComparison { get; set; }

    /**
     * Gets or sets a sensitivity of comparison. Default is 75.
     */
    public Integer SensitivityOfComparison { get; set; }

    /**
     * Constructor.
     */
    public Settings() {
        WordsSeparatorChars = new List<String>();
    }

    /**
     * Get a string representation of the object.
     * @return String representation of the object.
     */
    public override String toString() {
        return 'class Settings {\n' +
               '  GenerateSummaryPage: ' + GenerateSummaryPage + '\n' +
               '  ShowDeletedContent: ' + ShowDeletedContent + '\n' +
               '  ShowInsertedContent: ' + ShowInsertedContent + '\n' +
               '  StyleChangeDetection: ' + StyleChangeDetection + '\n' +
               '  InsertedItemsStyle: ' + InsertedItemsStyle + '\n' +
               '  DeletedItemsStyle: ' + DeletedItemsStyle + '\n' +
               '  ChangedItemsStyle: ' + ChangedItemsStyle + '\n' +
               '  WordsSeparatorChars: ' + WordsSeparatorChars + '\n' +
               '  DetailsLevel: ' + DetailsLevel + '\n' +
               '  UseFramesForDelInsElements: ' + UseFramesForDelInsElements + '\n' +
               '  CalculateComponentCoordinates: ' + CalculateComponentCoordinates + '\n' +
               '  MarkChangedContent: ' + MarkChangedContent + '\n' +
               '  MarkNestedContent: ' + MarkNestedContent + '\n' +
               '  CloneMetadata: ' + CloneMetadata + '\n' +
               '  MetaData: ' + MetaData + '\n' +
               '  PasswordSaveOption: ' + PasswordSaveOption + '\n' +
               '  Password: ' + Password + '\n' +
               '  DiagramMasterSetting: ' + DiagramMasterSetting + '\n' +
               '  OriginalSize: ' + OriginalSize + '\n' +
               '  HeaderFootersComparison: ' + HeaderFootersComparison + '\n' +
               '  PaperSize: ' + PaperSize + '\n' +
               '  SensitivityOfComparison: ' + SensitivityOfComparison + '\n' +
               '}\n';
    }
}
