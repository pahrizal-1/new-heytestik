import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  List<String> items = [
    "Followed",
    "Trending",
    "Skin Goals",
    "My Skin Concern",
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stream",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image:
                                      AssetImage("assets/icons/icon-home.png"),
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/profiledummy.png")),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/icons/search1.png"))),
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 280),
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 15, fontFamily: "ProximaNova"),
                        decoration: InputDecoration(
                          hintText: "Cari Stream",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: "ProximaNova",
                            color: fromCssColor(
                              '#9B9B9B',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                margin: const EdgeInsets.all(5),
                                width: 100,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: current == index
                                      ? greenColor
                                      : whiteColor,
                                  border: Border.all(
                                      color: fromCssColor("#F1F1F1")),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                duration: const Duration(milliseconds: 250),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontSize: 12,
                                      fontWeight: current == index
                                          ? bold
                                          : FontWeight.normal,
                                      color: current == index
                                          ? whiteColor
                                          : fromCssColor("#9B9B9B"),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // color: Colors.tealAccent,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 40,
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/profiledummy.png'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Laura Nabilah",
                                          style: TextStyle(
                                            fontWeight: bold,
                                            fontFamily: 'ProximaNova',
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "9 Mei 2023, 6 Jam yang lalu",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'ProximaNova',
                                            color: fromCssColor("#231F2080"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: greyColor,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "2 minggu lalu abis peeling wajah di salah satu klinik di Jaksel. Awalnya muka aku agak memerah dikit sih, tpi so farrr suka bgtt sama hasilnya setelah 2 minggu iniii. Yang penting jgn lupa sunscreen guyssss",
                              style: TextStyle(
                                fontFamily: "ProximaNova",
                                fontSize: 15,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "132 menyukai",
                              style: TextStyle(
                                color: fromCssColor("#9B9B9B"),
                                fontFamily: "ProximaNova",
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icons/like.png"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icons/share.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "13",
                                      style: TextStyle(
                                          color: greyColor,
                                          fontSize: 14,
                                          fontFamily: "ProximaNova"),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icons/komen1.png"),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 40,
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/profiledummy.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kevin",
                                        style: TextStyle(
                                          fontWeight: bold,
                                          fontFamily: 'ProximaNova',
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "9 Mei 2023, 6 Jam yang lalu",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'ProximaNova',
                                          color: fromCssColor("#231F2080"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.more_horiz,
                                  color: greyColor,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Ada yang tau nggak guyss rekomendasi klinik yang ada perawatan Laser CO2-nya? Comment dong yaa dibawah",
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontSize: 15,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: fromCssColor("#EDF0F0"),
                            constraints: const BoxConstraints(
                              maxHeight: double.infinity,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10, top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 30,
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/profiledummy.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Anisa",
                                        style: TextStyle(
                                          fontWeight: bold,
                                          fontFamily: 'ProximaNova',
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        constraints:
                                            const BoxConstraints(maxWidth: 250),
                                        child: const Text(
                                          "Hi Jhon, ada nih klinik kecantikan di daerah Senopati Jakarta Selatan yang nyediain laser CO2. Itu klinik kecantikan langgananku jugaa buat ngatasin bopeng hehhehe. Recommended 👍🏻",
                                          style: TextStyle(
                                            fontSize: 15,
                                            height: 1.1,
                                            fontFamily: 'ProximaNova',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "132 menyukai",
                            style: TextStyle(
                              color: fromCssColor("#9B9B9B"),
                              fontFamily: "ProximaNova",
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/icons/like.png"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/icons/share.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "13",
                                    style: TextStyle(
                                        color: greyColor,
                                        fontSize: 14,
                                        fontFamily: "ProximaNova"),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/icons/komen1.png"),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          backgroundColor: greenColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/float.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Post",
                  style: TextStyle(
                    fontFamily: "ProximaNova",
                    fontSize: 10,
                    color: whiteColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
