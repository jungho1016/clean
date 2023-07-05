import 'package:clean/data/repository/pixabay_repository_imple.dart';
import 'package:clean/domain/model/photo.dart';
import 'package:clean/presentation/detail/detail_screen.dart';
import 'package:clean/presentation/main/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../presentation/main/main_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
        path: '/main',
        builder: (context, state) {
          return ChangeNotifierProvider(
              create: (_) => MainViewModel(PixbayResultRepositoryImple()),
              child: const MainScreen());
        },
        routes: [
          GoRoute(
              path: 'detail',
              builder: (context, state) {
                final photo = state.extra as Photo;
                return DetailScreen(
                  photo: photo,
                );
              }),
        ]),
  ],
);
