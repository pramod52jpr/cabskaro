
import 'package:http/http.dart' as http;

void fetchData() async {
  String developerAccessToken = "t0ragdJ5NJNbFB8m1KjEMs2JZrU6Sezz"; // Replace with your actual token

  final response = await http.get(
    Uri.parse("https://api.chatbot.com/v2/stories"),
    headers: {'authorization': 'Bearer $developerAccessToken'},
  );

  if (response.statusCode == 200) {
    print("Response: ${response.body}");
  } else {
    print("Error: ${response.statusCode}, ${response.reasonPhrase}");
  }
}
