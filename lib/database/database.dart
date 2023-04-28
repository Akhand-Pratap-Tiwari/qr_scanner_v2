import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../secrets/secrets.dart';

class User {
  String name;
  String regId;
  String entryTime;
  String exitTime;

  static const Map<String, String> defMap = {
    'name': 'ResponseError',
    'regId': 'ResponseError',
    'entryTime': 'ResponseError',
    'exitTime': 'ResponseError',
  };

  User({
    required this.name,
    required this.regId,
    required this.entryTime,
    required this.exitTime,
  });

  Map<String, String> toMap() {
    return {
      'name': name,
      'regId': regId,
      'entryTime': entryTime,
      'exitTime': exitTime,
    };
  }

  User.fromMap(Map<String, dynamic>? map)
      : name = (map ?? defMap)['name'] ?? 'NullFieldError',
        regId = (map ?? defMap)['regId'] ?? 'NullFieldError',
        entryTime = (map ?? defMap)['entryTime'] ?? 'NullFieldError',
        exitTime = (map ?? defMap)['exitTime'] ?? 'NullFieldError';

  void displayData() => debugPrint('debug: $name $regId $entryTime $exitTime');
}

class MongoDatabase {
  static String dbStr = s_dbStr;
  static Db db = Db(dbStr);
  static DbCollection userCollection = db.collection(s_userCollection);

  static connect() async {
    db = await Db.create(dbStr);
    await db.open();
    userCollection = db.collection('eventTicket');
  }

  static insert(User user) async =>
      await userCollection.insertAll([user.toMap()]);

  static Future<User> fetch({required String regId}) async {
    return User.fromMap(
      await userCollection.findOne(
        where.eq("regId", regId).fields(
          [
            'name',
            'regId',
            'entryTime',
            'exitTime',
          ],
        ),
      ),
    );
  }

  // static update({required String regId}) {
  //   userCollection.updateOne(
  //       where.eq('regId', regId), 
  //       modify.set('is_checked_in', 'True'));
  // }
}
