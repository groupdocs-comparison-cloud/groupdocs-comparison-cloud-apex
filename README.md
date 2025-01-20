# GroupDocs.Comparison Cloud SDK for Apex
This repository contains GroupDocs.Comparison Cloud SDK for Apex source code. This SDK allows you to work with GroupDocs.Comparison Cloud REST APIs in your Salesforce projects.

## How to use the SDK?
The complete source code is available in this repository folder, you can either directly use it in your project. For more details, please visit our [documentation website](https://docs.groupdocs.cloud/).

## Prerequisites

+ Register at [Dashboard](https://dashboard.groupdocs.cloud) and obtain your API Keys on the Applications tab;
+ Check out this repository and perform login into your Salesforce organization, using SFDX (sfdx auth:web:login -r https://login.salesforce.com);
+ Push classes into org using command: "sfdx force:source:push";
+ Upload necessary content files using Salesforce dashboard at "Files" page;
+ Add GroupDocs Cloud API enpoint at "Remote Site Settings" page, when adding new site, set "Remote Site URL" field to "https://api.groupdocs.cloud";
+ Write a code that uses GroupDocs.Comparison Cloud SDK, see example below, and execute in the developer console or use in your custom classes;

## Getting Started

```apex

// Create config and API instances
Configuration config = new Configuration('YOUR_API_KEY', 'YOUR_API_SECRET');
FileApi fileApi = new FileApi(config);
CompareApi compareApi = new CompareApi(config);
    
// Upload files for comparison to cloud storage
List<ContentVersion> contentVersions = [SELECT Id, Title, VersionData FROM ContentVersion WHERE Title  = 'source.docx' LIMIT 1];
fileApi.uploadFile(new UploadFileRequest('source.docx', contentVersions[0].VersionData, null));

List<ContentVersion> contentVersions = [SELECT Id, Title, VersionData FROM ContentVersion WHERE Title  = 'target.docx' LIMIT 1];
fileApi.uploadFile(new UploadFileRequest('target.docx', contentVersions[0].VersionData, null));

// Get comparison changes
ComparisonOptions options = new ComparisonOptions();
options.SourceFile = new FileInfo();
options.SourceFile.FilePath='source.docx';
options.TargetFiles = new List<FileInfo>();
options.TargetFiles.add(new FileInfo());
options.TargetFiles[0].FilePath = 'target.docx';
options.Settings = new Settings();
options.Settings.GenerateSummaryPage = true;
options.Settings.ShowDeletedContent = true;
options.Settings.StyleChangeDetection = true;

List<ChangeInfo> response = compareApi.postChanges(new PostChangesRequest(options));
System.debug('The num of changes: ' + response.size());

```

## Licensing
All GroupDocs.Comparison Cloud SDKs are licensed under [MIT License](LICENSE).

## Resources
+ [**Website**](https://www.groupdocs.cloud)
+ [**Product Home**](https://products.groupdocs.cloud/comparison)
+ [**Documentation**](https://docs.groupdocs.cloud/comparison)
+ [**Free Support Forum**](https://forum.groupdocs.cloud/c/comparison)
+ [**Blog**](https://blog.groupdocs.cloud/category/comparison)

## Contact Us
Your feedback is very important to us. Please feel free to contact us using our [Support Forums](https://forum.groupdocs.cloud/c/comparison).