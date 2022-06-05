import 'package:flutter/material.dart';
import 'package:tlesson/colors.dart';
import 'package:tlesson/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class Courses extends StatelessWidget {
  Courses({Key? key}) : super(key: key);

  List<Course> courses = [
    Course(
      name: 'CHM 111',
      desc: 'Chemistry',
      tutorNumber: '2348132828211',
      photoLink: 'assets/Kachi-01.png',
    ),
    Course(
      name: 'CHM 112',
      desc: 'Chemistry',
      tutorNumber: '2348132828211',
      photoLink: 'assets/Kachi-02.png',
    ),
    Course(
        name: 'MCB 111',
        desc: 'Microbiology',
        tutorNumber: '2347016594005',
        photoLink: 'assets/Kachi-03.png'),
    Course(
        name: 'MCB 121',
        desc: 'Microbiology',
        tutorNumber: '2347016594005',
        photoLink: 'assets/Kachi-04.png'),
    Course(
        name: 'BIO 111',
        desc: 'Biology',
        tutorNumber: '2348132828211',
        photoLink: 'assets/Kachi-05.png'),
    Course(
        name: 'BIO 121',
        desc: 'Biology',
        tutorNumber: '2348132828211',
        photoLink: 'assets/Kachi-06.png'),
    Course(
        name: 'MAC 112',
        desc: 'African Communication',
        tutorNumber: '2348020599535',
        photoLink: 'assets/Kachi-07.png'),
    Course(
        name: 'GST 113',
        desc: 'Philosophy',
        tutorNumber: '2348020599535',
        photoLink: 'assets/Kachi-08.png'),
    Course(
        name: 'ENG 111',
        desc: 'Communication in English',
        tutorNumber: '2349091487520',
        photoLink: 'assets/Kachi-09.png'),
    Course(
        name: 'GST 123',
        desc: 'Communication in French',
        tutorNumber: '2349059081296',
        photoLink: 'assets/Kachi-10.png'),
    Course(
        name: 'MAC 121',
        desc: 'Writing in Mass Media',
        tutorNumber: '2349091487520',
        photoLink: 'assets/Kachi-11.png'),
    Course(
        name: 'MAC 122',
        desc: 'History in Mass Media',
        tutorNumber: '2349091487520',
        photoLink: 'assets/Kachi-12.png'),
    Course(
        name: 'STA 111',
        desc: 'Statistics',
        tutorNumber: '2348078868822',
        photoLink: 'assets/Kachi-13.png'),
    Course(
        name: 'STA 121',
        desc: 'Statistics',
        tutorNumber: '2348078868822',
        photoLink: 'assets/Kachi-14.png'),
    Course(
        name: 'CSC 111',
        desc: 'Computer Science',
        tutorNumber: '2347038808006',
        photoLink: 'assets/Kachi-15.png'),
    Course(
        name: 'PHY 111',
        desc: 'Physics',
        tutorNumber: '2349033476145',
        photoLink: 'assets/Kachi-16.png'),
    Course(
        name: 'PHY 121',
        desc: 'Physics',
        tutorNumber: '2349033476145',
        photoLink: 'assets/Kachi-17.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          List<Widget> children = [];
          if (index.isEven) {
            children.addAll([
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    courses[index].photoLink,
                  )),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: VerticalDivider(),
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        courses[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 50),
                      ),
                      Text(courses[index].desc),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                fixedSize: const Size.fromHeight(40),
                                primary: AppColors.greenSheen,
                                onPrimary: AppColors.blackCoffee,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(Uri.parse(
                                    'https://api.whatsapp.com/send/?phone=${courses[index].tutorNumber}&text=I%20want%20to%20enroll%20for%20${courses[index].name.replaceAll(' ', '')}&app_absent=0'))) {
                                  throw 'Could not launch';
                                }
                              },
                              child: const Text('Enroll'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(40),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                primary: AppColors.teal,
                                onPrimary: Colors.white,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(Uri.parse(
                                    'https://api.whatsapp.com/send/?phone=${courses[index].tutorNumber}&text=I%20want%20to%20enroll%20for%20${courses[index].name.replaceAll(' ', '')}&app_absent=0'))) {
                                  throw 'Could not launch';
                                }
                              },
                              child: const Text('Contact tutor'),
                            ),
                          ),
                        ],
                      )
                    ]),
              )
            ]);
          } else {
            children.addAll([
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        courses[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 50),
                      ),
                      Text(courses[index].desc),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                fixedSize: const Size.fromHeight(40),
                                primary: AppColors.greenSheen,
                                onPrimary: AppColors.blackCoffee,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(Uri.parse(
                                    'https://api.whatsapp.com/send/?phone=${courses[index].tutorNumber}&text=I%20want%20to%20enroll%20for%20${courses[index].name.replaceAll(' ', '')}&app_absent=0'))) {
                                  throw 'Could not launch';
                                }
                              },
                              child: const Text('Enroll'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(40),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                primary: AppColors.teal,
                                onPrimary: Colors.white,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(Uri.parse(
                                    'https://api.whatsapp.com/send/?phone=${courses[index].tutorNumber}&text=I%20want%20to%20enroll%20for%20${courses[index].name.replaceAll(' ', '')}&app_absent=0'))) {
                                  throw 'Could not launch';
                                }
                              },
                              child: const Text('Contact tutor'),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: VerticalDivider(),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  courses[index].photoLink,
                ),
              ),
            ]);
          }
          return Builder(
            builder: (BuildContext context) {
              if (MediaQuery.of(context).orientation == Orientation.portrait) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          courses[index].photoLink,
                        ),
                      ),
                    ),
                    Text(
                      courses[index].name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(courses[index].desc),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                fixedSize: const Size.fromHeight(40),
                                primary: AppColors.greenSheen,
                                onPrimary: AppColors.blackCoffee,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(Uri.parse(
                                    'https://api.whatsapp.com/send/?phone=${courses[index].tutorNumber}&text=I%20want%20to%20enroll%20for%20${courses[index].name.replaceAll(' ', '')}&app_absent=0'))) {
                                  throw 'Could not launch';
                                }
                              },
                              child: const Text('Enroll'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(40),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                primary: AppColors.teal,
                                onPrimary: Colors.white,
                              ),
                              onPressed: () async {
                                if (!await launchUrl(Uri.parse(
                                    'https://api.whatsapp.com/send/?phone=${courses[index].tutorNumber}&text=I%20want%20to%20enroll%20for%20${courses[index].name.replaceAll(' ', '')}&app_absent=0'))) {
                                  throw 'Could not launch';
                                }
                              },
                              child: const Text('Contact tutor'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (index != courses.length - 1)
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Divider(),
                      )
                  ],
                );
              }
              return SizedBox(
                height: Sizes.screenHeight(context) * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: index.isEven
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: children,
                  ),
                ),
              );
            },
          );
        },
        childCount: courses.length,
      ),
    );
  }
}

class Course {
  String name;
  String desc;
  String tutorNumber;
  String photoLink;
  Course({
    required this.name,
    required this.desc,
    required this.tutorNumber,
    required this.photoLink,
  });
}
