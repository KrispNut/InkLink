import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 36),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: 426.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 115.6),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0.9, 0, 0, 0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 7.2, 21.8, 34.4),
                                        child: SizedBox(
                                          width: 1.4,
                                          height: 0.4,
                                          child: Image.asset('assets/images/Bank Safe.png'),
                                        ),
                                      ),

                                      Text(
                                        'Mobile Money',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Color(0xFF3A3C3F),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    left: -0.9,
                                    top: 0.5,
                                    child: SizedBox(
                                      width: 38.4,
                                      height: 10.8,
                                      child: Image.asset('assets/images/Bank Safe.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(33, 0, 33, 6),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: 308.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                                    child: SizedBox(
                                      width: 275.5,
                                      child: Text(
                                        '1:03',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                    child: SizedBox(
                                      width: 25.9,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 6.1, 0),
                                            child: SizedBox(
                                              width: 14,
                                              height: 14,
                                              child: Image.asset('assets/images/Bank Safe.png'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 1.2, 0, 1.2),
                                            width: 5.8,
                                            height: 11.7,
                                            child: SizedBox(
                                              width: 5.8,
                                              height: 11.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 70),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1201763F),
                              offset: Offset(0, 20),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 18, 3.8, 99),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 38),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xFFDADADA),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x0D000000),
                                          offset: Offset(0, 4),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      width: 30,
                                      height: 44,
                                      padding: EdgeInsets.fromLTRB(9, 22, 9, 19.5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF08F5F),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Container(
                                          width: 0.6,
                                          height: 2.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 16.2, 1),
                                child: SizedBox(
                                  width: 337,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                                        child: SizedBox(
                                          width: 246.4,
                                          child: Text(
                                            'Payment 💳 ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22,
                                              letterSpacing: 0.7,
                                              color: Color(0xFF363636),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
                                        child: Text(
                                          '2050 Rs',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            letterSpacing: 0.6,
                                            color: Color(0xFF25D482),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'TVA included (18%)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    letterSpacing: 0.3,
                                    color: Color(0xFFB1B1B1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(38, 0, 38, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(4, 0, 4, 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Card number',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  letterSpacing: 0.3,
                                  color: Color(0xFF3A3C3F),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 3, 35),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F2F5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: SizedBox(
                                width: 299,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 8.2, 7),
                                        child: Text(
                                          '5263   4841   0151   8471',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            letterSpacing: 0.8,
                                            color: Color(0xFF424D59),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: SizedBox(
                                          width: 27,
                                          height: 16,
                                          child: Image.asset('assets/images/Bank Safe.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(4, 0, 4, 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Holder',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  letterSpacing: 0.3,
                                  color: Color(0xFF3A3C3F),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 3, 35),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F2F5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 16),
                                child: Text(
                                  'Mark',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    letterSpacing: 0.3,
                                    color: Color(0xFF424D59),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(4, 0, 0, 8),
                            child: SizedBox(
                              width: 298,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 9.5, 0),
                                    child: SizedBox(
                                      width: 166.5,
                                      child: Text(
                                        'Expiration Date',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          letterSpacing: 0.3,
                                          color: Color(0xFF3A3C3F),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'CVV / CVC',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      letterSpacing: 0.3,
                                      color: Color(0xFF3A3C3F),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                    child: Opacity(
                                      opacity: 0.2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF25D482),
                                          borderRadius: BorderRadius.circular(9),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(5.9, 2.5, 6, 0.5),
                                          child: Text(
                                            '?',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              letterSpacing: 0.2,
                                              color: Color(0xFF25D482),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 7, 36),
                            child: SizedBox(
                              width: 295,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF2F2F5),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(20, 10, 6, 16),
                                      child: Text(
                                        '06   /   2024',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          letterSpacing: 0.8,
                                          color: Color(0xFF424D59),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF2F2F5),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      width: 115,
                                      padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
                                      child: Text(
                                        '917',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          letterSpacing: 0.8,
                                          color: Color(0xFF424D59),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(28.7, 0, 28.7, 22),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'We will send you order details to your email address after successful payment.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.4,
                                  letterSpacing: 0.2,
                                  color: Color(0xFFB1B1B1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF25D482),
                                borderRadius: BorderRadius.circular(36),
                              ),
                              child: SizedBox(
                                width: 299,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                                        width: 16,
                                        height: 21,
                                        child: SizedBox(
                                          width: 16,
                                          height: 21,
                                          child: Image.asset('assets/images/Bank Safe.png'),
                                        ),
                                      ),
                                      Text(
                                        'Pay',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
