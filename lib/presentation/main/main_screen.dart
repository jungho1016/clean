import 'package:clean/presentation/main/main_ui_event.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<MainViewModel>().eventStream.listen((event) {
              switch (event) {
                case ShowSnackBar(:final message):
                  final snackBar = SnackBar(content: Text(message));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                case EndLoading():
                  print('로딩 끝');
              }
            }));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색 앱'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              cursorColor: Colors.teal,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.teal, width: 1),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    viewModel.fetchImages(controller.text);
                  },
                ),
                suffixIconColor: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                final photo = state.photos[index];
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: () {
                      context.push('/main/detail', extra: photo);
                    },
                    child: Hero(
                      tag: photo.id,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 4.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            photo.webformatURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
