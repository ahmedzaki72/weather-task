import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/config/theme_colors.dart';
import 'package:weathertask/custom_widgets/custom_button.dart';
import 'package:weathertask/custom_widgets/custom_form_field_border.dart';
import 'package:weathertask/custom_widgets/custom_text.dart';
import 'package:weathertask/custom_widgets/image_network.dart';
import 'package:weathertask/helper/extensions.dart';
import 'package:weathertask/modules/result/bloc/city_search_cubit/city_search_cubit.dart';
import 'package:weathertask/modules/result/view/result_screen.dart';
import 'package:weathertask/utils/sized_box.dart';

class HomeDesktopLayoutW extends StatefulWidget {
  const HomeDesktopLayoutW({super.key});

  @override
  State<HomeDesktopLayoutW> createState() => _HomeDesktopLayoutWState();
}

class _HomeDesktopLayoutWState extends State<HomeDesktopLayoutW> {
  String? cityName;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Sbox(
          h: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const CustomText(
            text: "Welcome Weather",
            fontSize: 15,
            fontW: FontWeight.w600,
            color: TColor.color2,
          ),
        ),
        const Sbox(
          h: 10,
        ),
        const ImageNetwork(
          url: "logo_desktop.png",
          width: 500,
          height: 400,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormFieldWithBorder(
                hintText: "Search By City Name",
                fillColor: TColor.white,
                formFieldWidth: 395,
                radiusNumber: 16,
                contentPaddingVertical: 20,
                number: 2,
                validation: "Please write city name you want search",
                textStyleHint: TextStyle(
                  fontSize: 6.sp,
                  fontFamily: "URW",
                ),
                saved: (value) {
                  cityName = value;
                },
              ),
              const Sbox(
                h: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  text: "Search",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      citySearchCubit.citySearch(cityName: cityName);
                      context.toView(
                        ResultScreen(
                          name: cityName,
                        ),
                      );
                    }
                  },
                  height: 12,
                  radius: 10,
                  fontSize: 1.3,
                  bgColor: TColor.color2,
                ),
              ),
              const Sbox(
                h: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
