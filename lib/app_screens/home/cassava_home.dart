import 'package:flutter/material.dart';

import '../../components/button_nav_bar.dart';
import '../../constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cassava_calculate.dart';
import 'cassava_favorite.dart';
import 'cassava_price.dart';
import 'cassava_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CassavaHome(),
      bottomNavigationBar: ButtonNavBar(),
      backgroundColor: kBackgroundColor,
    );
  }
}

class CassavaHome extends StatelessWidget {
  const CassavaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundScaffold,
        body: Stack(
          children: [
            Container(
              height: size.height * 0.32,
              decoration: const BoxDecoration(
                color: kSecondaryColor,
              ),
            ),
            // Positioned(
            //   left: 55,
            //   top: 370,
            //   child: Align(
            //     child: SizedBox(
            //       width: 340,
            //       height: 260,
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: kSecondaryColor,
            //           borderRadius: BorderRadius.circular(13),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50, right: 20),
                  alignment: Alignment.topRight,
                  child: const Icon(
                    Icons.account_circle_sharp,
                    size: 50,
                    color: kBackgroundColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 35),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Cassava NEWS ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 2,
                      color: kBackgroundScaffold,
                    ),
                  ),
                ),
                const Divider(
                  color: kTextColor,
                  indent: 30,
                  endIndent: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Container(
                    height: size.height * .6,
                    width: size.width * .85,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 7),
                              blurRadius: 10,
                              color: kSecondaryColor.withOpacity(0.6))
                        ],
                        borderRadius: BorderRadius.circular(13),
                        color: kTextColor),
                    child: const NewsLink(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewsLink extends StatelessWidget {
  const NewsLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ข่าวสาร',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://www.sanook.com/news/8000790/'),
                    mode: LaunchMode.externalApplication);
              },
              child: const NewsList(
                title:
                    'เพื่อไทยแนะรัฐฯใช้ถุงผลิตจากมันสำปะหลังช่วยเกษตรกรและไม่สร้างภาระประชาชน ',
                subtitle:
                    'เพื่อไทยจี้รัฐรณรงค์สร้างจิตสำนึกห้างสรรพสินค้าร้านสะดวกซื้ออย่าเอากำไรลูกค้ามากเกินค้านนโยบายของรัฐบาลที่สร้างภาระให้กับประชาชน',
                image: 'assets/images/news_image1.jpg',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://www.sanook.com/news/7969754/'),
                    mode: LaunchMode.externalApplication);
              },
              child: const NewsList(
                title:
                    'จ่ายแล้ว ประกันรายได้มันสำปะหลังงวดแรก เกษตรกรรับสิทธิ์กว่า 40,000 ครัวเรือน',
                subtitle:
                    'รองนายกฯจุรินทร์KickOffจ่ายประกันรายได้มันสำปะหลังงวดแรกวันนี้ส่วนต่างกก.ละ0.23บาท เกษตรกรได้มากสุดครอบครัวละ 2.3 หมื่นบาท',
                image: 'assets/images/news_image2.jpg',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://www.sanook.com/news/7586050/'),
                    mode: LaunchMode.externalApplication);
              },
              child: const NewsList(
                title:
                    'ชาวบ้านหนองบุญมากสุดช้ำ ถูกกลุ่มคนร้ายบุกขโมยถอน "มันสำปะหลัง" หายหลายตัน',
                subtitle:
                    'ชาวบ้านหนองบุญมากสุดซ้ำถูกกลุ่มคนร้ายบุกขโมยถอนมันสำปะหลังหายหลายตัน',
                image: 'assets/images/news_image3.jpg',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://www.sanook.com/news/7498062/'),
                    mode: LaunchMode.externalApplication);
              },
              child: const NewsList(
                title:
                    '"โจรขโมยมันสำปะหลัง" อาละวาดหนัก หลังราคารับซื้อสูง ล่าสุดถูกขโมยไป 1 ตัน',
                subtitle:
                    'ชาวบ้านในอำเภออุบลรัตน์ จังหวัดขอนแก่น ยังคงถูกคนร้ายขโมยเข้าไปถอนมันสำปะหลังต่อเนื่อง หลังราคารับซื้อสูง โดยผู้เสียหายรายล่าสุดถูกขโมยไปกว่าน้ำหนักกว่า 1 ตัน',
                image: 'assets/images/news_image4.PNG',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://www.sanook.com/news/1175302/'),
                    mode: LaunchMode.externalApplication);
              },
              child: const NewsList(
                title:
                'ชาวบ้านพบระเบิดในป่ามันสำปะหลังระยอง',
                subtitle:
                'ตร.รับแจ้งพบระเบิดเอ็ม 28 ลูกผสมของสิงคโปร์ สภาพพร้อมใช้งาน ซุกป่ามันสำปะหลัง ในเขตเมืองระยอง',
                image: 'assets/images/news_image5.PNG',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  final String title, subtitle, image;
  const NewsList({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 140,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                maxLines: 3,
                //overflow: TextOverflow.v,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 10,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
