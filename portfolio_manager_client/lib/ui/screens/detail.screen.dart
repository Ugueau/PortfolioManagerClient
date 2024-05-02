import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/document.entity.dart';
import 'detail.state.dart';
import 'detail.viewmodel.dart';

class DetailedPage extends ConsumerStatefulWidget {
  final DocumentEntity _document;

  const DetailedPage(this._document, {super.key});

  @override
  ConsumerState<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends ConsumerState<DetailedPage> {
  @override
  void initState() {
    ref.read(detailProvider.notifier).setPlace(widget._document);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DetailState state = ref.watch(detailProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text((state.document?.title) ?? ""),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            state.document!.imgPath!,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Image.asset(
                                "assets/404-not-found.gif",
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.document?.title ?? "",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              state.document?.creationDate ?? "",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Catégories associées: ${state.document?.categoryTitles}\n',
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 16.0),
                            MarkdownBody(
                                data: state.document?.descr ?? "",
                                styleSheet: MarkdownStyleSheet(
                                  p: const TextStyle(fontSize: 16),
                                  listBullet: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
