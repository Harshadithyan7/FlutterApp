import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';




class AppHome2 extends StatefulWidget {
  const AppHome2({super.key});



  @override
  State<AppHome2> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome2> {
  Future<void> HomeIconPresed() async{

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('iconPressed', true);

  }
  bool validate = false;
  List<String> namelist = [
    "fantasy",
    "horror",
    "thriller",
    "drama",
    "science",
    "romance",
  ];
  TextEditingController control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint('validate value--->>>>$validate');
    debugPrint('key data->>>${keyList.name}');
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined)),
        title: Text(
          "Movie List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 317,
                  child: TextField(onChanged: (e) {
                    setState(() {
                      validate = false;
                    });
                  },
                    controller: control,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter the Movie",
                      errorText: validate ? "Can't be Empty" : null,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (control.text.length > 0) {
                        namelist.add(control.text);
                        control.clear();
                        validate = false;
                      } else {
                        validate = true;
                      }
                    });
                  },
                  child: Text("Add"),
                ),
              ],
            ),
            Container(
              width: 400,
              height: 800,
              color: Color(0x9E9B9BFF),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(namelist[index]),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          namelist.removeAt(index);
                          debugPrint("Delete button pressed.");
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
                itemCount: namelist.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
