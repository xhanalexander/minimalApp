import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minimalapp/components/forms.dart';
import 'package:minimalapp/models/api_models.dart';
import 'package:minimalapp/view_models/json_view_models.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  int ids = 69;

  final idController = TextEditingController();
  final userIDController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() => ids = 1);
  }
  

  void submitData() {
    final data = DataModels(
      userId: ids,
      id: ids,
      title: titleController.text,
      body: bodyController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('To Do added : ${data.title}'),
      ),
    );
    
    debugPrint("> Data: ${"${data.userId} ${data.id} ${data.title} ${data.body}"}");
    // ---------------------------------- POST Data ---------------------------------- //
    Provider.of<JsonViewModels>(context, listen: false).postData(data: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                const LabelsForms(labelName: 'Titles'),
                const SizedBox(height: 10),
          
                CustomForms(
                  hintTextName: '...',
                  controllerNames: titleController,
                ),
                const SizedBox(height: 20),
            
                const LabelsForms(labelName: "Contents"),
                SizedBox(
                  height: 100,
                  child: CustomTextAreaForms(
                    hintTextName: '...',
                    controllerNames: bodyController,
                  ),
                ),
                const SizedBox(height: 20),
                
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          debugPrint('Submitted');
          if (formKey.currentState!.validate()) {
            submitData();
          } else {
            debugPrint('Error');
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}