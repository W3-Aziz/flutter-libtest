import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_practics/app/modules/home/controllers/home_controller.dart';
import 'package:lib_practics/app/modules/home/intro_page.dart';
import 'package:lib_practics/snapping/getting_started_example.dart';
import 'package:lib_practics/snapping/snapping_sheet.dart';

class ProfileView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Container(
        child: SizedBox(
          width: Get.width,
          child: Column(
            children: [
              CountryCodePicker(
                boxDecoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.red,
                ),
                onChanged: _onCountryChange,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: ['+39', 'FR'],
                // optional. Shows only country name and flag
                showCountryOnly: true,
                // optional. Shows only country name and flag when popup is closed.
                showOnlyCountryWhenClosed: true,
                showDropDownButton: true,
                showFlag: true,
                showFlagDialog: true,
                showFlagMain: true,
                // optional. aligns the flag and the Text left
                alignLeft: false,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  showBottomSheet(context);
                },
                child: const Text("Click to show bottom sheet"),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => GettingStartedExample());
                },
                child: const Text("Snapping bottom sheet"),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => PageWrapper());
                },
                child: const Text("Snapping Example"),
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.red,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const IntroPage());
                        },
                        child: const Center(
                          child: Text("Download"),
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: TriangleClipper(),
                      child: Container(
                        color: Colors.red,
                        height: 10,
                        width: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          builder: (context, scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        );
      },
    );
  }

  void _onCountryChange(CountryCode countryCode) {
    print(
        "New Country selected: name: ${countryCode.name} Digi: ${countryCode.code} ${countryCode.dialCode} ${countryCode.flagUri}");
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
