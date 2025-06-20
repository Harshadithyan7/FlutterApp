import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:newapss/screens/wallpaper_icons.dart';

KeyList keyList = KeyList();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.green,
      ),
      home: const WallPaperIcons(),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List apiData = [];
  bool loading = false;

  TextEditingController countrySearch = TextEditingController();

  void initState() {
    super.initState();
  }

  getData() async {
    var dio = Dio();
    try {
      loading = true;
      debugPrint("getDataIsRunning");
      setState(() {});
      dio.options.contentType = Headers.jsonContentType;
      var response = await dio.get(
        'http://universities.hipolabs.com/search',
        queryParameters: {"name": countrySearch.text},
      );
      final data = response.data;
      loading = false;

      apiData = data;
    } catch (e) {
      debugPrint("errrorr....${e}");
      loading = false;
    }
    return apiData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("University List")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 70,
                child: TextField(
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {});
                  },
                  controller: countrySearch,
                  decoration: InputDecoration(
                    hintText: "Enter your country",
                    // errorText: countr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: countrySearch.text.isEmpty
                    ? () {
                        debugPrint("emp on press");
                      }
                    : () async {
                        await getData();
                        // debugPrint("Search tapped");
                        debugPrint("list element...${apiData.length}");
                        // debugPrint(apiData[0]["name"]);
                        setState(() {});
                      },
                child: Text('Search'),
              ),
            ],
          ),
          loading
              ? CircularProgressIndicator()
              : apiData.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: apiData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text(apiData[index]["name"]));
                    },
                  ),
                )
              : Center(child: Text("No data found")),
        ],
      ),
    );
  }
}
