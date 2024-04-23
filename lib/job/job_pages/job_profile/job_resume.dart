import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../services/FileManager.dart';
import '../../../utils/constants.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JobResume extends StatefulWidget {
  const JobResume({Key? key}) : super(key: key);

  @override
  State<JobResume> createState() => _JobResumeState();
}

class _JobResumeState extends State<JobResume> {
  late Future<List<String>> filesList;
  FileManager fileManager = FileManager();



  @override
  void initState() {
    super.initState();
    filesList = fetchFilesList();
  }



  Future<String> download(BuildContext context, String filename) {
    return fileManager.downloadFile(
      context: context,
      filename: filename,
    );
  }

  Future<void> _uploadResume() async {
    // Show a dialog or perform other UI updates before uploading
    // showDialog or other UI code...


    // Call the file manager to upload the resume
    await fileManager.uploadFileToBackend();
  }

  Future<List<String>> fetchFilesList() async {
    final response = await http.get(Uri.parse('${Constants.uri}/files'));

    if (response.statusCode == 200) {
      List<dynamic> files = jsonDecode(response.body);
      return files.cast<String>();
    } else {
      throw Exception('Failed to load files');
    }
  }

  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("CV_Resume".tr, style: urbanistBold.copyWith(fontSize: 22)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload CV/Resume".tr,
                  style: urbanistMedium.copyWith(fontSize: 16)),
              SizedBox(
                height: height / 66,
              ),
              GestureDetector(
                onTap: _uploadResume,
                child: Container(
                  width: width / 1,
                  height: height / 6,
                  decoration: BoxDecoration(
                      color: themedata.isdark
                          ? JobColor.lightblack
                          : JobColor.appgray,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        JobPngimage.uploadfile,
                        height: height / 26,
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text("Browse_File".tr,
                          style: urbanistSemiBold.copyWith(
                              fontSize: 14, color: JobColor.textgray)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 36,
              ),
              FutureBuilder<List<String>>(
                future: filesList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (snapshot.data!.isEmpty) {
                      return Center(child: Text('No files available.'));
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            // Implement file tap functionality
                            String filename = snapshot.data![index];
                            String filePath = await download(context, filename);
                            openPdf(context, filePath);
                          },
                          child: Container(
                            width: width / 1,
                            decoration: BoxDecoration(
                                color: const Color(0x1AF75555),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 36, vertical: height / 66),
                              child: Row(
                                children: [
                                  Image.asset(
                                    JobPngimage.pdf,
                                    height: height / 15,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  SizedBox(
                                    width: width / 36,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data![index],
                                          style: urbanistSemiBold.copyWith(
                                            fontSize: 16,
                                          )),
                                      Text("825 Kb".tr,
                                          style: urbanistMedium.copyWith(
                                              fontSize: 12,
                                              color: JobColor.textgray)),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.close,
                                      size: 20, color: JobColor.red),
                                  SizedBox(
                                    width: width / 36,
                                  ),
                                ],
                              ),
                            ),

                          ),

                        );

                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void openPdf(BuildContext context, String filePath) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => PdfViewPage(path: filePath),
    ),
  );
}

class PdfViewPage extends StatefulWidget {
  final String path;

  PdfViewPage({required this.path});

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: widget.path,
      ),
    );
  }
}
