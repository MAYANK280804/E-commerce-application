import 'package:YumeBazaar/utils/constants/image_strings.dart';
import 'package:YumeBazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widgets/appbar/appbar.dart';
// import '../../../../common/widgets/images/t_circular_image.dart';
// import '../../../../utils/constants/sizes.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YbAppBar(
        showBackArrow: true,
        title: Text('About Us', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome to Yume-Bazaar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Our mission is to provide a diverse range of high-quality products from top manufacturers, all while embracing the latest technology to enhance your online shopping journey.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Why Choose YumeBazaar?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                '- Wide Selection: Explore a vast array of products from various categories, all curated to meet your unique needs and preferences.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              const Text(
                '- Quality Assurance: We prioritize quality, partnering with renowned manufacturers to ensure that each product meets the highest standards.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              const Text(
                '- Secure Transactions: Your security is our priority. Shop with confidence, knowing that your transactions are protected by robust encryption protocols.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 18),
              const Text(
                'Meet Our Team',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ManufacturerCard(
                name: 'Mayank Agarwal',
                description:
                    'Studing Bsc (Hons)Computer Science and Software Engineering, L5-Sem I at PCPS College.\n \nDeveloper and administrative at Teqmint Innovations Pvt. Ltd., Kathmandu',
                image: YbImages.user1,
                email: 'Mayank.agarwal@study.beds.ac.uk',
                phoneNumber: '+977 9802657656',
                facebookLink: '',
                instagramLink: 'mayank.m28?igsh=MWZrdDhkcnZlODJocA==',
                linkedInLink: 'mayank-agarwal-754768277?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                whatappNumber: '+918709640748',
              ),
              const SizedBox(height: 16),
              ManufacturerCard(
                name: 'Sanjeev Sreshtha',
                description:
                    'Studing Bsc (Hons)Computer Science and Software Engineering, L5-Sem I at PCPS College.\n \nQA and Data Analyst Engineer at Exotrac LLC, a US based Company.',
                image: YbImages.user2,
                email: 'Sanjeev.Shrestha1@study.beds.ac.uk',
                phoneNumber: '+977 9841993728',
                facebookLink: 'xanjvstha',
                instagramLink: '',
                whatappNumber: '+977 9841993728',
                linkedInLink: 'sanjeev-shrestha-86243b15a?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
              ),
              const SizedBox(height: 16),
              ManufacturerCard(
                name: 'Yaman Maharjan',
                description: 'Studing Bsc (Hons)Computer Science and Software Engineering, L5-Sem I at PCPS College.\n \nDeveloper at Fintech Nepal. Maharajgunj, Kathmandu.',
                image: YbImages.user4,
                email: 'yamanmaharjan69@gmail.com',
                phoneNumber: '+977 9749423161',
                facebookLink: 'profile.php?id=100009350991523',
                instagramLink: 'ynm0_0/',
                linkedInLink: 'yamanmaharjan',
                whatappNumber: '+977 9749423161',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ManufacturerCard extends StatefulWidget {
  final String name;
  final String description;
  final String image;
  final String email;
  final String phoneNumber;
  String facebookLink;
  String instagramLink;
  String linkedInLink;
  String whatappNumber;

  // ignore: prefer_const_constructors_in_immutables
  ManufacturerCard(
      {super.key,
      required this.name,
      required this.description,
      required this.image,
      required this.email,
      required this.phoneNumber,
      this.facebookLink = '',
      this.instagramLink = '',
      this.whatappNumber = '',
      this.linkedInLink = ''});

  @override
  // ignore: library_private_types_in_public_api
  _ManufacturerCardState createState() => _ManufacturerCardState();
}

class _ManufacturerCardState extends State<ManufacturerCard> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              backgroundColor: Colors.grey, // Placeholder color
            ),
            title: Text(
              widget.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text('Study at PCPS College'),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.description),
                  const SizedBox(height: 10),
                  const Text(
                    'Contact:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => launchEmail(widget.email),
                            child: Text(
                              widget.email,
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => launchPhone(widget.phoneNumber),
                            child: Text(
                              widget.phoneNumber,
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Social Links:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      if (widget.facebookLink.isNotEmpty)
                        IconButton(
                          // icon: const Icon(Icons.facebook),
                          icon: Image.asset('assets/logos/facebook-icon.png', width: YbSizes.lg, height: YbSizes.lg),
                          onPressed: () {
                            launchFacebook(widget.facebookLink);
                          },
                        ),
                      if (widget.instagramLink.isNotEmpty)
                        IconButton(
                          // icon: const Icon(Iconsax.instagram),
                          icon: Image.asset('assets/logos/Instagram_icon.png', width: YbSizes.lg, height: YbSizes.lg),
                          onPressed: () {
                            launchInstagram(widget.instagramLink);
                          },
                        ),
                      if (widget.linkedInLink.isNotEmpty)
                        IconButton(
                          // icon: const Icon(Iconsax.link),
                          icon: Image.asset('assets/logos/linkedIn_logo.png', width: YbSizes.xl, height: YbSizes.xl),
                          onPressed: () {
                            launchLinkedIn(widget.linkedInLink);
                          },
                        ),
                      if (widget.whatappNumber.isNotEmpty)
                        IconButton(
                          // icon: const Icon(Icons.whatshot),
                          icon: Image.asset('assets/logos/whatsapp_logo.png', width: YbSizes.lg, height: YbSizes.lg),
                          onPressed: () {
                            launchWhatsApp(widget.whatappNumber);
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // launchPhone(String phoneNumber) async {
  //   final url = Uri(scheme: 'tel', path: phoneNumber);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  launchEmail(String email) async {
    final url = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // launchFacebook(String facebookLink) async {
  //   final url = Uri(
  //     scheme: 'https',
  //     host: 'www.facebook.com',
  //     path: facebookLink,
  //   );
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  // launchFacebook(String facebookLink) async {
  //   final url = 'https://www.facebook.com/$facebookLink';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // launchInstagram(String instagramLink) async {
  //   final url = 'https://www.instagram.com/$instagramLink';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // launchLinkedIn(String linkedInLink) async {
  //   final url = 'https://www.linkedin.com/in/$linkedInLink';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // launchWhatsApp(String whatappNumber) async {
  //   final url = 'https://wa.me/$whatappNumber';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  launchPhone(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchFacebook(String facebookLink) async {
    final url = 'https://www.facebook.com/$facebookLink';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchInstagram(String instagramLink) async {
    final url = 'https://www.instagram.com/$instagramLink';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchLinkedIn(String linkedInLink) async {
    final url = 'https://www.linkedin.com/in/$linkedInLink';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchWhatsApp(String whatappNumber) async {
    final url = 'https://wa.me/$whatappNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
