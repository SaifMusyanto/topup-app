import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc/topup_form_bloc.dart';
import 'package:topup_app/features/topup/presentation/pages/topup_page.dart';
import 'package:topup_app/dependency_injection.dart';
import 'package:topup_app/features/topup/presentation/pages/widgets/topup_form.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<TopupBloc>()),
        BlocProvider(create: (_) => serviceLocator<TopupFormBloc>()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Topup Page',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const TopupPage(),
      ),
    );
  }
}
