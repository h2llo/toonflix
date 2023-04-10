import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final double numY;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.numY,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, numY),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : const Color(0xff1f2123),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color:
                            isInverted ? const Color(0xff1f2123) : Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted
                              ? const Color(0xff1f2123)
                              : Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted
                              ? const Color(0xff1f2123)
                              : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: const Offset(-5, 14),
                  child: Icon(
                    icon,
                    color: isInverted ? const Color(0xff1f2123) : Colors.white,
                    size: 80,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
