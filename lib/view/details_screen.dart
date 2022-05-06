import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DetailsScreen extends StatelessWidget {
  final String name;
  final String currency;
  final String flag;
  final String dialCode;

  const DetailsScreen(
      {Key? key,
        required this.name,
        required this.currency,
        required this.flag,
        required this.dialCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        //elevation: 0.0,
        toolbarHeight: 60,
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text(
          'Country Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAlias,
          margin:flag != '' ? const EdgeInsets.symmetric(vertical: 120) :const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              flag != ''
                  ? SvgPicture.network(
                flag,
                fit: BoxFit.fill,
                height: 190,
                width: 1000,
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
              )
                  : SvgPicture.asset(
                'assets/placeholder.svg',
                fit: BoxFit.fill,
                height: 300,
                width: 1000,
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
              ),
              const SizedBox(height: 100),
              Text(
                name,
                softWrap: true,
                maxLines:2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Currency :$currency',
                softWrap: true,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'DialCode :$dialCode',
                softWrap: true,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
