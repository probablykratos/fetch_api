import 'package:fetch_api/bloc/user_bloc.dart';
import 'package:fetch_api/data/provider/user_provider.dart';
import 'package:fetch_api/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_event.dart';
import 'bloc/user_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: RepositoryProvider(
        create: (context) => UserRepository(UserProvider()),
        child: BlocProvider(
          create: (context) => UserBloc(context.read<UserRepository>()),
          child: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(title),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is UserErrorState) {
            return Center(child: Text("Error"));
          }
          if (state is UserSuccessState) {
            List<String> userList = state.userModel.aliases;
            return userList.isNotEmpty
                ? ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Card(
                          child: ListTile(title: Text(userList[index])),
                        ),
                      );
                    },
                  )
                : const Center(child: Text("NO data Found"));
          }
          return const Center(child: Text("Unknown State"),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Refresh',
        onPressed: () {context.read<UserBloc>().add(LoadUserEvent()); },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
