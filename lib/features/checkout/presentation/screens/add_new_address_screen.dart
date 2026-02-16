import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_ecommerce_app/core/common/widgets/elevated_button_widget.dart';
import 'package:furniture_ecommerce_app/core/theme/app_colors.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  _AddressType _selectedAddressType = _AddressType.houseApartment;
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _zipController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Checkout'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 20.h),
          child: Column(
            children: [
              const _CheckoutProgress(),
              SizedBox(height: 28.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver To',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      _LabeledInputField(
                        label: 'Full Name*',
                        controller: _fullNameController,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(height: 24.h),
                      _LabeledInputField(
                        label: 'Phone Number*',
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: _LabeledInputField(
                              label: 'City / District*',
                              controller: _cityController,
                              keyboardType: TextInputType.streetAddress,
                            ),
                          ),
                          SizedBox(width: 18.w),
                          Expanded(
                            flex: 2,
                            child: _LabeledInputField(
                              label: 'ZIP*',
                              controller: _zipController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      _LabeledInputField(
                        label: 'Address*',
                        controller: _addressController,
                        keyboardType: TextInputType.streetAddress,
                        maxLines: 2,
                      ),
                      SizedBox(height: 26.h),
                      _AddressTypeOption(
                        label: 'House / Apartment',
                        isSelected:
                            _selectedAddressType == _AddressType.houseApartment,
                        onTap: () {
                          setState(() {
                            _selectedAddressType = _AddressType.houseApartment;
                          });
                        },
                      ),
                      SizedBox(height: 16.h),
                      _AddressTypeOption(
                        label: 'Agency / Company',
                        isSelected:
                            _selectedAddressType == _AddressType.agencyCompany,
                        onTap: () {
                          setState(() {
                            _selectedAddressType = _AddressType.agencyCompany;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButtonWidget(
                  buttonLabel: 'Save',
                  onPressEvent: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckoutProgress extends StatelessWidget {
  const _CheckoutProgress();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            const _StepDot(isActive: true),
            Expanded(
              child: Divider(
                color: AppColors.border,
                thickness: 1,
                indent: 4.w,
                endIndent: 4.w,
              ),
            ),
            const _StepDot(isActive: false),
            Expanded(
              child: Divider(
                color: AppColors.border,
                thickness: 1,
                indent: 4.w,
                endIndent: 4.w,
              ),
            ),
            const _StepDot(isActive: false),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: Text(
                'Personal Info',
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Payment',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Confirmation',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StepDot extends StatelessWidget {
  final bool isActive;
  const _StepDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16.w,
      height: 16.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? Colors.black : AppColors.border,
          width: 1.5,
        ),
      ),
      child: isActive
          ? Center(
              child: Container(
                width: 8.w,
                height: 8.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            )
          : null,
    );
  }
}

class _LabeledInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;

  const _LabeledInputField({
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: textTheme.bodyLarge?.copyWith(color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            isDense: true,
            filled: false,
            contentPadding: EdgeInsets.only(bottom: 10.h),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.border.withValues(alpha: 0.75),
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}

class _AddressTypeOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _AddressTypeOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.black : AppColors.border,
                width: isSelected ? 2 : 1.6,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 9.w,
                      height: 9.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  )
                : null,
          ),
          SizedBox(width: 10.w),
          Text(
            label,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

enum _AddressType { houseApartment, agencyCompany }
