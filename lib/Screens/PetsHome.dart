import 'package:flutter/material.dart';
import 'package:pet_store/Model/pets_model.dart';
import 'package:pet_store/Screens/Details.dart';


class PetsHome extends StatefulWidget {
  const PetsHome({super.key});

  @override
  State<PetsHome> createState() => _PetsHomeState();
}

class _PetsHomeState extends State<PetsHome> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<PetsModel>> categories = [cats, dogs, birds, snakes, other];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: 
        SingleChildScrollView(
          child : Column(  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                  Text(
                    "Hi, Abin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text.rich(
                TextSpan(
                    text: "Adopt\n",
                    style: TextStyle(
                      height: 1.1,
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "your pet's here!",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ]),
              ),
            ),

            const SizedBox(height: 20),
            // categorySelection(),
            selectedIndex < categoryList.length
                ? (Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: SizedBox(
                      height: 570,
                      child: ListView.builder(
                          itemCount: categories[selectedIndex].length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => 
                                    Details(
                                      pets: categories[selectedIndex][index],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, right: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: 50,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: categories[selectedIndex]
                                                        [index]
                                                    .color,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              height: 230,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 230,
                                            child: Center(
                                              child: Hero(
                                                tag: categories[selectedIndex]
                                                        [index]
                                                    .image,
                                                child: Image.asset(
                                                  categories[selectedIndex]
                                                          [index]
                                                      .image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 25),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: categories[selectedIndex]
                                                    [index]
                                                .color
                                                .withOpacity(0.2),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          height: 150,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  categories[selectedIndex]
                                                          [index]
                                                      .name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  categories[selectedIndex]
                                                          [index]
                                                      .breed,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      categories[selectedIndex]
                                                              [index]
                                                          .sex,
                                                      style: const TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      ", ${categories[selectedIndex][index].age} year old",
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ))
                : const SizedBox(),
          ],
        ),
      )),
    );
  }
}