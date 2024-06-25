import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/core/configs/colors.dart';
import 'package:list/core/configs/dime.dart';
import 'package:list/features/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Image.asset(
                    'assets/images/onepiece.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                    child: AppBar(
                  leading: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  ),
                  actions: const [
                    Icon(
                      Icons.search,
                      color: AppColors.white,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: AppColors.white,
                    ),
                  ],
                  backgroundColor: Colors.transparent,
                )),
                Positioned(
                  bottom: (AppDime.textSize35+(AppDime.space1*2))/2,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(AppDime.radius5),
                      boxShadow: const [
                        BoxShadow(color: AppColors.black,spreadRadius: 0,blurRadius: 8,offset: Offset(0, 2))
                      ]
                      ),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal:  AppDime.space4),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'One Piece',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text('7.9', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 8),
                            Icon(Icons.visibility, color: Colors.white),
                            SizedBox(width: 4),
                            Text('89,200',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Synopsis',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate assetsero et velit interdum, ac aliquet odio mattis.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child:Center(
                    child: Container(
                      padding: const EdgeInsets.all(AppDime.space1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10000),
                        color: AppColors.primary
                      ),
                      child: const Icon(Icons.arrow_downward_outlined,color: AppColors.white,size: AppDime.textSize35,),),
                  ) 
                )
              ],
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ChapterItem(
                  chapterNumber: 1067,
                  chapterTitle: 'Punk Records',
                  imageUrl: 'assets/images/onepiece.jpg',
                ),
                ChapterItem(
                  chapterNumber: 1066,
                  chapterTitle: 'The Will of Ohara',
                  imageUrl: 'assets/images/onepiece.jpg',
                ),
                ChapterItem(
                  chapterNumber: 1065,
                  chapterTitle: 'Another Chapter',
                  imageUrl: 'assets/images/onepiece.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChapterItem extends StatelessWidget {
  final int chapterNumber;
  final String chapterTitle;
  final String imageUrl;

  const ChapterItem({
    super.key,
    required this.chapterNumber,
    required this.chapterTitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chapter $chapterNumber',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                chapterTitle,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:myfirstapp/components/bottom_nav_bar.dart';

// class ComicPage extends StatefulWidget {
//   const ComicPage({Key? key});

//   @override
//   State<ComicPage> createState() => _ComicPageState();
// }

// class _ComicPageState extends State<ComicPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: OnePieceScreen(),
//     );
//   }
// }

// class OnePieceScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       bottomNavigationBar: const MyBottomNavBar(),
//     );
//   }
// }

