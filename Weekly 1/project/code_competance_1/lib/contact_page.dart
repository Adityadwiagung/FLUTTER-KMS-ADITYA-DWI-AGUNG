import 'package:code_competance_1/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPage();
}

class _ContactPage extends State<ContactPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String _nameValue = "";
  String _emailValue = "";
  String _messageValue = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Contact Us',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('If you have any questions about our studio or have a project in mind, leave a comment for us below. We’re always happy to start a conversation with you, even if you don’t know what you need or how to say it yet.',
          style: GoogleFonts.montserrat(
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'First Name',
                  controller: _firstNameController,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextFieldWidget(
                  label: 'Last Name',
                  controller: _lastNameController,
                  textInputType: TextInputType.name,
                ),
              ),
            ],
          ),
          TextFieldWidget(
            label: 'Email',
            controller: _emailController,
            textInputType: TextInputType.emailAddress,
          ),
          TextFieldWidget(
            maxLines: 3,
            label: 'What can we help you with?',
            controller: _messageController,
            textInputType: TextInputType.multiline,
          ),
          const SizedBox(height: 8,),
          ElevatedButton(
            onPressed: () {
              _nameValue = "${_firstNameController.text} ${_lastNameController.text}";
              _emailValue = _emailController.text;
              _messageValue = _messageController.text;

              showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Data Submitted'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: $_nameValue'),
              Text('Email: $_emailValue'),
              Text('Message: $_messageValue'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }, 
  child:  Text('Submit',
    style: GoogleFonts.montserrat(
      color: Colors.white,
      fontWeight: FontWeight.bold
    ),
  )
        )
      ]
     ), 
    );
  }
}