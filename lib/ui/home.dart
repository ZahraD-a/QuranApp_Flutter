import 'package:alqurani/data/utils/data.dart';
import 'package:alqurani/data/utils/style.dart';
import 'package:alqurani/ui/about.dart';
import 'package:alqurani/ui/listpage/ayatkursi.dart';
import 'package:alqurani/ui/listpage/jadwalsholat.dart';
import 'package:alqurani/ui/listpage/listalquran.dart';
import 'package:alqurani/ui/listpage/listasmaul.dart';
import 'package:alqurani/ui/listpage/listdoa.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: Drawers()),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About()));
                    },
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 60.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          Static.appName,
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                expandedHeight: 150.0,
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.6),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text(
                        'Salat time',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Les Sourates',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Duas Quotidiens',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Noms D"Allah',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Ayat qursi',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              JadwalSholat(),
              ListAlquran(),
              ListDoa(),
              ListAsmaul(),
              AyatKursi(),
            ],
          ),
        ));
  }
}

class Drawers extends StatelessWidget {
  const Drawers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Text(
                'Alqurani',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              AppStyle.spaceH5,
              Text(
                'By Duende, Fiaz Luthfi',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        ListTile(
            title: Text('About'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/about')),
        ListTile(
            title: Text('Settings'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/settings')),
        ListTile(
            title: Text('Arah Kiblat'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/kiblah')),
      ],
    );
  }
}
