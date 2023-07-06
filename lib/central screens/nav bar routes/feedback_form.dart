// ignore_for_file: constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

//Credentials for AAT Feedback Form
const _feedback_credentials = r'''
{
  "type": "service_account",
  "project_id": "aat-app-feedback-backend",
  "private_key_id": "50d9fdd312541b4537bcbbe89241cb7ddd9b18ae",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCuNUyx96AHH1ZA\nDEjUdhR5WFLAYISpIX1J2BlDE/qvy8YSF7RNavuBny8GlIBFlcAnZSHjo0G346lm\nTiA57tXQYOCwVN8cebUeUF80lKgR1jfNRAp6/6n3VnWvfq05OYymEt18f9nPLHy1\nngAWGG6tYR75gso2Z8o9haQ+UDEV7KQaeRhQnt2qBDTlkKffEC/TSqS0FIxwJgbf\nrdraV5yyEJcahQMVEhYAjnJiHod9josfX5gbNCSUEDe0Rc/wIAJL66XW9iufoOay\n+425STIKS7vPX8b8kpJD9yq5v+/U3IFxj6DCuQEQfKK4r3da+khrOSMrbqZ5Guf2\nFUNAOgN5AgMBAAECgf8ljKlxI27QqY86hp6IS8yjE4AzXZBE5F6SzrS3u4dcuTh4\nUbgqFnmvARaDEgRWlPXGuz4Sw529wrXkmd3nvY4RBTcXMUh/mDca29vnA71zyNya\ncVKdyg0bPd6lIz1cMeeKnLmRh9RRSUqialyu4WxV6H+g1745OU7eUBPejcaWIOzV\nfPyVVDCkVh/Q3gVJA5Bso+8ue0BypyafVwFJrDrmDiJ8Dw1sG60WzqwDCRttHwQa\nVLVv3gF5+iJ1Vq/b7fv0IxaY9SpGqxDOW3JH3nv4vYlaiOORZpIKH1E8kUaPe+HG\nDl9d94lcAPZJj9YwfrJ7YQGgC0CmzLBtr3qV4+8CgYEA1nLUlFHAqCMM4iOyJVCN\nYO3Mz8RYybeW9A8XKcmaeGOadrUJzxqqpE3OPH53bPodFrmQfqUDkYVu+pe9O04E\nevR5dj/gHZAUPftAUqnhNOByVbOTbxoQvrDaIkb2FUB3zJMX2kHoLQnCP8zQzyyp\ndTLyXrSpBEBTOR6LFYOgmsMCgYEAz/ZzJmmYF8kAM7WRU7vovOdThuS2IbEdOrwg\nKvPMpbER2rbLA4nCAwQb+O6RHh+oj0mRzlw6ZarHC2YNbWURxU7nXgJSE3i1SsAp\nZ2wHX8r/xltOJAEVFkmoyPyl43NFPY5PA1tVCIO2BMiXp/Fkvlt19SiBKtNOr1yH\nXHNY7RMCgYEAkD9PdLEFCVQCT365TtY/Mwrh8INfQdhHJsWbzBT63a4J8X1XKsMC\nM2DOr+xVgq0+sdGCO13d5528h71XoTOaWeZmaT8QDnKi2wpNOw1gGgQ7hCA1tM7w\nooQtRk87KhJiQu5SZhJdDSZ6ThYEAsdE+Tuawk99PQnTsSE1ZvRSLKcCgYEAyroV\n8Jk5Ud54mu/h1r20mQnsa/Bi+B8fPlWMCjMWCWO+4vYUm8Nb5PLJjfaKctIr0FrI\nj2Fq8Bb16E+4wS6ojy5m70bV2fNuz4raEd7GpYRPqH7zgrenZc2ygxN/Z2XEVsh2\nj/AlyaIT+z/MT0RLkCG6sJ2mpSfOabaKof4z7w8CgYEAn0httjaIXa8//YI60Ktp\nIG4S91aVvuN8/Ua3tYJ8DVsWoT9ASSYW7S5S6cKowAk6QYXKi5xZY6rq5iP0c5Wb\n3fhoS/AHDWedH7e9bn3WFNhktgRyf6SRsb9z0bMvsPzqvJmGvWOqDYLCllDg7jR7\niY71FUCfqdEkEyX5a7HcjwM=\n-----END PRIVATE KEY-----\n",
  "client_email": "aat-app-feedback-backend@aat-app-feedback-backend.iam.gserviceaccount.com",
  "client_id": "103677524699840683129",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/aat-app-feedback-backend%40aat-app-feedback-backend.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

//Spreadsheet id for the Feedback Form
const _feedbackSpreadsheetId = '1L4CFCQCnvGlg-kOZli98A-v674eFLwf4zvDGQlXaJHk';

class FeedbackFormPage extends StatefulWidget {
  const FeedbackFormPage({Key? key}) : super(key: key);

  @override
  _FeedbackFormPageState createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _comment;
  late int _priority;
  bool _isSubmitted = false;
  late final GSheets feedbackGsheets;
  late final Spreadsheet feedbackSheet;
  late final Worksheet workSheet;

  @override
  void initState() {
    loadSheetValues();
    super.initState();
  }

  void loadSheetValues() async {
    feedbackGsheets = GSheets(_feedback_credentials);
    feedbackSheet = await feedbackGsheets.spreadsheet(_feedbackSpreadsheetId);
    workSheet = feedbackSheet.worksheetByTitle(
        "MainSheet")!; //gets the sheet by the title on the bottom
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Comment',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your comment';
                  }
                  return null;
                },
                onSaved: (value) {
                  _comment = value!;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Priority (1-5), 5 = Very very high priority',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a priority';
                  }
                  final priority = int.tryParse(value);
                  if (priority == null || priority < 1 || priority > 5) {
                    return 'Priority must be between 1 and 5';
                  }
                  return null;
                },
                onSaved: (value) {
                  _priority = int.parse(value!);
                },
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: _isSubmitted ? null : _submitForm,
                child: const Text('Submit'),
              ),
              if (_isSubmitted)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Successfully Submitted Feedback",
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void writeToSheet(String name, String comment, int priority) async {
    int rowCount = workSheet.rowCount; //num of current entries
    rowCount++;
    await workSheet.values.insertValue(name, column: 1, row: rowCount);
    await workSheet.values.insertValue(comment, column: 2, row: rowCount);
    await workSheet.values.insertValue(priority, column: 3, row: rowCount);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Additional processing or submission logic
      writeToSheet(_name, _comment, _priority);
      // Clear form fields
      _formKey.currentState!.reset();
      setState(() {
        _isSubmitted = true;
      });

      // Reset submission status after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isSubmitted = false;
        });
      });
    }
  }
}
