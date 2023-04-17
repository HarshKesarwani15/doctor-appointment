import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

List<Map> aboutDetails = [
  {
    'id': 0,
    'img': 'assets/doctor01.jpeg',
    'name': 'Harsh Kesarwani',
    'link': 'https://github.com/HarshKesarwani15'
  },
  {
    'id': 1,
    'img': 'assets/doctor02.jpeg',
    'name': 'Mohit Sharma',
    'link': 'Heart Specialist'
  },
  {
    'id': 2,
    'img': 'assets/doctor03.jpeg',
    'name': 'Avinash Mavle',
    'link': 'Skin Specialist'
  },
];

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var about in aboutDetails)
          DetailsComponent(
              id: about['id'],
              img: about['img'],
              name: about['name'],
              link: about['link'])
      ],
    );
  }
}

class DetailsComponent extends StatelessWidget {
  int id;
  String img;
  String name;
  String link;

  _launchURL() async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch';
    }
  }

  DetailsComponent({
    required this.id,
    required this.img,
    required this.name,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: _launchURL,
        child: Row(
          children: [
            Container(
              color: Color(MyColors.grey01),
              child: Image(
                width: 100,
                image: AssetImage(img),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Color(MyColors.header01),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.link,
                      color: Color(MyColors.grey02),
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      link,
                      style: TextStyle(color: Color(MyColors.grey02)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
