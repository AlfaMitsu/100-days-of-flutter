import 'package:day_31/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:linkpeek/linkpeek.dart';
import 'package:linkpeek/models/linkpeek.model.dart';
import 'package:animate_do/animate_do.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController controller = TextEditingController();
  bool searched = false;
  LinkPeekModel? linkPeekModel;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 20,
                      right: 10,
                    ),
                    suffix: FilledButton(
                      onPressed: () {
                        LinkPeek.fromUrl(controller.text).then(
                          (value) {
                            setState(
                              () {
                                linkPeekModel = value;
                                searched = true;
                              },
                            );
                          },
                        );
                      },
                      child: const Text('Search'),
                    ),
                    labelText: 'Your URL to be previewed',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: const BorderSide(color: kWhiteColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Paste URL',
                  ),
                ),
                const SizedBox(height: 20),
                if (searched)
                  ZoomIn(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: linkPeekModel!.defaultColor ?? Colors.white38,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if ((linkPeekModel!.thumbnail ?? '').isNotEmpty) ...[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(linkPeekModel!.thumbnail!),
                            ),
                            const SizedBox(height: 10),
                          ],
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                if ((linkPeekModel!.webIcon ?? '')
                                    .isNotEmpty) ...[
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxHeight: 50,
                                      maxWidth: 70,
                                    ),
                                    child: Image.network(
                                      linkPeekModel!.webIcon ?? '',
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                ],
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        linkPeekModel!.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        maxLines: 3,
                                      ),
                                      if ((linkPeekModel!.description ?? '')
                                          .isNotEmpty)
                                        Text(
                                          linkPeekModel!.description ?? '',
                                          maxLines: 4,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: kGreyColor,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.link,
                                  color: kGreyColor,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    controller.text,
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: ShapeDecoration(
                                      shape: const StadiumBorder(),
                                      color: linkPeekModel!.defaultColor ??
                                          Colors.blueGrey),
                                  child: Text(
                                    linkPeekModel!.domain ?? '',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: kWhiteColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Share',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    LinkPeek.showLinkPeekPopup(
                                      context,
                                      controller.text,
                                    );
                                  },
                                  child: const Text(
                                    'View',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                if (searched)
                  ZoomIn(
                    delay: const Duration(milliseconds: 800),
                    child: GestureDetector(
                      onTap: () {
                        searched = false;
                        controller.text = '';
                        setState(() {});
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            linkPeekModel!.defaultColor ?? Colors.white38,
                        radius: 30,
                        child: const Icon(
                          Icons.close,
                          color: kWhiteColor,
                        ),
                      ),
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
