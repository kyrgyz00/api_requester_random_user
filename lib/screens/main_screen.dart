import 'package:f_practice_api_bloc/cubit/cubit/users_cubit.dart';
import 'package:f_practice_api_bloc/helpers/error_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: prefer_final_fields
  late UsersBlocCubit _blocCubit;

  @override
  void initState() {
    _blocCubit = UsersBlocCubit();
    _blocCubit.getUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UsersBlocCubit, UsersBlocState>(
        bloc: _blocCubit,
        listener: ((context, state) {
          if (state is ErrorState) {
             ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(getErrors(context, state.error))));
          }
        }),
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 6,
              ),
            );
          }

          if (state is UsersFetchedState) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(state.user.picture.large),
                  ),
                  Text(
                    state.user.name.first,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            width: 350,
                            child: TabBar(
                              labelColor: Colors.blue,
                              unselectedLabelColor: Colors.black,
                              indicatorColor: Colors.blue,
                              indicatorWeight: 4.0,
                              labelStyle: TextStyle(fontSize: 17),
                              tabs: [
                                Tab(
                                  text: "Main Info",
                                ),
                                Tab(
                                  text: "Location",
                                ),
                                Tab(
                                  text: "Email",
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width,
                              child: TabBarView(children: <Widget>[
                                Column(
                                  children: [
                                    PersonInfoCard(
                                      title: "Name:",
                                      infoText: state.user.name.title,
                                    ),
                                    PersonInfoCard(
                                      title: "First name:",
                                      infoText: state.user.name.first,
                                    ),
                                    PersonInfoCard(
                                      title: "Last name:",
                                      infoText: state.user.name.last,
                                    ),
                                    PersonInfoCard(
                                        title: "Gender:",
                                        infoText: state.user.gender),
                                    PersonInfoCard(
                                        title: "Date of birth:",
                                        infoText:
                                            state.user.dob.date.toString()),
                                    PersonInfoCard(
                                        title: "Age:",
                                        infoText:
                                            state.user.dob.age.toString()),
                                  ],
                                ),
                                Column(
                                  children: [
                                    PersonInfoCard(
                                        title: "Phone number:",
                                        infoText: state.user.phone),
                                    PersonInfoCard(
                                        title: "Location:",
                                        infoText: state.user.location.country),
                                    PersonInfoCard(
                                        title: "City:",
                                        infoText: state.user.location.city),
                                    PersonInfoCard(
                                        title: "Email:",
                                        infoText: state.user.email),
                                    PersonInfoCard(
                                        title: "Age:",
                                        infoText:
                                            state.user.dob.age.toString()),
                                  ],
                                ),
                                Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    PersonInfoCard(
                                        title: "Name:",
                                        infoText:
                                            state.user.id.name.toString()),
                                    PersonInfoCard(
                                        title: "Email:",
                                        infoText: state.user.email),
                                    PersonInfoCard(
                                        title: "Username:",
                                        infoText: state.user.login.username),
                                    PersonInfoCard(
                                        title: "Phone:",
                                        infoText: state.user.phone),
                                    PersonInfoCard(
                                        title: "Cell:",
                                        infoText: state.user.cell),
                                    PersonInfoCard(
                                        title: "Registered:",
                                        infoText: state.user.registered.date
                                            .toString()),
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _blocCubit.getUsers();
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class PersonInfoCard extends StatelessWidget {
  final String title;
  final String infoText;

  const PersonInfoCard(
      {super.key, required this.title, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Spacer(),
        Text(
          infoText,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
