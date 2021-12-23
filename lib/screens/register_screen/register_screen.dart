import 'dart:convert';
import 'package:car_rental/components/customized_formfield.dart';
import 'package:car_rental/components/default_button.dart';
import 'package:car_rental/components/small_button.dart';
import 'package:car_rental/constants.dart';
import 'package:car_rental/screens/home_screen/home_screen.dart';
import 'package:car_rental/screens/login_screen/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirmationController;

  late FocusNode _nameNode;
  late FocusNode _emailNode;
  late FocusNode _phonenumberNode;
  late FocusNode _passwordNode;
  late FocusNode _passwordConfirmationNode;

  late bool accepted;

  PhoneNumber number = PhoneNumber(dialCode: '963');

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();

    _nameNode = FocusNode();
    _emailNode = FocusNode();
    _phonenumberNode = FocusNode();
    _passwordNode = FocusNode();
    _passwordConfirmationNode = FocusNode();

    accepted = false;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Registered Successfully',
          ),
        ),
      );
      Get.off(() => const HomeScreen());
    }
  }

  requestFocus(FocusNode _focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SmallButton(
                //   tooltip: 'Back',
                //   icon: const Icon(Icons.arrow_back),
                //   function: () => Navigator.of(context).pop(),
                //   color: kSeconderyColor,
                // ),
                const SizedBox(height: 100.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hello...\nGet Started',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 20.0,
                        ),
                      ]),
                      child: SvgPicture.asset(
                        'assets/images/register.svg',
                        height: 100.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Name
                      CustomizedFormField(
                        textInputType: TextInputType.name,
                        prefixIcon: Icons.person,
                        labelText: 'Name',
                        textEditingController: _nameController,
                        validate: (value) {
                          if (value.trim().isEmpty) return 'Required';
                        },
                      ),

                      const SizedBox(height: 30.0),

                      // Email
                      CustomizedFormField(
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: Icons.email,
                        labelText: 'Email Address',
                        textEditingController: _emailController,
                        validate: (value) {
                          if (value.trim().isEmpty) return 'Required';
                          if (!RegExp(kEmailRegex).hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                        },
                      ),

                      const SizedBox(height: 30.0),

                      // Phone Number
                      InternationalPhoneNumberInput(
                        countries: const [
                          'SA',
                          'AE',
                          'SY',
                        ],
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        initialValue: PhoneNumber(isoCode: 'AE'),

                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                        cursorColor: kButtonsColor,
                        inputDecoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kButtonsColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        textFieldController: _phoneNumberController,
                        inputBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kButtonsColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        validator: (res) {
                          if (false) return 'Enter a valid number';
                        },
                        // selectorConfig: const SelectorConfig(
                        //   selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        // ),
                      ),

                      // const SizedBox(height: 30.0),

                      // CustomizedFormField(
                      //   textInputType: TextInputType.phone,
                      //   prefixIcon: Icons.phone,
                      //   labelText: 'Phone Number',
                      //   textEditingController: _phoneNumberController,
                      //   validate: (value) {
                      //     if (value.trim().isEmpty) return 'Required';
                      //     if (!!RegExp(kPhoneRegex).hasMatch(value)) {
                      //       return 'Enter a valid phone number';
                      //     }
                      //   },
                      // ),

                      const SizedBox(height: 30.0),

                      // Password
                      CustomizedFormField(
                        textInputType: TextInputType.visiblePassword,
                        prefixIcon: Icons.vpn_key_rounded,
                        labelText: 'Password',
                        textEditingController: _passwordController,
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        validate: (value) {
                          if (value.trim().isEmpty) return 'Required';
                          if (_passwordConfirmationController.text !=
                              _passwordController.text) {
                            return 'Passwords don\'t match';
                          }
                        },
                      ),

                      const SizedBox(height: 30.0),

                      // Password Confirmation
                      CustomizedFormField(
                        textInputType: TextInputType.visiblePassword,
                        prefixIcon: Icons.vpn_key_rounded,
                        labelText: 'Password Confirmation',
                        textEditingController: _passwordConfirmationController,
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        validate: (value) {
                          if (value.trim().isEmpty) return 'Required';
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: const TextSpan(
                          text: 'I have read and accepted',
                          style: TextStyle(color: kButtonsColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: '\tTerms of Service',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            TextSpan(
                              text: '\t&',
                              style: TextStyle(color: kButtonsColor),
                            ),
                            TextSpan(
                              text: '\tPrivacy Police.',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Checkbox(
                      value: accepted,
                      onChanged: (val) {
                        setState(() {
                          accepted = val!;
                        });
                      },
                      checkColor: kButtonsColor,
                      activeColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    style: const TextStyle(
                        color: kButtonsColor, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: '\tSign Up',
                        style: const TextStyle(color: Colors.blueGrey),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.off(() => const LoginScreen());
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                DefaultButton(
                  text: 'Register',
                  onTap: () async {
                    submit();
                    // RigesterUser(
                    //   name: _nameController.text,
                    //   email: _emailController.text,
                    //   password: _passwordController.text,
                    //   passwordConfirmation:
                    //       _passwordConfirmationController.text,
                    //   phoneNumber: 132,
                    // );
                  },
                  bgColor: kButtonsColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

Future<void> RigesterUser({
  required String name,
  required String email,
  required String password,
  required String passwordConfirmation,
  required int phoneNumber,
}) async {
  final Map<String, dynamic> toInsert = {
    "name": name,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "phone_number": 13235,
  };
  print(name + email);
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/register'),
    body: json.encode(toInsert),
  );
  print(response.statusCode);
  final responseJson = json.decode(response.body);
  print(responseJson);
}
