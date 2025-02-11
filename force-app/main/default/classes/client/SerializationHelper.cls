// --------------------------------------------------------------------------------------------------------------------
// <copyright company="Aspose Pty Ltd" file="SerializationHelper.cls">
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
 * A helper class for serializing and deserializing objects to and from JSON format.
 */
public with sharing class SerializationHelper {

    /** 
     * Serializes an object to its JSON representation.
     * 
     * @param obj The object to be serialized.
     * @return A JSON string representation of the object, or null if the object is null.
     * @throws ApiException if a serialization error occurs.
     */
    public static String serialize(Object obj) {
        try {
            if (obj != null) {
                return JSON.serialize(obj, true);
            } else {
                return null;
            }
        } catch (Exception e) {
            throw new ApiException(500, e.getMessage());
        }
    }

    /** 
     * Deserializes a JSON string into an object of the specified type.
     * 
     * @param myjson The JSON string to be deserialized.
     * @param type The type of the object to deserialize into.
     * @return An object of the specified type, or null if the input JSON is not valid.
     * @throws ApiException if a deserialization error occurs.
     */
    public static Object deserialize(String myjson, Type type) {
        try {
            if (myjson.startsWith('{') || myjson.startsWith('[')) {
                try {
                    return JSON.deserialize(myjson, type);
                } catch (Exception e) {
                    System.debug('deserialize exception ::: ' + e.getMessage());
                    return null;
                }
            }
            return null;
        } catch (Exception e) {
            throw new ApiException(500, e.getMessage());
        }
    }
}
