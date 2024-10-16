import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

class Page_PageList extends StatelessWidget {
  const Page_PageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Pages in this web app'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(30),
        itemCount: fco.pagePaths.length,
        itemBuilder: (context, index) {
          final label = fco.pagePaths[index];
          return Row(mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  context.go(label);
                },
                child: Text(label),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.delete, color: Colors.red,),
              )
            ],
          );
        },
      ),
    );
  }
}
