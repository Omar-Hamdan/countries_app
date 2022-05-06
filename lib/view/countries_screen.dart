
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/countries_api.dart';
import '../model/country_model.dart';
import 'details_screen.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  State<CountriesScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CountriesScreen> {
  bool showImage = true;
  bool showCurrency = true;
  bool showDialCode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        //elevation: 1.0,
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
          'Countries Data',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            color: Colors.redAccent,
            height: 50.0,
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  value: showImage,
                  onChanged: (bool? value) {
                    setState(() {
                      print(value);
                      showImage = value!;
                    });
                  },
                ),
                const Text(
                  'Image',
                  softWrap: true,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 40),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  value: showCurrency,
                  onChanged: (bool? value) {
                    setState(() {
                      print(value);
                      showCurrency = value!;
                    });
                  },
                ),
                const Text(
                  'Currency',
                  softWrap: true,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 40),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  value: showDialCode,
                  onChanged: (bool? value) {
                    setState(() {
                      print(value);
                      showDialCode = value!;
                    });
                  },
                ),
                const Text(
                  'DialCode',
                  softWrap: true,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Country>>(
        future: getCountriesDataList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Country> countries = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              primary: true,
              physics: const BouncingScrollPhysics(),
              itemCount: countries.length,
              itemBuilder: (context, index) {
                Country country = countries[index];
                return GestureDetector(
                  child: Card(
                    elevation: 5,
                    margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        showImage
                            ? Container(
                          height: 100,
                          width: 150,
                          margin: const EdgeInsets.all(10),
                          child: country.flag != ''
                              ? ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(15),
                            child: SvgPicture.network(
                              country.flag,
                              fit: BoxFit.fill,
                              height: 100,
                              width: 200,
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                              placeholderBuilder: (BuildContext context) => Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 45.0,vertical: 20),
                                  width: 30,
                                  height: 30,
                                  child: const CircularProgressIndicator()),
                            ),
                          )
                              : SvgPicture.asset(
                            'assets/placeholder.svg',
                            fit: BoxFit.cover,
                            height: 110,
                            width: 500,
                            alignment: Alignment.center,
                            clipBehavior: Clip.antiAlias,
                          ),
                        )
                            : const SizedBox(width: 0.0, height: 0.0),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text(
                                  country.name,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              SizedBox(
                                width: 180,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    showCurrency
                                        ? Text(
                                      'Currency : ${country.currency}',
                                      softWrap: true,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                      ),
                                    )
                                        : const SizedBox(
                                        width: 0.0, height: 0.0),
                                    const SizedBox(height: 5),
                                    showDialCode
                                        ? Text(
                                      'DialCode : ${country.dialCode}',
                                      softWrap: true,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                      ),
                                    )
                                        : const SizedBox(
                                        width: 0.0, height: 0.0),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () => Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => DetailsScreen(
                        name: country.name,
                        currency: country.currency,
                        flag: country.flag,
                        dialCode: country.dialCode,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
