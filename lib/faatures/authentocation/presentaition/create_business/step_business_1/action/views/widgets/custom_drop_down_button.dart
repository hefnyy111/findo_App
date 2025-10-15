import 'package:flutter/material.dart';

class CustomCategoryDropdown extends StatefulWidget {
  const CustomCategoryDropdown({super.key});

  @override
  State<CustomCategoryDropdown> createState() => _CustomCategoryDropdownState();
}

class _CustomCategoryDropdownState extends State<CustomCategoryDropdown> {
  String? selectedCategory;

  final List<Map<String, dynamic>> categories = [
    {"name": "Restaurant", "icon": Icons.shopping_cart_outlined},
    {"name": "Retail Store", "icon": Icons.receipt_long_outlined},
    {"name": "Cafe", "icon": Icons.local_cafe_outlined},
    {"name": "Service Provider", "icon": Icons.build_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 40, 40, 40),
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 1)],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: const Color(0xFF1B1B1B),
            value: selectedCategory,
            hint: Row(
              children: const [
                Icon(Icons.restaurant_menu, color: Colors.cyanAccent),
                SizedBox(width: 10),
                Text(
                  "Select a category",
                  style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16.0),
                ),
              ],
            ),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.cyanAccent),
            items:
                categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category["name"],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          category["icon"],
                          color: Colors.cyanAccent,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          category["name"],
                          style: const TextStyle(
                            color: Colors.white,
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
        ),
      ),
    );
  }
}
