import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_manager_client/ui/screens/home.state.dart';
import 'package:portfolio_manager_client/ui/screens/home.viewmodel.dart';

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
      ),
      body: state.loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio:
                  0.8, // Adjust this aspect ratio as needed
                ),
                itemCount: state.documents?.data != null
                    ? state.documents?.data.length
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(
                           builder: (context) => DetailedPage(state.documents!.data[index])));
                    },
                    child: GridElementCard(
                      imagePath:
                      "${state.documents?.data[index].images?[0]}",
                      title: "${state.documents?.data[index].title}",
                      date:
                      "${state.documents?.data[index].creationDate}",
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: ref.watch(homeProvider.notifier).fetchDocuments,
              child: const Text("More"),
            ),
          ),
        ],
      ),
    );

  }
}
