import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/features/topup/presentation/pages/topup_page.dart';
import 'package:topup_app/injection.dart';

class App extends StatelessWidget {
  const App({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => createTopupBloc()
        )
      ], 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Topup Page',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const TopupPage(),
      )
    );
  }
}
