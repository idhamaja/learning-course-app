import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/common/routes/bloc_observer.dart';
import 'package:learning_course_app/common/services/storage_services.dart';

class Global {
  static late StorageServices storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();

    // await Firebase.initializeApp();
    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
            apiKey: 'AIzaSyB9EO3n2kuVUrGnaM-Av7-KV6Sl3ZmJLPc',
            appId: '1:542407611065:android:c4d9a8a0df121c9c6fc168',
            messagingSenderId: '542407611065',
            projectId: 'learning-course-app',
          ))
        : await Firebase.initializeApp();
    storageService = await StorageServices().init();
  }
}
