import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/pages/login_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  }

class _MyAppState extends State<MyApp> { //Login Page
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: LoginScreen()
    );
  }
}
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text('Login Screen'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [

//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 30
//               ),
//               child: SizedBox( //Logo
//                 height: 250,
//                 child: Image.asset(
//                   "images/pngtree-bank-icon-png-image_1757496.jpg",
//                   fit: BoxFit.contain
//                 ),
//               ),
//             ),

//             Padding( //Wrapping in padding adds gap
//               padding: const EdgeInsets.symmetric(
//                 vertical: 30,
//                 horizontal: 16
//               ),
//               child: Form( //Email
//                 child: Column(
//                   children: [
              
//                     TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         hintText: 'Enter Email',
//                         prefixIcon: Icon(Icons.email),
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (String value) {
              
//                       },
//                       validator: (value) {
//                         return value!.isEmpty ? 'Please input an email' : null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//              Padding( //Wrapping in padding adds gap
//                padding: const EdgeInsets.symmetric(
//                 horizontal: 16
//               ),
//                child: Form( //Password
//                 child: Column(
//                   children: [
               
//                     TextFormField(
//                       keyboardType: TextInputType.visiblePassword,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         hintText: 'Enter password',
//                         prefixIcon: Icon(Icons.password),
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (String value) {
               
//                       },
//                       validator: (value) {
//                         return value!.isEmpty ? 'Please input a password' : null;
//                       },
//                     ),
               
//                     SizedBox(height: 10),
//                     Builder(
//                       builder: (context) {
//                         return Padding( //Login Button
//                           padding: const EdgeInsets.symmetric(horizontal: 40),
//                           child: MaterialButton(
//                             minWidth: double.infinity,
//                             onPressed: () {
//                               Navigator.of(context)
//                               .push(
//                                 MaterialPageRoute(
//                                   builder: (context) => signupPage()
//                                   ),
//                               );
//                             },
//                             child: Text('Login'),
//                             color: const Color.fromARGB(255, 83, 83, 83),
//                             textColor:Colors.white,
//                           ),
//                         );
//                       }
//                     ),
//                     Builder(
//                       builder: (context) {
//                         return Padding( //SignUp button
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 160,
//                             vertical: 20
//                           ),
//                           child: MaterialButton(
//                             minWidth: double.infinity,
//                             onPressed: () {
//                               Navigator.of(context)
//                               .push(
//                                 MaterialPageRoute(
//                                   builder: (context) => signupPage()
//                                 ),
//                               );
//                             },
//                             child: Text('Signup'),
//                             color: const Color.fromARGB(255, 83, 83, 83),
//                             textColor:Colors.white,
//                           ),
//                         );
//                       }
//                     ),
//                   ],
//                 ),
//               ),
//              ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// Add the second screen
// class signupPage extends StatefulWidget { //SignUp Page
//   const signupPage({Key? key}) : super(key: key);

//   @override
//   _signupState createState() => _signupState();
// }

// class _signupState extends State<signupPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Sign-Up Page"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 30
//               ),
//               child: SizedBox( //Logo
//                 height: 150,
//                 child: Image.asset(
//                   "images/pngtree-bank-icon-png-image_1757496.jpg",
//                   fit: BoxFit.contain
//                 ),
//               ),
//             ),

//           Padding( //Wrapping in padding adds gap
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16
//               ),
//               child: Form( //Email Signup
//                 child: Column(
//                   children: [
              
//                     TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         hintText: 'Enter Email',
//                         prefixIcon: Icon(Icons.email),
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (String value) {
              
//                       },
//                       validator: (value) {
//                         return value!.isEmpty ? 'Please input an email' : null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//           Padding( //Wrapping in padding adds gap
//               padding: const EdgeInsets.symmetric(
//                 vertical: 30,
//                 horizontal: 16
//               ),
//               child: Form( //Email Signup
//                 child: Column(
//                   children: [
              
//                     TextFormField(
//                       keyboardType: TextInputType.visiblePassword,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         hintText: 'Enter Password',
//                         prefixIcon: Icon(Icons.password),
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (String value) {
              
//                       },
//                       validator: (value) {
//                         return value!.isEmpty ? 'Please input an password' : null;
//                       },
//                     ),
                  
//                     SizedBox(height: 14),//Gap

//                     Builder( //SignUp button
//                       builder: (context) {
//                         return Padding( 
//                           padding: const EdgeInsets.symmetric(horizontal: 40),
//                           child: MaterialButton(
//                             minWidth: double.infinity,
//                             onPressed: () {
//                               Navigator.of(context)
//                               .push(
//                                 MaterialPageRoute(
//                                   builder: (context) => MyApp()
//                                 ),
//                               );
//                             },
//                             color: const Color.fromARGB(255, 83, 83, 83),
//                             textColor:Colors.white,
//                             child: Text('Signup'),
//                           ),
//                         );
//                       }
//                     ),

//                     Builder( // Back to login
//                       builder: (context) {
//                         return Padding( 
//                           padding: const EdgeInsets.symmetric(horizontal: 40),
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.of(context)
//                               .push(
//                                 MaterialPageRoute(
//                                   builder: (context) => MyApp()
//                                 ),
//                               );
//                             },
//                             style: TextButton.styleFrom(
//                               foregroundColor: const Color.fromARGB(255, 99, 99, 99),
//                             ),
//                             child: Text('Back to login'),
//                           ),
//                         );
//                       }
//                     ),

//                   ],
//                 ),
//               ),
//             ),
          
//           ]
//         ),
//       ),
//     );
//   }
// }