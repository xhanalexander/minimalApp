import 'package:flutter/material.dart';
import 'package:minimalapp/view_models/json_view_models.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JsonViewModels>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final res = Provider.of<JsonViewModels>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minimal App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              res.data.length.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        
            ListView.builder(
              shrinkWrap: true,
              itemCount: res.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(res.data[index].userId.toString()),
                  // subtitle: Text(res.data[index].body!),
                );
              },
            ),
          ],
        ),
      )
                
    );
  }
}