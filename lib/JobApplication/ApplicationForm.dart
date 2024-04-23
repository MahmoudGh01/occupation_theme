import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:dropbox_client/dropbox_client.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../job/job_gloabelclass/job_color.dart';
import '../job/job_gloabelclass/job_fontstyle.dart';
import '../job/job_gloabelclass/job_icons.dart';
import '../job/job_pages/job_theme/job_themecontroller.dart';
import '../models/job_model.dart';
import '../models/user.dart';
import '../providers/userprovider.dart';
import '../services/jobApplicationsController.dart';
import '../utils/custom_textfield.dart';
import '../utils/globalColors.dart';

class ApplicationForm extends StatefulWidget {
  final JobModel job; // Add jobId as a final variable
  final User user;
  // Modify constructor to accept jobId
  ApplicationForm(this.job,this.user, {Key? key}) : super(key: key);

  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   TextEditingController _firstNameController = TextEditingController();
   TextEditingController _lastNameController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
  dynamic size;
  final themedata = Get.put(JobThemecontroler());

  double height = 0.00;
  double width = 0.00;
  int _currentStep = 0;
  String? cvFilePath;
  String? cvFilePath2;

  String? motivationalLetter;
  double? fitScore;
  late JobApplicationController _controller;

  @override
  void initState() {
    super.initState();
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var user = userProvider.user; // This is the User model instance from your provider.

    _firstNameController = TextEditingController(text: user.name);
    _lastNameController = TextEditingController(text: user.lastname);
    _emailController = TextEditingController(text: user.email);

    _controller = JobApplicationController(
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        emailController: _emailController,
        cvFilePath: cvFilePath,
        motivationalLetter: motivationalLetter);

    _controller.applyForJob(context,widget.job,(fitScore) {
      print("Form :${widget.job}");
      setState(() {
        this.fitScore = fitScore;
      });
    });
  }

  Future<void> requestStoragePermission() async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Permission granted, proceed with file picking
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'doc', 'docx'],
        );
        if (result != null) {
          setState(() {
            cvFilePath = result.files.single.path!;
          });
        }
      } catch (e) {
        print('File picking error: $e');
        // Handle file picking error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('File Picking Error'),
            content: const Text('An error occurred while picking the file.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    } else {
      // Permission denied, handle accordingly
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Permission Denied'),
          content: const Text('Storage permission is required to pick a file.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(JobPngimage.logo,height: height/36,),
        ),
        title: Text("Application Form".tr,style: urbanistBold.copyWith(fontSize: 22 )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(JobPngimage.more,height: height/36,color: themedata.isdark?JobColor.white:JobColor.black,),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Text(
            fitScore != null
                ? 'Fit Score: ${fitScore!.toStringAsFixed(2)}%'
                : 'Fit Score: N/A',
            style: const TextStyle(
              fontSize: 18, color: GlobalColors.secondaryColor,
              fontWeight:
                  FontWeight.bold, // Add this line to make the text bold
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stepper(
                    currentStep: _currentStep,
                    connectorColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return GlobalColors.secondaryColor;
                      },
                    ),
                    onStepTapped: (int index) {
                      setState(() {
                        _currentStep = index;
                      });
                    },
                    steps: [
                      Step(
                        title: const Text(
                          'Personal Information',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        isActive: _currentStep == 0,
                        state: _currentStep == 0
                            ? StepState.editing
                            : StepState.indexed,
                        content: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              TextFormField(

                                controller: _firstNameController,
                                style: urbanistSemiBold.copyWith(fontSize: 16,),
                                decoration: InputDecoration(
                                  hintStyle: urbanistRegular.copyWith(fontSize: 16,),
                                  hintText: "Name".tr,
                                  fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                                  filled: true,
                                  prefixIcon:Icon(Icons.person,size: height/46,),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide.none
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(color: JobColor.appcolor)
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),

                              TextFormField(

                                controller: _emailController,
                                style: urbanistSemiBold.copyWith(fontSize: 16,),
                                decoration: InputDecoration(
                                  hintStyle: urbanistRegular.copyWith(fontSize: 16,),
                                  hintText: "Name".tr,
                                  fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                                  filled: true,
                                  prefixIcon:Icon(Icons.person,size: height/46,),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide.none
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(color: JobColor.appcolor)
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                      ),
                      Step(
                        title: const Text(
                          'Upload Your CV',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        isActive: _currentStep == 1,
                        state: _currentStep == 1
                            ? StepState.editing
                            : StepState.indexed,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        GlobalColors.secondaryColor),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () async {
                                try {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['pdf', 'doc', 'docx'],
                                  );
                                  print('FilePickerResult: $result');
                                  if (result != null) {
                                    setState(() {
                                      cvFilePath = result.files.single.path!;
                                      cvFilePath2 = result.files.single.name!;
                                      print('_cvFilePath: $cvFilePath');
                                    });
                                  }
                                } catch (e) {
                                  print('File picking error: $e');
                                }

                                await requestStoragePermission(); // Call the function here

                                try {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['pdf', 'doc', 'docx'],
                                  );
                                  print('FilePickerResult: $result');
                                  if (result != null) {
                                    setState(() {
                                      cvFilePath = result.files.single.path!;
                                      print('_cvFilePath: $cvFilePath');
                                    });
                                  }
                                } catch (e) {
                                  print('File picking error: $e');
                                }
                              },
                              child: const Text('Choose CV File'),
                            ),
                            if (cvFilePath != null)
                              Row(
                                children: [
                                  const Icon(Icons.file_present),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Selected CV: $cvFilePath',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Step(
                        title: const Text(
                          'Cover Letter',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        isActive: _currentStep == 2,
                        state: _currentStep == 2
                            ? StepState.editing
                            : StepState.indexed,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FutureBuilder<String>(
                              future:
                                  _controller.generateCoverLetter(widget.job),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: GlobalColors.secondaryColor,
                                    )),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  motivationalLetter = snapshot.data;
                                  return Text(snapshot.data ?? '');
                                }
                              },
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        GlobalColors.secondaryColor),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () {
                                if ( //_cvFilePath != null &&
                                    motivationalLetter != null) {
                                  _controller.saveAsPDF(
                                      motivationalLetter!, context);
                                  _currentStep++;
                                  setState(() {});
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text(
                                          'Please Upload a Cover letter  file first.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: const Text('Confirm and Save as PDF'),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        title: const Text(
                          'Last Step before submission',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        isActive: _currentStep == 3,
                        state: _currentStep == 3
                            ? StepState.editing
                            : StepState.indexed,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('First Name: ${_firstNameController.text}'),
                            Text('Last Name: ${_lastNameController.text}'),
                            Text('Email: ${_emailController.text}'),
                            if (cvFilePath != null)
                              Text('CV File: $cvFilePath'),
                            if (motivationalLetter != null)
                              Text('Cover Letter: $motivationalLetter'),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        GlobalColors.secondaryColor),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () async {
                                if (cvFilePath != null) {
                                  _controller = JobApplicationController(
                                    firstNameController:
                                        TextEditingController(),
                                    lastNameController: TextEditingController(),
                                    emailController: TextEditingController(),
                                    cvFilePath: cvFilePath2,
                                    motivationalLetter: motivationalLetter,
                                  );

                                  await _controller.postulate(widget.job,context);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text(
                                          'Please upload a cover letter and choose a CV file.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: const Text('Confirm'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
