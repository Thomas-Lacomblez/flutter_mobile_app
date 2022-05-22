import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/google_signIn_service.dart';

import '../models/compte.dart';
import '../services/compte/compteService.dart';

class ComptePage extends StatefulWidget {
  const ComptePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComptePageState();
}

class _ComptePageState extends State<ComptePage> {

 late Future<List<Compte>> futureCompte;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    futureCompte = fetchCompte();
  }

 @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          title: Text(
            "connecté en tant que ${user.email!}",
            style: const TextStyle(fontSize: 14),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                GoogleSignInService().signOutWithGoogle();
                FirebaseAuth.instance.signOut();
              },
              child:const Icon(Icons.logout),
            )

          ],
      ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: FutureBuilder<List<Compte>> (
                    future: futureCompte,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount:  snapshot.data!.length,
                          itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.account_balance ),
                            title: Text("${snapshot.data![index].solde} €"),
                            subtitle:  Wrap(
                              children: [
                                  Text(
                                  "date de création du compte : ${snapshot.data![index].dateCreation.day }/${snapshot.data![index].dateCreation.month.toString()}/${snapshot.data![index].dateCreation.year}"
                                  ),
                                  Text(
                                  "Type de compte :  ${snapshot.data![index].type}"
                                  ),
                              ],
                            ),
                          onTap: () => {

                          },
                          trailing: const Icon(Icons.menu),
                        );
                         },
                         
                        );
                      }
                      else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ]),
      ),
        ),
    );
  }

}