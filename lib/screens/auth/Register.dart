import 'package:educational_center/controller/auth_controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/input_widget.dart';
import '../home/layout_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<String> listoflevel = ["1", "2", "3", "4"];
  String? selectedlevel;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.white.withOpacity(0.1),
            leading: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.white;
                    }
                    return Colors.white;
                  }),
                ),
                child: const Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Colors.orange,
                )),
            title: const Text(
              "Register",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    logoWidget(
                      imageName: 'assets/images/1.png',
                      width: 200,
                      height: 60,
                    ),
                    const SizedBox(height: 12),
                    InputWidget(
                      controller: usernameController,
                      validator: (value){
                        if(value.isEmpty){
                          return 'This field is required';
                        }
                        return null;
                      },
                      isPasswordType: false,
                      labeltext: 'Enter your Username',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 12),
                    InputWidget(
                      controller: emailController,
                      validator: (value){
                        if(value.isEmpty){
                          return 'This field is required';
                        }
                        return null;
                      },
                      isPasswordType: false,
                      labeltext: 'Enter your Email',
                      icon: Icons.email_outlined,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 12.0,
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.border_color_outlined,
                            color: Colors.black,
                          ),
                          labelText: "Enter your level",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1.5,
                              color: Colors.orange,
                            ),
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1.5,
                                color: Colors.orange,
                              ),
                              borderRadius: BorderRadius.circular(45.0)),
                        ),
                        value: selectedlevel,
                        items: listoflevel
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                ))
                            .toList(),
                        onChanged: (item) => setState(
                          () => selectedlevel = item,
                        ),
                      ),
                    ),
                    InputWidget(
                      controller: phoneNumberController,
                      validator: (value){
                        if(value.isEmpty){
                          return 'This field is required';
                        }
                        return null;
                      },
                      isPasswordType: false,
                      labeltext: "Enter your PhoneNumber",
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 12),
                    InputWidget(
                      controller: passwordController,
                      validator: (value){
                        if(value.isEmpty){
                          return 'This field is required';
                        }
                        return null;
                      },
                      isPasswordType: true,
                      labeltext: "Enter your Password",
                      icon: Icons.password,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 5),
                      child: TextFormField(
                        controller: birthdayController,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'This field is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.calendar_today_rounded),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.blue,
                          labelText: "Select your Date",
                          labelStyle: const TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1.5,
                              color: Colors.orange,
                            ),
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickeddate != null) {
                            setState(() {
                              birthdayController.text = pickeddate.toString();
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 130,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            cubit.signUp(
                              {
                                'username': usernameController.text,
                                'email': emailController.text,
                                'school': 'cairo',
                                'level_id': selectedlevel,
                                'phone': phoneNumberController.text,
                                'password': passwordController.text,
                                'birthdate':  '2006-04-04',
                              },
                            ).whenComplete(
                                  () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const LayoutScreen();
                                  },
                                ),
                              ),
                            );;
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            }
                            return Colors.orange;
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
