import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maku_fitness_app/utils/page_transitions.dart';

GoRoute pageRoute({
  required String path,
  required String name,
  required Widget Function(BuildContext, GoRouterState) page,
  List<GoRoute> routes = const [],
  PageTransitionType transition = PageTransitionType.defaults,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => PageTransitions.buildTransition(
      page: page(context, state),
      state: state,
      type: transition,
    ),
    routes: routes,
  );
}
