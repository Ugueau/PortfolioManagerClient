import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/document.entity.dart';
import 'detail.state.dart';
import 'detail.viewmodel.dart';

class DetailedPage extends ConsumerStatefulWidget {
  final DocumentEntity _document;

  const DetailedPage(this._document, {Key? key}) : super(key: key);

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
        title: Text(
          state.document?.title ?? "",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.document?.title ?? "",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Date: ${state.document?.creationDate ?? ""}",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    _launchURL(state.document?.link ?? "");
                  },
                  child: Text("About Project"),
                ),
              ),
              SizedBox(height: 16.0),
              Wrap(
                spacing: 8.0,
                children: state.document?.categories
                    ?.map((category) => Chip(
                  label: Text(
                    category,
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.87),
                    ),
                  ),
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ))
                    .toList() ??
                    [],
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      for (var i = 0;
                      i < (state.document?.images?.length ?? 0);
                      i++)
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              state.document!.images![i],
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.width * 0.4,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                return Image.asset(
                                  "assets/404-not-found.gif",
                                  width:
                                  MediaQuery.of(context).size.width * 0.4,
                                  height:
                                  MediaQuery.of(context).size.width * 0.4,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: MarkdownBody(
                      data: state.document?.descr ?? "",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
