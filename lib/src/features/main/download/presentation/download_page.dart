import 'package:cinemax/src/config/theme/colors.theme.dart';
import 'package:cinemax/src/config/theme/typography.theme.dart';
import 'package:cinemax/src/core/const/const.dart';
import 'package:cinemax/src/features/main/root/presentation/page/root.page.dart';
import 'package:flutter/material.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Download',
          ),
          backgroundColor: AppColors.dark,
          titleTextStyle: AppTypography.heading2(
            color: Colors.white,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RootPage()),
                );
              },
              icon: Icon(
                Icons.arrow_back_ios,
              )),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      color: AppColors.soft,
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.all(12),
                              height: 130,
                              width: 180,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      Asset.downloadImage,
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Positioned.fill(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_circle,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Action',
                                  style: AppTypography.heading3(
                                      color: Colors.grey),
                                ),
                                Text(
                                  overflow: TextOverflow.clip,
                                  'Spider-Man No Way Home',
                                  style: AppTypography.heading3(
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Movie',
                                      style: AppTypography.heading3(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Container(
                                      height: 15,
                                      width: 1.5,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      '1000 GB',
                                      style: AppTypography.heading4(
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
