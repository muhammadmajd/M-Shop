import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:googleapis_auth/auth_io.dart'as auth;
class PushNotificationService{

  static Future<String> getAccessToken() async{
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "tinder-c2ca6",
      "private_key_id": "ee17204ca73dbcf23507be8c2480fad2fdb603f4",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDUaLIDfbzSX2GI\n2C2by+fUjbodOhjbBTjuThZEHz390B28Y2hRJoxHE66XXiYI8O/+oxTen6R0MU53\n2cxvT0MXnP9N1INWFir7zm6NKfp4HIYSYYDjAPswfKROQFPBMLqHXluAfzGegDYF\njvuDv5/fV89rA3cK4zTk68lzPP59RAp1l4qSUG8Kj3Y5/50i+GTVYp4SVnru8YhS\n5RHwACo/8UzNisRyVx1lDZfkTjtR0kWYkoqbG3KCcg+hTtnCumR/IeJcXGNFxlJm\nqDXnVRG5IK0lZv9o9ix2h18cGyNxzoXgF6fdQUsbTQtAP8RNUSwWbT5yGlkf1nDF\nf/lGTeylAgMBAAECggEADXZWlKVlz/OJoVG05Picczqe/svi2BF8VTuPv7Y3M0dQ\nddMwa7bvZxsr5/NoomJwON7/K0j09FmiU92do7m4p94kdDtcLkWYvdLh64KAmcI9\nC8cwPbL0jf3TBWlK+vs//I+8vufQ2O8z/VAy8rEKIe6qemmCzvwtgGDNU3IciGB8\n8mebQlc7FIe0u20Jh+hSo9yZ+Kyd0tkRvG/oQe+jkqIKzJ+PZ3QgttMpCke1J3r2\n7qqSIkchkZhSmcL1Htv86bYNs5fVkJSMDswKtJMmn151NbY9F1I9i7DVxNQsjiKR\nm0L8r53cF6NAzFh1KuaoXKegEtq6oDLqJSkwFqXkNQKBgQD89U+krUb6ex2urpFB\ncCvrGnazXu/daoRZaiHDA8tTLva4lESQvSDf80/LubTTAzEGJSD0JOJjBUmUHbK2\nE7hjcJ3imOJD74bzrAerrZoxmFGDPTQQJIt0UycgY9Mo5UQmu9A64FAyVYfzj3DS\nv7MbAGBAUjmLRTrzQ8djjjFTjwKBgQDW9o9phiJULVGHlS7mb6YrCO7iq+16Jx8u\nsXBpP9PHal6PnzZhn4FMPS1B8GnSM0yE5Ge9J9nzZsWSNcuqR3/+nCYRCtr1ImMo\n3JnVB5c4Jet1VaFZy4PVFszQEcuaA4Y3lZBMgv/diKaEP/bkCJrtho0PjrSFxOZp\n9vIXy0KSiwKBgQDKjqlC5dpDc1jWa0U3kFoqvhs1ER2kQMpQS1NTtPMY3i+EqH2r\nJTdw/YX1TfTFT/XuxMZ5mhuKTU6ZA5r6gBoTzrcvH1t4KRL4htXxnGcvtZf4LodF\nMe5VrMxU/Hq3cbc8CQL6UmsFk0X1O/SNXiJOyeNJPk6D/mDxMWI1j0RicwKBgFnx\n5OQEigyqwbh3hZ5KDT9oh3w08DLyd6uz9xMy78w7B8IUnk6OzS03U96JV93qNRRN\n9dJCAIJF+FlLRSLEtBu2/n6XCjMT5mXMmFl4yZ9mznTUFaVa8JiS57QQHh8dZmWP\noUdCcQkjCnm/wfB8YUcNy6w8y/BFCRxBhd7K39otAoGAGwBCKVLkdrk8zsSpPW1r\negLq0Uzp68BYbhgG02QPe1Kk+UG22vz627D9kEB7UQFW2dckGakwYAXCz4g08BsI\nc6VsetP+ocm11kJ/0ousiDBDJG3NJ0OOUKQ+FxyU57TzpLHL1zQjcufCnNo1c37Z\nT96D4RzBA/qtVy1e9a2fsyM=\n-----END PRIVATE KEY-----\n",
      "client_email": "tindermm@tinder-c2ca6.iam.gserviceaccount.com",
      "client_id": "114499469556741677418",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/tindermm@tinder-c2ca6.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };


    final serviceAccountJson1 = {
      'apiKey': 'AIzaSyCxhK1WtJMGO76kGwJvDoe2Y5kMHnzzNWI',
      'appId': '1:169808652911:web:4010f9dfd88b7e9956fb9a',
      'messagingSenderId': '169808652911',
      'projectId': 'jeleappstest-8201d',
      'authDomain': 'jeleappstest-8201d.firebaseapp.com',
      'storageBucket': 'jeleappstest-8201d.appspot.com',
      'measurementId': 'G-HLWDMK8WFK',
    };

    List<String> scopes =[
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
       'https://www.googleapis.com/auth/firebase.messaging',];
    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
    scopes);
    //get the access token

    auth.AccessCredentials credintials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      client
    );
    client.close();
    print('credintials');
    //print(credintials.accessToken.data);
    return credintials.accessToken.data;

  }

  static  Future<String> sendNotificationToSelectedUser(String deviceToken,String title,String body )
  async {
    String  serverKey = await getAccessToken();
    String endPointFirebaseCloudMessaging ='https://fcm.googleapis.com/v1/projects/jeleappstest-8201d/messages:send';
    //"token":"d9c2dPb9SnuRrqdpKsuD0a:APA91bH7Be7l3uLOMvLxD_VHbK5Q7kpQO5adupWqQuQ6pugkMaucDngItgqkJ41XqNfnlUcI-FGCMLdIfA3ALAyumhPhXW4nqXTT8LeQeaEx8LcLXY32SkVubbJpLqL3VxIAj2Mi5m13",
      print('GlobalVariables.fcm_token');
    //Google Play Services:
    final Map<String, dynamic> message ={
      "message": {
        //"token": GlobalVariables.fcm_token,
        "topic":"jeleapps",
        "notification": {
          "title": "Jeleapp Notification",
          "body": "Тестовое уведомление от JELEApp"
        },
        "data": {
          "Sender": "Muhammad",
          "information": "this is a test data",
        }
      },
    };

    final http.Response response = await http.post(
      Uri.parse(endPointFirebaseCloudMessaging),
      headers:  <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',
      },
      body: jsonEncode(message),
    );
    String result='';
    if(response.statusCode == 200)
      {
         result="Message has been sent successfully";
      }
    else
      {
        result="faild to send Message ";
      }

return result;
  }

}