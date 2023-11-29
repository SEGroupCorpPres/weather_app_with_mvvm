import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_with_mvvm/core/constants/colors.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/pages/next_days/next_14_days.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/app_bar.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/container_list.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/hours_list.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/info_card.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CustomAppBar(),
                  const SizedBox(height: 20),
                  Location(),
                  Hero(
                    tag: 'Tag',
                    child: Material(
                      color: Colors.transparent,
                      child: InfoCard(),
                    ),
                  ),
                  ContainerList(),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.to(() =>  NextDays()),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Next 14 days >',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  HoursList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
