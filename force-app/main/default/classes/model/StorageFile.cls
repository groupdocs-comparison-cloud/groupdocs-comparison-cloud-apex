// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="StorageFile.cls">
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
 * File or folder information.
 */
public virtual with sharing class StorageFile {
    /**
     * File or folder name.
     */
    public String Name { get; set; }

    /**
     * True if it is a folder.
     */
    public Boolean IsFolder { get; set; }

    /**
     * File or folder last modified DateTime.
     */
    public DateTime ModifiedDate { get; set; }

    /**
     * File or folder size.
     */
    public Long Size { get; set; }

    /**
     * File or folder path.
     */
    public String Path { get; set; }

    /**
     * Get a string representation of the object.
     * @return String representation of the object.
     */
    public override virtual String toString() {
        String result = 'class StorageFile {\n';
        result += '  Name: ' + this.Name + '\n';
        result += '  IsFolder: ' + this.IsFolder + '\n';
        result += '  ModifiedDate: ' + this.ModifiedDate + '\n';
        result += '  Size: ' + this.Size + '\n';
        result += '  Path: ' + this.Path + '\n';
        result += '}\n';
        return result;
    }
}
