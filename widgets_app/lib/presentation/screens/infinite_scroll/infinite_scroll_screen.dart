import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesId = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  Future loadNextPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if (!isMounted) {
      return;
    }
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 3));
    if (!isMounted) {
      return;
    }

    isLoading = false;
    final lastId = imagesId.last;
    imagesId.clear();
    imagesId.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      return;
    }
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    super.dispose();
    isMounted = false;
    scrollController.dispose();
  }

  void addFiveImages() {
    final lastId = imagesId.last;
    imagesId.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
              controller: scrollController,
              itemCount: imagesId.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder: AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imagesId[index]}/500/300'));
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        //child: CircularProgressIndicator(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
