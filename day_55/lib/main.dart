import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/features/todo/domain/repositories/items_repo.dart';
import 'src/features/todo/domain/repositories/user_repo.dart';
import 'src/features/todo/presentation/blocs/bloc/items_bloc.dart';
import 'src/features/todo/presentation/blocs/cubit/user_cubit.dart';
import 'src/features/todo/presentation/blocs/my_bloc_observer.dart';
import 'src/features/todo/presentation/views/home_view.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ItemsRepo(),
        ),
        RepositoryProvider(
          create: (context) => UserRepo(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemsBloc(ItemsRepo()),
        ),
        BlocProvider(
          create: (context) => UserCubit(UserRepo()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
