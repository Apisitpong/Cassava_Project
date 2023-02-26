import 'package:cassava_proj/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundScaffold,
        body: Container(
          child: SizedBox(
            child: Stack(
              children: [
                ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: 280,
                    color: kSecondaryColor,
                  ),
                ),
                // Container(
                //     padding: const EdgeInsets.only(top: 50),
                //     alignment: Alignment.topCenter,
                //     child: const Text(
                //       'Profile',
                //       style: TextStyle(color: Colors.white, fontSize: 30),
                //     )),
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 180,
                        width: 210,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/MyProfile.jpg')),
                          border: Border.all(width: 8, color: kBackgroundScaffold),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Apisitpong',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Text(
                            'Thailand, Khon kaen',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Divider(
                          color: kSecondaryColor,
                          indent: 100,
                          endIndent: 100,
                        ),
                      ),
                      const InfoCard(
                        phone: '098-4592525',
                        contact: 'apisitpongsi@kkumail.com',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,

    required this.phone,
    required this.contact,
  }) : super(key: key);
  final String  phone, contact;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 300,
      child: Card(
        color: kBackgroundColor,
        child: Column(
          children: [
            ListTile(
              title: Text(
                phone,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(
                Icons.contact_phone_sharp,
                color: kSecondaryColor,
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                contact,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(
                Icons.contact_mail_sharp,
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
