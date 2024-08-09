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

class HomeMobileLayoutW extends StatefulWidget {
  const HomeMobileLayoutW({super.key});

  @override
  State<HomeMobileLayoutW> createState() => _HomeMobileLayoutWState();
}

class _HomeMobileLayoutWState extends State<HomeMobileLayoutW> {
  String? cityName;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Sbox(
          h: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const CustomText(
            text: "Welcome Weather",
            fontSize: 30,
            fontW: FontWeight.w600,
            color: TColor.color2,
          ),
        ),
        const Sbox(
          h: 10,
        ),
        ImageNetwork(
          url: "logo.png",
          width: 1.sw,
          height: 280.w,
          fill: true,
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
                number: 2,
                validation: "Please write city name you want search",
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
                  height: 40,
                  radius: 10,
                  bgColor: TColor.color2,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
