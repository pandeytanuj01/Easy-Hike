import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_hike/screens/onboarding.dart';
import 'package:easy_hike/screens/search/search.dart';
import 'package:easy_hike/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().user, //Auth Stream
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data?.uid == null) {
            return OnBoarding();
          } else {
            return MainSearch();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
