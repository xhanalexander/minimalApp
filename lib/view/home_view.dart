import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:minimalapp/components/cards.dart';
import 'package:minimalapp/components/loadings.dart';
import 'package:minimalapp/components/search.dart';
import 'package:minimalapp/view/detail_view.dart';
import 'package:minimalapp/view/form_view.dart';
import 'package:minimalapp/view/search_views.dart';
import 'package:minimalapp/view_models/json_view_models.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int defaulPages = 1;
  int defaultLimits = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JsonViewModels>(context, listen: false).getDataList(
        pages: defaulPages,
        limits: defaultLimits,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final res = Provider.of<JsonViewModels>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: RefreshIndicator(
        onRefresh: () async =>
            Provider.of<JsonViewModels>(context, listen: false).getDataList(
          pages: 1,
          limits: 10,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SearchBarButton(
                onClicked: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPages()),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // ---------------------------------- Get List Data ---------------------------------- //
            res.status == Status.loading && res.data.isEmpty
                ? Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 18),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const Loadings();
                      },
                    ),
                  )
                : res.status == Status.error
                    ? const Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error),
                              SizedBox(height: 10),
                              Text('Error'),
                            ],
                          ),
                        ),
                      )
                    : Flexible(
                        flex: 1,
                        child: AnimationLimiter(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 18),
                            itemCount: res.data.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                child: SlideAnimation(
                                  horizontalOffset: 70.0,
                                  duration: const Duration(milliseconds: 600),
                                  child: CustomCards(
                                    titleTextName: res.data[index].title!,
                                    onTaps: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPages(
                                            ids: res.data[index].id!,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
