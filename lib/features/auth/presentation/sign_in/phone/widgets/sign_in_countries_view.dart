import 'package:Ascend/features/auth/presentation/sign_in/action/sign_in_action.dart';
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_cubit.dart';
import 'package:Ascend/features/auth/presentation/sign_in/manager/sign_in_states.dart';
import 'package:Ascend/shared/Components/components.dart';
import 'package:Ascend/shared/core/constants/constants.dart';
import 'package:country_picker/country_picker.dart' show CountryService;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCountriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit_signin = SignInCubit.get(context);
        var allCountries = CountryService().getAll();
        var filteredCountries = allCountries.where((country) {
          return country.name.toLowerCase().contains(
            cubit_signin.searchQuery.toLowerCase(),
          );
        });
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: cubit_signin.showSearch == true ? buildAppar_true(context, cubit_signin) : buildAppar_false(context),

          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SafeArea(
              child: ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  final country = filteredCountries.elementAt(index);
                  
                  return ListTile(
                    // ******************************* Emoji
                    leading: Text(
                      country.flagEmoji,
                      style: TextStyle(fontSize: 22),
                    ),
                    // ******************************* Title
                    title: Text(
                      country.name,
                      style: TextStyle(color: cubit_signin.selectCountry == country.name ? AppColors.kPrimaryColor : Colors.white, fontSize: 15),
                    ),
                    // ******************************* Code
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "+${country.phoneCode}",
                          style: TextStyle(color: AppColors.kGreyColor, fontSize: 14),
                        ),
                        const SizedBox(width: 6),
                        if(cubit_signin.selectCountry == country.name) 
                          Icon(Icons.check, color: AppColors.kPrimaryColor, size: 18,),
                        
                      ],
                    ),
                    // ******************************* onPressed
                    onTap: () {
                      cubit_signin.clearSearch();
                      cubit_signin.showSearchNow(false);
                      Navigator.pop(context, country);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

// ******************************* Appar (true)
AppBar buildAppar_true(context, SignInCubit cubit_signin) => AppBar(
  backgroundColor: Colors.black,
  automaticallyImplyLeading: false,
  title: Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.kbackGroundField,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          // ******************************* Icons
          IconButton(
            padding: EdgeInsets.zero, //
            constraints: const BoxConstraints(),
            onPressed:() => SignInAction.signInButtonPress(context, "hide_search"),
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 21),
          ),
          // ******************************* Sizebox
          const SizedBox(width: 8),
          // ******************************* Search
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.kbackGroundField,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: cubit_signin.searchController,
                autofocus: true,
                onChanged: (value) {
                  cubit_signin.updateSearchQuery(value);
                },
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  hintText: "Search for the country",
                  hintStyle: TextStyle(
                    color: AppColors.kGreyColor,
                    fontSize: 15,
                  ),
                  suffixIcon: cubit_signin.searchQuery.isNotEmpty
                          ? IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.white70,
                              size: 20,
                            ),
                            onPressed: () {
                              cubit_signin.clearSearch();
                            },
                          )
                          : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    ),
  ),
);


// ******************************* Appar (false)
AppBar buildAppar_false(context) => AppBar(
  backgroundColor: Colors.black,
  automaticallyImplyLeading: false,
  leading: customIconback(
    funtions: () => SignInAction.signInButtonPress(context, "back_signin"),
  ),
  title: const Center(
    child: Text(
      'Select a country',
      style: TextStyle(color: Colors.white, fontSize: 18.0),
    ),
  ),

  actions: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () => SignInAction.signInButtonPress(context, "show_search"),
        icon: Icon(Icons.search_outlined, color: Colors.white, size: 22),
      ),
    ),
  ],
);
