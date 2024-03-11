import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/constants.dart';
import '../utils/utils.dart';

import 'package:http/http.dart' as http;

class FileManager {
  Future<String> downloadFile({
    required BuildContext context,
    required String filename,
  }) async {

      Uri uri = Uri.parse('${Constants.uri}/file?filename=$filename');
      var res = await http.get(uri);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      await file.writeAsBytes(res.bodyBytes);
      return file.path;

  }
  Future<void> uploadFileToBackend() async {
    // Step 1: Let the user pick a file
    FilePickerResult? result = await pickFile();

    if (result != null) {
      // Step 2: Get the file from the result
      PlatformFile file = result.files.first;
      print('File Picked :$file.name');

      // Step 3: Upload the file to the backend server
      String uploadUrl = '${Constants.uri}/upload';
      print('URI: $uploadUrl');

      try {
        var response = await uploadFile(uploadUrl, file);

        if (response?.statusCode == 200) {
          print('File uploaded successfully');
        } else {
          print('Failed to upload file: ${response?.statusCode}');
        }
      } catch (e) {
        print('Error uploading file: $e');
      }
    } else {
      // User canceled the picker
      print('No file selected');
    }
  }

  Future<FilePickerResult?> pickFile() async {
    return await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'mp4'], // Allow multiple file types or remove to allow all types
    );
  }
  Future<http.Response?> uploadFile(String url, PlatformFile file) async {
    try {
      // Ensure the file path is not null
      final filePath = file.path;
      if (filePath == null) {
        print('File path is null');
        return null;
      }

      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add the file to the request using the non-null file path
      request.files.add(await http.MultipartFile.fromPath(
        'resume', // The field name expected by the server for the file
        filePath, // Use the non-null file path
        filename: file.name, // Optionally include the filename
      ));

      var response = await request.send();

      // Handle the response from the server
      if (response.statusCode == 200) {
        print("File uploaded successfully");
        // Convert the response to a more manageable format
        return await http.Response.fromStream(response);
      } else {
        print('Failed to upload file: Server responded with status code ${response.statusCode}');
        return await http.Response.fromStream(response);
      }
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }



}
