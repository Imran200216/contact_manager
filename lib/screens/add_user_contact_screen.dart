import 'package:contact_manager/bloc/contact_bloc.dart';
import 'package:contact_manager/helper/snackbar_helper.dart';
import 'package:contact_manager/validator/app_validator.dart';
import 'package:contact_manager/widgets/cm_filled_btn.dart';
import 'package:contact_manager/widgets/cm_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserContactScreen extends StatefulWidget {
  const AddUserContactScreen({super.key});

  @override
  State<AddUserContactScreen> createState() => _AddUserContactScreenState();
}

class _AddUserContactScreenState extends State<AddUserContactScreen> {
  // form key
  final formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),

          title: Text("Add Users"),

          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: BlocConsumer<ContactBloc, ContactState>(
          listener: (context, state) {
            if (state is ContactSuccess) {
              // Success Snackbar
              SnackBarHelper.show(context, "Contact added successfully");

              // Clear controllers
              userNameController.clear();
              phoneNumberController.clear();
            } else if (state is ContactFailureState) {
              // Failure Snackbar
              SnackBarHelper.show(context, state.error, isError: true);
            }
          },
          builder: (context, state) {
            return Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Username textfield
                      CmInputField(
                        validator: (value) =>
                            AppValidators.validateUserName(value),
                        keyboardType: TextInputType.name,
                        label: "Username",
                        hint: "Enter username",
                        controller: userNameController,
                      ),

                      // Phone number textfield
                      CmInputField(
                        validator: (value) =>
                            AppValidators.validatePhoneNumber(value),
                        keyboardType: TextInputType.phone,
                        label: "Phone Number",
                        hint: "Enter phone number",
                        controller: phoneNumberController,
                      ),

                      const SizedBox(height: 40),

                      // Add Users Btn
                      CmFilledBtn(
                        isLoading: state is ContactLoading,
                        label: "Add Users",
                        onPressed: () async {
                          // Validate the form
                          if (formKey.currentState?.validate() ?? false) {
                            final userName = userNameController.text.trim();
                            final userPhoneNumber = phoneNumberController.text
                                .trim();

                            context.read<ContactBloc>().add(
                              AddContactEvent(userName, userPhoneNumber),
                            );
                          } else {
                            SnackBarHelper.show(
                              context,
                              "Please fill in all fields correctly",
                              isError: true,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
