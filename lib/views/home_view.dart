import 'dart:ui';

import 'package:commerce_app/utils/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // define category list model in homepage view
  List<CategoryModel> categories = [];
  List<RecommendationModel> recommendations = [];
  List<PopularModel> popularDiets = [];

  // create a getter to get the list categories
  // firt we can make the method static so that we donot to instanciat the class
  // void _getCategories() {
  //   categories = CategoryModel.getCategories();
  // }

  // void _getRecommendations() {
  //   recommendations = RecommendationModel.getRecommendations();
  // }

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    recommendations = RecommendationModel.getRecommendations();
    popularDiets = PopularModel.getPopularDiets();
  }

  // we could also use the initstate to get the required files
  // before building the UI

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _IconsHolder(Icons.arrow_back_ios_new),
                const Text("Breakfast",
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                _IconsHolder(Icons.more_horiz),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              // textfield
              _SearchTextField(),
              // category
              _subTitle('Category'),
              _Category(),
              //recommendation for diet
              _subTitle('Recommendation\nfor diet'),
              _Recommendation(),
              // Popular
              _subTitle('Popular'),
              _Popular(),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ));
  }

  Container _Popular() => Container(
        // height: double.infinity,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: popularDiets.length,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 90,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: popularDiets[index].isSelected ? Colors.white : Colors.transparent,
                  boxShadow: popularDiets[index].isSelected ? [
                    BoxShadow(
                      color: shaderColor2,
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ] : []
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Container(
                          height: 80,
                          width: 60,
                          child: SvgPicture.asset(popularDiets[index].iconPath)),
                    ),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recommendations[index].name,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          recommendations[index].mode +
                              ' | ' +
                              recommendations[index].duration +
                              ' | ' +
                              recommendations[index].cal,
                          style: TextStyle(
                              color: shaderColor3,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: shaderColor3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(CupertinoIcons.forward, color: shaderColor3)),
                )
              ]),
            );
          },
        ),
      );

  Column _subTitle(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Container _Category() {
    return Container(
      // color: Colors.red,
      height: 130,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 15),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 110,
            // width: 79.3,
            decoration: BoxDecoration(
                color: categories[index].boxColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 55,
                    width: 55,
                    // padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: shaderColor, shape: BoxShape.circle),
                    child: Padding(
                        // color: Colors.blue,
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(categories[index].iconPath))),
                const SizedBox(
                  height: 5,
                ),
                Text(categories[index].name,
                    style: const TextStyle(
                        fontSize: 16,
                        wordSpacing: 2.5,
                        fontWeight: FontWeight.w500))
              ],
            ),
          );
        },
      ),
    );
  }

  Container _Recommendation() {
    return Container(
      // color: Colors.blue,
      height: 250,
      child: ListView.separated(
        itemCount: recommendations.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            // color: Colors.red,
            width: 190,
            decoration: BoxDecoration(
                color: recommendations[index].isVied
                    ? colorPurple.withOpacity(0.4)
                    : colorPink.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(recommendations[index].iconPath),
                ),
                Text(
                  recommendations[index].name,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  recommendations[index].mode +
                      ' | ' +
                      recommendations[index].duration +
                      ' | ' +
                      recommendations[index].cal,
                  style: TextStyle(
                      color: shaderColor3,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          recommendations[index].isVied
                              ? colorBlue
                              : Colors.transparent,
                          recommendations[index].isVied
                              ? colorPurple
                              : Colors.transparent,
                        ]),
                  ),
                  child: Text(
                    "View",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: recommendations[index].isVied
                            ? Colors.white
                            : colorPink.withOpacity(0.9)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _SearchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              // BoxShadow(color: shaderColor, offset: Offset(0,1), blurRadius: 20),
              BoxShadow(
                  color: shaderColor2,
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  spreadRadius: 5),
            ]),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.search),
              hintText: "Search Pancake",
              hintStyle: TextStyle(color: shaderColor),
              suffixIcon: Container(
                width: 50,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 0.1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.menu,
                          color: colorPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // suffixIcon: Icon(Icons.menu_rounded),
              fillColor: Colors.white,
              // suffixIconColor: colorPurple,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              hoverColor: colorPink.withOpacity(0.7)),
        ),
      ),
    );
  }

  Container _IconsHolder(IconData icon_) {
    return Container(
        alignment: Alignment.center,
        // margin: EdgeInsets.all(10),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            color: shaderColor2.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon_,
                  size: 20,
                ))));
  }
}
