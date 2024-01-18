import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nuntium/config/constants/design_constants.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      designSize: DesignConstants.designSize,
      builder: (context, child) => GetMaterialApp(
        home: const Scaffold(),
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF475AD7),
          ),
        ),
        // initialBinding: LoaderPageBindings(),
      ),
    );
  }
}
