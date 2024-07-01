
import 'package:flutter/material.dart';
import 'package:news_app_api/api_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int ind = 0 ;
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: FutureBuilder(
        future: ApiManager.getSourcesTopHeadLines(),
        builder: (context, snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(child: Text("error"));
          }

            var sourceList = snapshot.data?.sources??[];
            return Column(
              children: [
                DefaultTabController(
                    length: sourceList.length,
                    child: TabBar(
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      onTap: (val){
                        ind = val ;
                        setState(() {

                        });
                      },
                      tabs: [
                        for(int i=0;i<sourceList.length;i++)...[
                          Tab(child: Text(sourceList[i].name??""),)
                         ]
                        ]
                    )
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index)
                  {
                    return Container(
                      child: Text(sourceList[index].name??""),
                    );
                  },
                  itemCount: sourceList.length,)
                )
              ],
            );
          }
      ),
    );
  }
}
