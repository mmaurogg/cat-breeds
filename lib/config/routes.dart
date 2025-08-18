import 'package:catbreeds/domain/entities/cat_breed_entity.dart';
import 'package:catbreeds/presentation/UI/home_page.dart';
import 'package:catbreeds/presentation/UI/cat_detail_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  onException: (_, GoRouterState state, GoRouter router) {
    state.fullPath == '' ? router.go('/') : router.go('/');
  },
  initialLocation: '/cats',
  routes: [
    GoRoute(
      path: '/cats',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return CatDetailPage(
              catId: id,
              catType: state.extra as CatBreedModel,
            );
          },
        ),
      ],
    ),
  ],
);
