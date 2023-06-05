import 'package:flutter/material.dart';

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
                  labelText: 'Priority (1-5), 5 = Very high priority',
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Additional processing or submission logic...
      print("Name: $_name, Comment: $_comment, Priority: $_priority");

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
