import 'package:flutter/material.dart';
import 'package:form_model/form_model.dart';

class AdvancedPage extends StatefulWidget {
  const AdvancedPage({super.key});

  @override
  State<AdvancedPage> createState() => _AdvancedPageState();
}

class _AdvancedPageState extends State<AdvancedPage> {
  late FormModel<String> nameModel;
  late FormModel<String> emailModel;
  late FormModel<String> birthdateModel;
  late FormModel<String> phoneModel;
  late FormModel<Address> addressModel;
  late FormModel<List<String>> interestsModel;
  late FormModel<String> websiteModel;
  late FormModel<String> salaryModel;
  late FormModel<String> customFieldModel;

  final List<String> availableInterests = ['Sports', 'Music', 'Reading', 'Travel', 'Technology'];

  @override
  void initState() {
    super.initState();
    nameModel = const FormModel<String>(validators: [
      RequiredValidator(),
      StringMinLengthValidator(minLength: 2),
      StringMaxLengthValidator(maxLength: 50),
    ]);
    emailModel = const FormModel<String>(validators: [RequiredValidator(), EmailValidator()]);
    birthdateModel = const FormModel<String>(validators: [
      RequiredValidator<String>(),
      StringDateTimeAgeMinValidator(minAge: 18),
      StringDateTimeAgeMaxValidator(maxAge: 100),
    ]);
    phoneModel = const FormModel<String>(validators: [RequiredValidator(), StringPhoneNumberValidator()]);
    addressModel = FormModel<Address>(validators: [
      const RequiredValidator<Address>(),
      CustomValidator(validator: validateStreet),
      CustomValidator(validator: validateCity),
      CustomValidator(validator: validateCountry),
    ]);
    interestsModel = FormModel<List<String>>(validators: [
      const RequiredValidator<List<String>>(),
      CustomValidator(validator: validateMinInterests),
      CustomValidator(validator: validateMaxInterests),
    ]);
    websiteModel = const FormModel<String>(validators: [RequiredValidator(), StringUrlValidator()]);
    salaryModel = const FormModel<String>(validators: [
      RequiredValidator(),
      StringNumMinValidator(min: 0),
      StringNumMaxValidator(max: 1000000),
    ]);
    customFieldModel = FormModel<String>(validators: [
      const RequiredValidator(),
      StringCustomValidator(validator: validateCustomField),
    ]);

    // Set custom translations
    FormModelLocalizations().setCustomErrorTranslations(
        'en', const CustomFormErrorKey('custom_field_invalid'), 'Custom field must start with "ABC"');
    FormModelLocalizations().setCustomErrorTranslations(
        'es', const CustomFormErrorKey('custom_field_invalid'), 'El campo personalizado debe comenzar con "ABC"');
  }

  String? validateMinAge(DateTime? value) {
    if (value == null) return null;
    final age = DateTime.now().year - value.year;
    if (age < 18) return 'Must be at least 18 years old';
    return null;
  }

  String? validateMaxAge(DateTime? value) {
    if (value == null) return null;
    final age = DateTime.now().year - value.year;
    if (age > 100) return 'Must be no more than 100 years old';
    return null;
  }

  String? validateStreet(Address? value) {
    if (value == null || value.street.isEmpty) return 'Street is required';
    return null;
  }

  String? validateCity(Address? value) {
    if (value == null || value.city.isEmpty) return 'City is required';
    return null;
  }

  String? validateCountry(Address? value) {
    if (value == null || value.country.isEmpty) return 'Country is required';
    return null;
  }

  String? validateMinInterests(List<String>? value) {
    if (value == null || value.length < 2) return 'Select at least 2 interests';
    return null;
  }

  String? validateMaxInterests(List<String>? value) {
    if (value != null && value.length > 4) return 'Select no more than 4 interests';
    return null;
  }

  String? validateCustomField(String? value) {
    if (value == null || !value.startsWith('ABC')) return 'custom_field_invalid';
    return null;
  }

  void _submitForm() {
    setState(() {
      nameModel = nameModel.validate();
      emailModel = emailModel.validate();
      birthdateModel = birthdateModel.validate();
      phoneModel = phoneModel.validate();
      addressModel = addressModel.validate();
      interestsModel = interestsModel.validate();
      websiteModel = websiteModel.validate();
      salaryModel = salaryModel.validate();
      customFieldModel = customFieldModel.validate();
    });

    if (nameModel.isValid &&
        emailModel.isValid &&
        birthdateModel.isValid &&
        phoneModel.isValid &&
        addressModel.isValid &&
        interestsModel.isValid &&
        websiteModel.isValid &&
        salaryModel.isValid &&
        customFieldModel.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Advanced form submitted successfully!')),
      );
    }
  }

  void _changeLanguage(String languageCode) {
    setState(() {
      FormModelLocalizations().currentLocale = Locale(languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Form Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: FormModelLocalizations().currentLocale.languageCode,
              items: ['en', 'es', 'fr', 'de'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _changeLanguage(newValue);
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: nameModel.error?.translatedMessage,
              ),
              onChanged: (value) => setState(() => nameModel = nameModel.setValue(value).validate()),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: emailModel.error?.translatedMessage,
              ),
              onChanged: (value) => setState(() => emailModel = emailModel.setValue(value).validate()),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Birthdate',
                errorText: birthdateModel.error?.translatedMessage,
              ),
              readOnly: true,
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() => birthdateModel = birthdateModel.setValue(picked.toString()).validate());
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone',
                errorText: phoneModel.error?.translatedMessage,
              ),
              onChanged: (value) => setState(() => phoneModel = phoneModel.setValue(value).validate()),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address (Street, City, Country)',
                errorText: addressModel.error?.translatedMessage,
              ),
              onChanged: (value) {
                final parts = value.split(',').map((e) => e.trim()).toList();
                final address = Address(
                  street: parts.isNotEmpty ? parts[0] : '',
                  city: parts.length > 1 ? parts[1] : '',
                  country: parts.length > 2 ? parts[2] : '',
                );
                setState(() => addressModel = addressModel.setValue(address).validate());
              },
            ),
            const SizedBox(height: 16),
            const Text('Interests:'),
            ...availableInterests.map((interest) => CheckboxListTile(
                  title: Text(interest),
                  value: interestsModel.value?.contains(interest) ?? false,
                  onChanged: (bool? value) {
                    setState(() {
                      final currentInterests = interestsModel.value ?? [];
                      final updatedInterests = value == true
                          ? [...currentInterests, interest]
                          : currentInterests.where((e) => e != interest).toList();
                      interestsModel = interestsModel.setValue(updatedInterests).validate();
                    });
                  },
                )),
            if (interestsModel.error != null)
              Text(
                interestsModel.error!.translatedMessage ?? '',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Website',
                errorText: websiteModel.error?.translatedMessage,
              ),
              onChanged: (value) => setState(() => websiteModel = websiteModel.setValue(value).validate()),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Salary (Annual)',
                errorText: salaryModel.error?.translatedMessage,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => setState(() => salaryModel = salaryModel.setValue(value).validate()),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Custom Field (must start with ABC)',
                errorText: customFieldModel.error?.translatedMessage,
              ),
              onChanged: (value) => setState(() => customFieldModel = customFieldModel.setValue(value).validate()),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class Address {
  final String street;
  final String city;
  final String country;

  Address({required this.street, required this.city, required this.country});
}
