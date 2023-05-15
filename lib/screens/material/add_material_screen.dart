import 'package:educational_center/controller/materila_controller/material_controller_cubit.dart';
import 'package:educational_center/controller/subject_controller/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/input_widget.dart';

class AddMaterialScreen extends StatefulWidget {
  const AddMaterialScreen({Key? key}) : super(key: key);

  @override
  State<AddMaterialScreen> createState() => _AddMaterialScreenState();
}

class _AddMaterialScreenState extends State<AddMaterialScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController srcController = TextEditingController();

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await SubjectCubit.get(context).getSubjectList(endPoint: 'teacher/subjects');
    super.didChangeDependencies();
  }

  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Material",
        ),
      ),
      body: BlocBuilder<MaterialCubit, MaterialControllerState>(
        builder: (context, state) {
          var subjectList = SubjectCubit.get(context).subjectList;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                DropdownButtonFormField<String>(
                  items: subjectList?.map((item) {
                    return DropdownMenuItem(
                        value: item.id.toString(),
                        child: Text(
                          item.details.toString(),
                        ));
                  }).toList(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    hintText: "Enter Subject",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.yellowAccent),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1.5, color: Colors.yellowAccent),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedSubject = value;
                    });
                  },
                  value: selectedSubject,
                ),
                const SizedBox(
                  height: 10,
                ),

                /// Material name
                const Text(
                  " Material Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InputWidget(
                  controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  isPasswordType: false,
                  labeltext: '',
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Material Details
                const Text(
                  " Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InputWidget(
                  controller: detailsController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  isPasswordType: false,
                  labeltext: '',
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Material SRC
                const Text(
                  " Source",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InputWidget(
                  controller: srcController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  isPasswordType: false,
                  labeltext: '',
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await MaterialCubit.get(context).teacherAddMaterial(data: {
                      'subject_id': selectedSubject,
                      'name': nameController.text,
                      'src': srcController.text,
                      'details': detailsController.text,
                    });
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
