import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remora/pages/home/requestingCar.dart';

class ShowSearchBar extends StatelessWidget {
  final String title;
  const ShowSearchBar(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        width: size.width,
        height: 20,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.search,
              size: 30,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 50,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            )
          ],
        ),
      ),
      onTap: () {
        showSearch(context: context, delegate: SearchPage(title));
      },
    );
  }
}

class SearchPage extends SearchDelegate<String> {
  final String title;
  SearchPage(this.title);
  final data = [
    'Ajaccio',
    'Bastia',
    'Venaco',
    'Calvi',
  ];
  final recentData = ['Ajaccio', 'Bastia', 'Calvi'];
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for app bar
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, "");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Center(
          child: Text(
            "Search term must be longer than two letters.",
          ),
        )
      ],
    );
  }

  // Widget optionCase(IconData icon, String title, BuildContext context) {
  //   return SizedBox(
  //     height: 50,
  //     child: Row(
  //       children: [
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         SizedBox(
  //           width: 50,
  //           child: FaIcon(
  //             icon,
  //             color: Theme.of(context).colorScheme.background,
  //             size: 35,
  //           ),
  //         ),
  //         const SizedBox(
  //           width: 20,
  //         ),
  //         Text(
  //           title,
  //           style: TextStyle(
  //               color: Theme.of(context).primaryColorDark, fontSize: 25),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Map<IconData, String> optionSuggest = {
  //   FontAwesomeIcons.camera: "Photo",
  //   FontAwesomeIcons.music: "Audio",
  //   FontAwesomeIcons.video: "Video",
  //   FontAwesomeIcons.solidFile: "Documents"
  // };

  @override
  Widget buildSuggestions(BuildContext context) {
    // show When someone search for something
    final suggestion = query.isEmpty
        ? recentData
        : data
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList(); // if la bar de recherche est vide alors tu mm'affiche "recent Data" or tu m'affiche "Data"
    return query.isEmpty
        ? title != "Search"
            ? ListView.builder(
                itemCount: recentData.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      Listener(
                        onPointerDown: (event) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (con) => const RequestingView()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            recentData[index],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                })
            : const SizedBox()
        : ListView.builder(
            itemCount: suggestion.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                  onTap: () {
                    query = suggestion[index];
                    // showResults(context);
                    print(suggestion[index]);
                    //RequestingView
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (con) => const RequestingView()));
                  },
                  leading: const Icon(Icons.location_on),
                  title: RichText(
                      text: TextSpan(
                          text: suggestion[index].substring(0, query.length),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: suggestion[index].substring(query.length),
                            style: const TextStyle(color: Colors.grey))
                      ])));
            });
  }
}
