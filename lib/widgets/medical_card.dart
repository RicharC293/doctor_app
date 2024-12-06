import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MedicalCard extends StatelessWidget {
  const MedicalCard({
    super.key,
    required this.srcIcon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String srcIcon;
  final String title;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Stack(
        children: [
          /// Por diseño
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(18),
            ),
          ),

          /// Solo es por diseño
          Positioned(
            left: 1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 20,
                  )
                ],
                shape: BoxShape.circle,
              ),
              height: 50,
              width: 50,
            ),
          ),

          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 51,
                  width: 51,
                  child: Center(
                    child: SvgPicture.asset(
                      srcIcon,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
