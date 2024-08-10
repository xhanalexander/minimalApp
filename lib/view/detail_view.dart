import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:minimalapp/components/cards.dart';
import 'package:minimalapp/components/loadings.dart';
import 'package:minimalapp/view_models/json_view_models.dart';
import 'package:provider/provider.dart';

class DetailPages extends StatefulWidget {
  final int ids;

  const DetailPages({
    super.key,
    required this.ids,
  });

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JsonViewModels>(context, listen: false).getSingleData(id: widget.ids);
    });
  }

  onDelete() async {
    // ---------------------------------- Delete Data ---------------------------------- //
    await Provider.of<JsonViewModels>(context, listen: false).deleteData(id: widget.ids);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data has been deleted'),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final req = Provider.of<JsonViewModels>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Detail To Do : ${widget.ids}')),
      body: Column(
        children: [

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
                                titleTextName: req.searchData.title![widget.ids],
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
                                titleTextName: req.searchData.body![widget.ids],
                                onTaps: () {},
                              ),
                            ),
                          ),
                        )
                      )
                    ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => onDelete(),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
    );
  }
}