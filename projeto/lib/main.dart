import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/view/companies.dart';
import 'package:projeto/view/companyEspecific.dart';
import 'package:projeto/view/home.dart';
import 'package:projeto/view/testApi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/UFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(MyProject());
} 

// class MyProject extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Estados - BR',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Estados - BR'),
//         ),
//         body: Center(
//           child: TestApi(),
//         ),
//       ),
//     );
//   }
// }

class MyProject extends StatefulWidget {
  @override
  _MyProjectState createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (_) => Home(),
        AppRoutes.COMPANY_ESPECIFIC: (_) => CompanyEspecific(),
        AppRoutes.COMPANIES: (_) => ListCompanies(),
      },
    );
  }
}

class AppRoutes {
  static const HOME = '/';
  static const COMPANY_ESPECIFIC = '/company-especific';
  static const COMPANIES = '/companies';
}