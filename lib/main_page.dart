import 'package:flutter/material.dart';
import 'package:tlesson/colors.dart';
import 'package:tlesson/courses.dart';
import 'package:tlesson/header.dart';
import 'package:tlesson/invisible_expanded.dart';
import 'package:tlesson/sizes.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //create scaffold key state
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // create sliverlist key
  final GlobalKey _sliverListKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: Sizes.screenHeight(context),
            title: Row(
              children: [
                /*  MediaQuery.of(context).orientation == Orientation.portrait
                    ? InkWell(
                        onTap: () => _scaffoldKey.currentState!.openDrawer(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.menu),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  width: 10,
                ), */
                const InvisibleExpandedHeader(
                  child: Text('T-Lesson'),
                ),
                const Spacer(),
                Row()
              ],
            ),
            automaticallyImplyLeading: false,
            centerTitle: false,
            flexibleSpace: FlexibleSpaceBar(
              //title: const Text('Available seats'),
              background: Container(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 30
                      : 0,
                ),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.tan,
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  String text = 'T-Lesson';
                  var style = Theme.of(context).textTheme.headline1!;
                  return FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      text,
                      style: style.copyWith(
                        fontSize: calculateAutoscaleFontSize(
                          text,
                          style,
                          30.0,
                          constraints.maxWidth,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Header(title: 'About Us'),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: OrientationBuilder(
                    builder: (BuildContext context, Orientation orientation) {
                      if (MediaQuery.of(context).orientation ==
                          Orientation.landscape) {
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/teaching/teach.jpg',
                                height: 400,
                              ),
                            ),
                            const SizedBox(width: 30),
                            const Expanded(
                              child: Text(
                                '''T-Lesson is a start-up business tailored to fit the needs of students who require help with their academic activities.
  We guarantee excellent services and visible progress over the course of the lessons, and the satisfaction of money well spent.''',
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return SizedBox(
                          height: 500,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/teaching/teach.jpg',
                                  height: 400,
                                ),
                              ),
                              const SizedBox(width: 30),
                              const Expanded(
                                child: Text(
                                  '''T-Lesson is a start-up business tailored to fit the needs of students who require help with their academic activities.
  We guarantee excellent services and visible progress over the course of the lessons, and the satisfaction of money well spent.''',
                                  style: TextStyle(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                SizedBox(height: 30),
                Header(title: 'Courses'),
                SizedBox(height: 30),
              ],
            ),
          ),
          Courses(),
        ],
      ),
    );
  }
}

double calculateAutoscaleFontSize(
    String text, TextStyle style, double startFontSize, double maxWidth) {
  final textPainter = TextPainter(textDirection: TextDirection.ltr);
  var currentFontSize = startFontSize;
  for (var i = 0; i < 100; i++) {
    // limit max iterations to 100
    final nextFontSize = currentFontSize + 1;
    final nextTextStyle = style.copyWith(fontSize: nextFontSize);
    textPainter.text = TextSpan(text: text, style: nextTextStyle);
    textPainter.layout();
    if (textPainter.width >= maxWidth) {
      break;
    } else {
      currentFontSize = nextFontSize;
      // continue iteration
    }
  }
  return currentFontSize;
}
