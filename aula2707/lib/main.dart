import 'package:aula2707/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'database.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

NotificationAppLaunchDetails notificationAppLaunchDetails;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {});

  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _toDoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<Tarefa> _toDoList = [];
  Tarefa _lastRemoved;

  @override
  void initState() {
    super.initState();

    DBProvider.db.initDB();
  }

  Future<List<Tarefa>> getTarefas() async {
    List res = await DBProvider.db.selectAll();

    _toDoList = [];

    res.forEach((element) {
      _toDoList.add(Tarefa.fromJson(element));
    });
    print("Os dados: \"${res.asMap()}\" ");
    return _toDoList;
  }

  void _addToDo(){
    setState(() {
      final t = Tarefa(
        id: DateTime.now().millisecondsSinceEpoch,
        ok: 0,
        titulo: _toDoController.text);

        DBProvider.db.insert(t.toJson());

        _showNotification("Tarefa Adicionada", _toDoController.text);

        _toDoController.text = "";
    });
  }

  Future<void> _showNotification(String titulo, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, titulo, body, platformChannelSpecifics,
        payload: 'item x');
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _toDoList.sort((a, b) {
        if(a.ok == 1 && b.ok != 1)
          return 1;
        else if (a.ok != 1 && b.ok == 1)
          return -1;
        else
        return 0;  
      });
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: principal(context),
    );
  }

  Widget principal(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.grey,
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _toDoController,
                    validator: (value) {
                      if(value.isNotEmpty){
                        return null;
                      }
                        return 'Insira uma tarefa!';
                    },
                    decoration: InputDecoration(
                      labelText: "Nova Tarefa",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'sans'
                      )),
                    )),
                  RaisedButton(
                    color: Colors.deepPurpleAccent,
                    child: Text("ADD",
                    style: TextStyle(
                      fontFamily: 'Sans Serif',
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )),
                    textColor: Colors.white,
                    onPressed: () {
                      if(_formKey.currentState.validate())
                          _addToDo();
                    },
                  )
              ],
              ),
            ),
          ),

          /*Expanded(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/imgg.jpg"))
              ),
              child: Text("HUEhue"),
            ),
          )*/

          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: FutureBuilder(
                future: getTarefas(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 10.0),
                      itemCount: _toDoList.length,
                      itemBuilder: buildItem
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
            )),
          ),
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_toDoList[index].titulo),
        value: _toDoList[index].ok == 1,
        secondary: CircleAvatar(
          child: Icon(_toDoList[index].ok == 1 ? Icons.check : Icons.error),
        ),
        onChanged: (c) {
          setState(() {
            _toDoList[index].ok = c ? 1 : 0;
            DBProvider.db.update(_toDoList[index].toJson(), _toDoList[index].id);
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = _toDoList[index];

          DBProvider.db.remove(_toDoList[index].id);

          final snack = SnackBar(
            content: Text("Tarefa \"${_lastRemoved.titulo}\" removida!"),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  DBProvider.db.insert(_lastRemoved.toJson());
                });
              }),
            duration: Duration(seconds: 2),
          );

          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }
}