import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnboardingPage extends StatefulWidget {
  // final bool showHome;
  const OnboardingPage({Key? key
      //required this.showHome
      })
      : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
                color: const Color(0xFF5C4DB1),
                urlImage: 'assets/meeting.png',
                title: 'Certified and Vetted',
                subtitle:
                    'We vet our nannies by validating their national \nIdentification documents, their passport\nphotos as well as their phone numbers'),
            buildPage(
                color: const Color(0xFF0051A2),
                urlImage: 'assets/mama_mboga.png',
                title: 'Filter Nannies',
                subtitle:
                    'Browse and filter from our wide range of \n nannies, get to filter by location, skills or  \n by experience.'),
            buildPage(
                color: const Color(0xFF0051A2),
                urlImage: 'assets/client_smiling.png',
                title: 'Easy and Affordable',
                subtitle:
                    'Only pay KES 1500 once and have a selection \n of up to four nannies to contact.'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  primary: Colors.white,
                  backgroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(80)),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);

                //navigate to login page

                Get.toNamed("/login");
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF0051A2),
                ),
              ))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text("Skip")),
                  Center(
                    child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Color(0xFF0051A2),
                        ),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: const Text("Next"))
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 54,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Image.asset('assets/apple_icon.png'),
              Text(
                'mwiti',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 44,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 44,
          ),
          Flexible(
            child: Image.asset(
              urlImage,
              fit: BoxFit.contain,
              //   width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              wordSpacing: 1,
              overflow: TextOverflow.visible,
            ), //0051A2
          )
        ]),
      );
}
