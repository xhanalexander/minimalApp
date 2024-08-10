import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minimalapp/components/cards.dart';
import 'package:minimalapp/components/loadings.dart';
import 'package:minimalapp/view_models/json_view_models.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchPages extends StatefulWidget {
  const SearchPages({super.key});

  @override
  State<SearchPages> createState() => _SearchPagesState();
}

class _SearchPagesState extends State<SearchPages> {
  final int ids = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JsonViewModels>(context, listen: false).getSingleData(id: ids);
    });
  }

  void onSearch() async {
    await Provider.of<JsonViewModels>(context, listen: false).getSingleData(id: ids);
  }

  @override
  Widget build(BuildContext context) {
    final req = Provider.of<JsonViewModels>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SearchBar(
              hintText: 'Search by ID',
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                Provider.of<JsonViewModels>(context, listen: false).getSingleData(id: int.parse(value));
              },
            ),
          ),
          const SizedBox(height: 10),
      
          // ---------------------------------- Get Data by ID ---------------------------------- //
          req.status == Status.loading
              ? const Flexible(
                  child: Loadings(),
                )
              : req.status == Status.error
                  ? const Flexible(
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
                        child: AnimationConfiguration.staggeredList(
                          position: 1,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: CustomCards(
                                titleTextName: req.searchData.title!,
                                onTaps: () {},
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
          const SizedBox(height: 20),
      
          req.status == Status.loading
              ? const Flexible(
                  child: SizedBox(
                    height: 150,
                    child: Loadings(),
                  ),
                )
              : req.status == Status.error
                  ? const Flexible(
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
                        child: AnimationConfiguration.staggeredList(
                          position: 1,
                          duration: const Duration(milliseconds: 550),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: CustomCards(
                                heights: 150,
                                titleTextName: req.searchData.body!,
                                onTaps: () {},
                              ),
                            ),
                          ),
                        )
                      )
                    ),
      
        ],
      ),
    );
  }
}