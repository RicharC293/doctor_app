import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
    required this.medicalCenter,
    required this.rating,
  });

  final String image;
  final String name;
  final String speciality;
  final String medicalCenter;
  final int rating;

  /// https://www.youtube.com/watch?v=Si5XJ_IocEs -> Intrinsec widget
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image.contains("http"))
              Image.network(
                image,
                width: 70,
                height: 64,
              )
            else
              Image.asset(
                image,
                width: 70,
                height: 64,
              ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff404345),
                  ),
                ),
                 Text(
                  "$speciality • $medicalCenter",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xffAAAAAA),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    rating,
                    (index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
