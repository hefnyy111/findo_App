// faatures/authentocation/presentaition/create_business/step_business_1/action/views/widgets/custom_drop_down_button.dart
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:findo/shared/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCategoryDropdown extends StatefulWidget {
  const CustomCategoryDropdown({super.key});

  @override
  State<CustomCategoryDropdown> createState() => _CustomCategoryDropdownState();
}

class _CustomCategoryDropdownState extends State<CustomCategoryDropdown> {
  String? selectedCategory;

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Restaurant", 
      "icon": Icons.shopping_cart_outlined},
    {
      "name": "Retail Store", 
      "icon": Icons.receipt_long_outlined},
    {
      "name": "Cafe", 
      "icon": Icons.local_cafe_outlined},
    {
    "name": "Service Provider", 
    "icon": Icons.build_outlined},
  ];

  @override
Widget build(BuildContext context) {
  return Center(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.kbackGroundField,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: Container(
          width: double.infinity,
          child: DropdownButton2<String>(
            isExpanded: true,
            value: selectedCategory,
            hint: const Text(
              " Select a category",
              style: TextStyle(
                color: AppColors.kGreyColor,
                fontSize: 12.0,
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.arrow_drop_down, color: Colors.cyanAccent),
            ),
            // ******************************* Button style
            buttonStyleData: ButtonStyleData(
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.kbackGroundField,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            // ******************************* menu style
            dropdownStyleData: DropdownStyleData(
              useSafeArea: true,
              maxHeight: 220,
              padding: EdgeInsets.zero,
              elevation: 4,
              decoration: BoxDecoration(
                color: AppColors.kbackGroundField,
                borderRadius: BorderRadius.circular(15),
              ),
              offset: const Offset(0, -5), // 👈 يخلي المنيو تبدأ لتحت بشياكة
            ),
          
            // ******************************* item style
            menuItemStyleData: const MenuItemStyleData(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 12),
            ),
            items: categories.map((category) {
              return DropdownMenuItem<String>(
                value: category["name"],
                child: Row(
          children: [
            Icon(
              category["icon"],
              color: Colors.cyanAccent,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              category["name"],
              style: const TextStyle(
                color: AppColors.kGreyColor,
                fontSize: 15,
              ),
            ),
          ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),
        )
      ),
    ),
  );
}
}