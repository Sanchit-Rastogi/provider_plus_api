import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:provider_api/Models/api_model.dart';
import 'package:provider_api/Provider/apidata_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;

  void getUrlData() async {
    var url = 'https://digitalsense.in/acs/api/acs/allcategories.php#';
    var response = await http.post(url);
    print(response.statusCode);
    var d = jsonDecode(response.body);
    data = d['data'];
    addData();
  }

  void addData() {
    for (var i in data) {
      Provider.of<ApiData>(context, listen: false).addData(
        ApiModel(
          categoryId: i['category_id'],
          photo: i['photo'],
          categoryName: i['category_name'],
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUrlData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider + Api'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title:
                Text(Provider.of<ApiData>(context).apiData[index].categoryName),
            leading:
                Text(Provider.of<ApiData>(context).apiData[index].categoryId),
            trailing: Text(Provider.of<ApiData>(context).apiData[index].photo),
          );
        },
        itemCount: Provider.of<ApiData>(context).apiData.length,
      ),
    );
  }
}
