import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:stacked/stacked.dart';

class SocketsViewModel extends BaseViewModel {
  late IO.Socket socket;

  Map _users = {};
  Map get users => _users;

  initSocket() {
    print('object 212');
    socket = IO.io('http://192.168.100.122:8080/', <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
      // 'extraHeaders': {
      //   'authorization':
      //       'Api_key eyJhbGciOiJSUzUxMiIsInR5cCI6IkFwaSBUb2tlbiJ9.eyJwYXlsb2FkIjoiN2RjNTdkMWYyMjg4Y2Y0YzU3ZmItNjY4OWI5ZDQxOTYyYzE2OTkxMjktYTg4MjcyYTU4MmJkNGJkNDQyMDc1NGRmYzJhN2I2OWQtMzc5YTNlNjM4ZTRjYjMwOTZlZDVjOTc4YjI3ZDJhOTkwYzdkMzU4YzNiODdjZTk0MzM5YiIsImlhdCI6MTcwNTQxNDE2NSwiZXhwIjoxNzA4MDA2MTY1LCJpc3MiOiJOYXRoYW4gJiBOYXRoYW4gRGlnaXRhbCJ9.MU8pnHb7TQ09HP9ljASCac2N91eOIaDbO1Af42MnbHrkWYtSyzRdPD2br8eFn9iDHUoBw2zmNQlC78P7IUjgofdHacWaJo7MvSwZfPbenRKhhPdWzj-7kPrC-ffRagvSTXSWXkYDQcOg5sz-AFxO8mCN0llpzabd6rdmY4nwyYni9wFW_XO8BfhLY3dOfE3lkrGc0dn0EX0-zkMElETKoMjyxZmAdQT3sSG4reJYotsi_BxDiDtq9R_WapLSRpwWOspMUxUSf6E7aPcnKRAny6TGZPPKLfiDHne0fdFCqkZbVUijrytyyKMVxAgYlzU5pMOn3bpB-TfWfhiJKo_hhuYBT1Y8qT5IBk-daQmzR1YXilJMHD2DombYeqU6AdvoSH3gTrqQxY6OkZM65BjZPNn6KjDc6jiC-QTmCuN3SLxXETQlecUuebznmu2FPyLHcTyAW4y1yMrQy3voyv5fHbh5FGHk3-xbXntvF_3pMUDJVaNs4VLnuhbEwWKif_tzViurDZX_B6MLa9gySvFPHrY_h14o8Wua_5A4p1dnpx1X5rpeBsS8ERARXdoLLV76YURLXfXLgSHh8Ne8xkxrIJI2hFQWVmUgxC_tlCwFp6Ryo0Au3k1oHtKDhVPRb7aoi7it4NYxaJ5U_qNK-Voya8Y-HBa0qc-K-ExlHUzAhuM',
      //   'identity': '1234'
      // },
    });

    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });

    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.on('users', (data) {
      print('object 8998');
      print(data.toString());
      _users = data;
      notifyListeners();
    });

    socket.on('personal', (data) {
      print('object b jdc d jcd');
      print(data.toString());
    });

    socket.onConnectError((err) {
      print('error $err');
    });

    socket.onError((err) {
      print('err $err');
    });

    socket.on('getMessageEvent', (newMessage) {
      print('object');
      print(newMessage);
    });
  }
}
