import 'package:car_rental/components/customized_formfield.dart';
import 'package:car_rental/components/default_button.dart';
import 'package:car_rental/constants.dart';
import 'package:car_rental/screens/home_screen/home_screen.dart';
import 'package:car_rental/screens/register_screen/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late FocusNode _emailNode;
  late FocusNode _passwordNode;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailNode = FocusNode();
    _passwordNode = FocusNode();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Logged In Successfully',
          ),
        ),
      );
      Get.to(
        () => const HomeScreen(),
      );
    }
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
                      'Welcome\nBack',
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
                        'assets/images/login.svg',
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

                        // Password
                        CustomizedFormField(
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          prefixIcon: Icons.vpn_key_rounded,
                          labelText: 'Password',
                          textEditingController: _passwordController,
                          validate: (value) {
                            if (value.trim().isEmpty) return 'Required';
                          },
                        ),
                      ],
                    )),
                const SizedBox(height: 10.0),
                const Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: kButtonsColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an aacount yet?',
                    style: const TextStyle(color: kButtonsColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\tRigester',
                        style: const TextStyle(color: Colors.blueGrey),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.off(() => const RegisterScreen());
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                DefaultButton(
                  text: 'Login',
                  onTap: () {
                    submit();
                  },
                  bgColor: kButtonsColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
