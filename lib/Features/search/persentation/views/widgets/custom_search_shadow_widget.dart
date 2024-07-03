import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchShadowWidget extends StatelessWidget {
  const CustomSearchShadowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5, // عدد العناصر الوهمية لعرض الظلال
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: kPrimaryColor,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // تغير موقع الظل
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 130,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 20,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 20,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 20,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
