import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_manager_client/ui/screens/home.state.dart';
import 'package:portfolio_manager_client/ui/screens/home.viewmodel.dart';
import 'package:portfolio_manager_client/ui/screens/manage_project.screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_app_file/open_app_file.dart';

import '../customs/grid_element.dart';
import 'detail.screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Portfolio"),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 12.0),
        //     child: IconButton(
        //       icon: const Icon(Icons.settings),
        //       onPressed: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => const ManageProjectPage()));
        //       },
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          "assets/profile_picture.jpg"), // Replace with your image URL
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        _openPDF();
                      },
                      icon: const Icon(Icons.download),
                      label: const Text("CV"),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hugo MILLOT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Contact : 06 21 69 55 63",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: () {
                          _launchEmail("hugomillot2003@gmail.com");
                        },
                        child: const Text(
                          "hugomillot2003@gmail.com",
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Colors.blue, // Change color for link appearance
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _launchURL("https://github.com/Ugueau");
                                  },
                                  icon: Image.asset(
                                    "assets/github-mark.png",
                                    width: 30,
                                    // Adjust the width to fit your needs
                                    height: 30,
                                    // Adjust the height to fit your needs
                                    fit: BoxFit.cover,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    _launchURL(
                                        "https://linkedin.com/in/hugomillot");
                                  },
                                  icon: Image.asset(
                                    "assets/linkedin.jpg",
                                    width: 30,
                                    // Adjust the width to fit your needs
                                    height: 30,
                                    // Adjust the height to fit your needs
                                    fit: BoxFit.cover,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.8, // Adjust this aspect ratio as needed
                ),
                itemCount: state.documents?.data != null
                    ? state.documents?.data.length
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailedPage(state.documents!.data[index])));
                    },
                    child: GridElementCard(
                      imagePath: "${state.documents?.data[index].images?[0]}",
                      title: "${state.documents?.data[index].title}",
                      date: "${state.documents?.data[index].creationDate}",
                    ),
                  );
                },
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ElevatedButton(
          //     onPressed: ref.watch(homeProvider.notifier).fetchDocuments,
          //     child: const Text("More"),
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  _launchEmail(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch $emailLaunchUri');
    }
  }

  void _openPDF() {
    OpenAppFile.open('assets/CV.pdf');
  }
}
