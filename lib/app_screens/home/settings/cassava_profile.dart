import 'package:cassava_proj/app_screens/home/cassava_home.dart';
import 'package:cassava_proj/constants.dart';
import 'package:cassava_proj/login_register/login_page.dart';
import 'package:cassava_proj/provider/dark_theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../components/button_nav_bar.dart';
import '../../../login_register/image_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  //final String initials;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // File? _image;
  // final imageHelper = ImageHelper();
  // Future _pickImage(ImageSource source) async {
  //   try {
  //     final XFile? image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //       File? img = File(image.path);
  //       setState(() {
  //         _image = img;
  //         Navigator.of(context).pop();
  //       });
  //
  //   } on PlatformException catch (e) {
  //     print(e);
  //     Navigator.of(context).pop();
  //   }
  // }
  //late PickedFile _imageFile;
  //final ImagePicker _picker = ImagePicker();

  //final user = FirebaseAuth.instance.currentUser!;
  //final Future<FirebaseApp> firebase = Firebase.initializeApp();

  bool switchValue = true;
  bool isVisible = true;
  // onChangeFuntion(bool newValue){
  //   setState(() {
  //     valNotify = !valNotify;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final themeChanger = Provider.of<ThemeChanger>(context);
    return SafeArea(
      child: Scaffold(
        //comment ไว้ เพราะจะได้ปรับ Dark mode ได้
        //backgroundColor: kBackgroundColor,
        body: SizedBox(
          child: Stack(
            children: [
              ClipPath(
                //clipper: CustomShape(),
                child: Container(
                  height: size.height * 0.1,
                  color: Colors.teal,
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 30),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'ตั้งค่า',
                    style: GoogleFonts.getFont('Prompt',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   height: 50,
                  //   width: 50,
                  //   decoration: BoxDecoration(
                  //     image: const DecorationImage(
                  //         image: NetworkImage(
                  //             "https://s.isanook.com/ns/0/rp/r/w250/ya0xa0m1w0/aHR0cHM6Ly9zLmlzYW5vb2suY29tL25zLzAvdWQvMTYwMC84MDAwNzkwL3BsYXN0aWMuanBn.jpg"),
                  //         fit: BoxFit.fill),
                  //     border: Border.all(width: 8, color: kBackgroundScaffold),
                  //     shape: BoxShape.circle,
                  //   ),
                  //   child: Stack(
                  //     children: [
                  //       Positioned(
                  //           bottom: 20,
                  //           right: 45,
                  //           child: GestureDetector(
                  //             onTap: () {
                  //               showModalBottomSheet(
                  //                   context: context,
                  //                   builder: (builder) => bottomSheet());
                  //             },
                  //             child: const Icon(
                  //               Icons.camera_alt,
                  //               color: Colors.white,
                  //               size: 18,
                  //             ),
                  //           ))
                  //     ],
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 8.0),
                  //   child: Text(
                  //     'Apisitpong S.',
                  //     style:
                  //         TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: const [
                  //     Icon(
                  //       Icons.location_on,
                  //       color: Colors.grey,
                  //       size: 20,
                  //     ),
                  //     Text(
                  //       'Thailand, Khon kaen',
                  //       style: TextStyle(color: Colors.grey),
                  //     )
                  //   ],
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 15.0),
                  //   child: Divider(
                  //     color: kSecondaryColor,
                  //     indent: 100,
                  //     endIndent: 100,
                  //   ),
                  // ),
                  //  InfoCard(
                  //   phone: '098-4592525',
                  //   contact: '098-4592525',
                  // ),
                  // const SizedBox(
                  //   height: 25,
                  // ),
                  // logoutButton()
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 180,
                      width: 180,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://img.freepik.com/vector-gratis/persona-cuidando-plantas_52683-18109.jpg?size=338&ext=jpg"),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    buildOption(context, 'ภาษา'),
                    buildThemeDark('ธีม'),
                    RadioListTile<ThemeMode>(
                        title: Text(
                          'ขาว',
                          style: GoogleFonts.getFont('Prompt',
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        value: ThemeMode.light,
                        groupValue: themeChanger.themeMode,
                        onChanged: themeChanger.setTheme),
                    RadioListTile<ThemeMode>(
                        title: Text(
                          'ดำ',
                          style: GoogleFonts.getFont('Prompt',
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        value: ThemeMode.dark,
                        groupValue: themeChanger.themeMode,
                        onChanged: themeChanger.setTheme),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.getFont('Prompt',
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'ไทย',
              style: GoogleFonts.getFont('Prompt',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildThemeDark(String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.getFont('Prompt',
                fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Switch(
          //     activeColor: kPrimaryColor,
          //     //trackColor: Colors.grey,
          //     value: switchValue,
          //     onChanged: (newValue) {
          //       switchValue = newValue;
          //       isVisible = !newValue;
          //       setState(() {});
          //
          //     })
        ],
      ),
    );
  }

  Widget logoutButton() {
    return GestureDetector(
      onTap: () async {
        await Firebase.initializeApp().then((value) async {
          await FirebaseAuth.instance.signOut().then((value) =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage())));
        });
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text(
            'Logout',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Choose Profile photo',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera),
                  ),
                  const Text(
                    'Camera',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.image),
                  ),
                  const Text(
                    'Gallery',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ],
          )
        ],
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
  final String phone, contact;

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
