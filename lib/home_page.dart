import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_connection.dart';
import 'bloc/bottomnav_bloc.dart';
import 'bloc/task_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _pageController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<TaskBloc>(context).add(FetchTaskEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      body: Container(
        color: Colors.pink.shade100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 40, child: Container()),
            Expanded(flex: 50, child: _profileRow()),
            Expanded(flex: 10, child: Container()),
          ],
        ),
      ),
    );
  }

  bottomNavBar() {
    return BlocBuilder<BottomnavBloc, BottomnavState>(
      builder: (context, state) {
        return BottomNavyBar(
          selectedIndex: state is PageChangeState ? state.selctedPage : 0,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            BlocProvider.of<BottomnavBloc>(context)
                .add(PageChangeEvent(selctedPage: index));

            // _pageController.animateToPage(index,
            //     duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              inactiveColor: Colors.grey,
              activeColor: Colors.pink,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Messages'),
                inactiveColor: Colors.grey,
                activeColor: Colors.pink),
            BottomNavyBarItem(
              icon: Icon(Icons.mail),
              title: Text('Users'),
              inactiveColor: Colors.grey,
              activeColor: Colors.pink,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Settings'),
              inactiveColor: Colors.grey,
              activeColor: Colors.pink,
            ),
          ],
        );
      },
    );
  }

  _profileRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            _maleProfile(),
            pinkButton(),
          ],
        ),
        Container(
          height: 300,
          width: 200,
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is FetchTaskState) {
                return PageView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                        state.data.data!.length,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _femaleProfile(state, index),
                                Row(
                                  children: [
                                    Expanded(child: Container()),
                                    smallPinkButton(Icons.message),
                                    smallPinkButton(Icons.account_circle),
                                    smallPinkButton(Icons.arrow_downward),
                                    Expanded(child: Container()),
                                  ],
                                ),
                              ],
                            )));
              }
              return Center(child: const CircularProgressIndicator());
            },
            // ),
          ),
        )
      ],
    );
  }

  _femaleProfile(FetchTaskState state, int index) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              border: Border.all(
                width: 3,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            child: Icon(Icons.account_circle, size: 124)),
        SizedBox(
          height: 8,
        ),
        Text(state.data.data![index].name ?? 'Not Found',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(state.data.data![index].gender.toString().split('.')[1]),
        Text(state.data.data![index].status.toString().split('.')[1]),
      ],
    );
  }

  _maleProfile() {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              border: Border.all(
                width: 3,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            child: Icon(Icons.account_circle, size: 124)),
        SizedBox(
          height: 8,
        ),
        Text('Uddesh Rajoriya', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Gwalior, India'),
        Text('Religon: Hindu'),
      ],
    );
  }

  pinkButton() {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.pink),
        ),
        onPressed: () {
          getHttp();
        },
        child: const Text('My Visitors'));
  }

  Widget smallPinkButton(IconData iconData) {
    return Container(
        width: 32,
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              alignment: Alignment.center),
          onPressed: () {
            getHttp();
          },
          child: Icon(
            iconData,
            size: 20,
          ),
        ));
  }
}
