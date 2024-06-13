import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:gap/gap.dart';
import 'package:scook_app_detailproduct/models/Review.dart';
import 'package:scook_app_detailproduct/models/Variation.dart';
import 'package:readmore/readmore.dart';


class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  
  String variantSelected = 'All Variant';
  String reviewSelected = 'All';

  int variantIndex = 0;
  int reviewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: [
          Stack(
            children: [
              buildBackground(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 29),
              child: Column(
                children: [
                  Gap(89),
                  buildHeader(),
                  Gap(10),
                  buildSearchBar(context),
                  Gap(22),
                  Stack(
                    children: [
                      buildProductBackground(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          children: [
                            Gap(19),
                            buildProductInfo(),
                            Gap(17),
                            buildProductImage(),
                            Gap(15),
                            buildProductVariantImage(variantSelected, variantIndex),
                            Gap(15),
                            buildProductVariant(variantSelected, variantIndex),
                            Gap(20),
                            buildPrice(variantSelected, variantIndex),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(28),
                  buildStoreInfo(),
                  Gap(24),
                  buildDetail(variantIndex),
                  Gap(60),
                  buildReview(variantIndex),
                  Gap(8),
                  buildReviewSelection(reviewSelected),
                  buildReviewDetail(),
                  Gap(49),
                  buildPagination(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: buildBuy(),
    );
  }
}


Widget buildBackground(){
  return Container(
    height: 170, 
    decoration: BoxDecoration(
      color: Color(0xffDEE3CF),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(45), 
        bottomRight: Radius.circular(45)
      )
    ),
  );
}

Widget buildHeader(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: ()=>print("pressed icon"), 
        icon: ImageIcon(
          AssetImage('assets/arrow-left.png'),
        ),
      ),
      Image.asset(
        'assets/scook-logo.png',
        width: 40,
        height: 50,
      ),
      IconButton(
        onPressed:(){}, 
        icon: ImageIcon(
          AssetImage('assets/bag.png'),
        ),
      ),
    ],
  );
}

Widget buildSearchBar(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        border: InputBorder.none,
        hintText: "Search product",
        hintStyle: TextStyle(
          color: Color(0xff5B5B5B),
          fontSize: 16,
          fontWeight: FontWeight.normal
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset('assets/search.png'),
        ),
      ),
    ),
  );
}

Widget buildProductBackground(){
  return Container(
    height: 550, 
    decoration: BoxDecoration(
      border: Border.all(
        color: Color(0xff60781C),
      ),
      borderRadius: BorderRadius.circular(32),
    ),
  );
}

Widget buildProductInfo(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Swipe It Lip Balm",
            style : TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          InkWell(
            onTap: () {
              print("press share");
            },
            child: Image.asset(
              'assets/share.png',
              height: 18,
              width: 23,
              color: Color(0xff60781C)
            ),
          )
        ],
      ),
      Gap(7),
      Row(
        children: [
          Text(
            "Rp. 159.000.000",
            style : TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
        ],
      ),
      Gap(8),
      Row(
        children: [
          Image.asset(
            'assets/star.png',
            height: 17,
            width: 17,
          ),
          SizedBox(width: 9,),
          Text(
            "x,x",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black
            ),
          ),
          SizedBox(width: 18,),
          Text(
            "xxx sold",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black
            ),
          )
        ],
      )
    ],
  );
}

Widget buildProductImage(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(width: 40, height: 40,),
      Image.asset(
        'assets/lipbalm-all-big.png',
        height: 188,
        width: 188,
      ),
      Container(
        width: 40, 
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xffDCE1CD),
          shape: BoxShape.circle,
        ),
        child : IconButton(
          onPressed : (){},
          icon: ImageIcon(
            AssetImage('assets/right.png'),
            size: 24,
            color: Color(0xff60781C),
          ),
        ),
      )
    ],
  );
}

Widget buildProductVariantImage(String variantSelected, int variantIndex){
  return Container(
    height: 69,
    child: Expanded(
      child: ListView.builder(
        itemCount: listVariaton.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          Variation variants = listVariaton[index];
          bool isActive = variantSelected == variants.name;
          return InkWell(
            onTap: () {
              variantSelected = variants.name;
              variantIndex = index;
              print(variantSelected);
            },
            child: Column(
              children: [
                Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 16 : 8,
                  right: index == listVariaton.length - 1 ? 4 : 8,
                ),
                  child: Image.asset(
                    variants.productImage,
                    height: 58,
                    width: 55,
                  ),
                ),
                if (isActive) Gap(6),
                if (isActive) Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 16 : 8,
                    right: index == listVariaton.length - 1 ? 4 : 8),
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff60781C),
                    borderRadius: BorderRadius.circular(18)
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}

Widget buildProductVariant(String variantSelected, int variantIndex){
  return SizedBox(
    height: 35,
    child: Row(
      children: [
        SizedBox(width:21,),
        Text(
          "Variation",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        SizedBox(width:6,),
        Expanded(
          child: ListView.builder(
            itemCount: listVariaton.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
              Variation variant = listVariaton[index];
              bool isActive = variantSelected == variant.name;
              return GestureDetector(
                onTap: (){
                  variantSelected = variant.name;
                  variantIndex = index;
                  print(variantSelected);
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 20 : 8,
                        right: index == listVariaton.length - 1 ? 4 : 8,
                      ),
                      decoration: BoxDecoration(
                        color: isActive? Color(0xff6A802A): Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        variant.name,
                        style : TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: isActive ? Colors.white : Color(0xff6A802A),
                          ),
                      ),
                    ),
                    if (isActive) Gap(3),
                    if (isActive) Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 16 : 8,
                        right: index == listVariaton.length - 1 ? 4 : 8),
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff60781C),
                        borderRadius: BorderRadius.circular(18)
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ],
    ),
  );
}

Widget buildPrice(String variantSelected, int variantIndex){
  return SizedBox(
    height: 30,
    child: Stack(
      children: [ 
        Container(
          height: 55,
          decoration: BoxDecoration(
            color: Color(0xffDEE3CF),
            borderRadius: BorderRadius.circular(8),
          ), 
        ),
        Padding(
          padding: EdgeInsets.only(left:15, top: 3, right: 3),
          child: Row(
            children: [
              Text(
                "Price :",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff5B5B5B)
                ),
              ),
              SizedBox(width: 5,),
              Text(
                listVariaton[variantIndex].price.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              SizedBox(width: 5,),
              Text(
                "Stock :",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff5B5B5B)
                ),
              ),
              SizedBox(width: 5,),
              Text(
                listVariaton[variantIndex].stocks,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildStoreInfo(){
  return Container(
    // padding: EdgeInsets.only(top: 15, left: 20, right: 15, bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/shop-logo.png',
          width: 42,
          height: 42,
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Body Shop",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )
              ),
              Text(
                "Active 5 minutes ago",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff6A802A)
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 13,),
        InkWell(
          onTap: () {
            print("pressed visit");
          },
          child: Image.asset('assets/visit-store.png')
        )
      ],
    ),
  );
}

Widget buildDetail(int variantIndex){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Product Detail",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
      Gap(5),
      ReadMoreText(
        listVariaton[variantIndex].description,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: Color(0xff5B5B5B)
        ),
        trimLength: 110,
        trimCollapsedText: ' Read More ...',
        trimExpandedText: ' Read Less',
        moreStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: Colors.black
        ),
        lessStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: Colors.black
        ),

      )
    ],
  );
}

Widget buildReview(int variantIndex){
  return Column(
    children: [
      Row(
        children: [
          Text(
            "Reviews",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          Text(
            "(" + listVariaton[variantIndex].reviewCount.toString() + ")",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff6A802A)
            ),
          )
        ],
      ),
      Row(
        children: [
          Text(
            listVariaton[variantIndex].review.toString() +"/5",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          SizedBox(width: 5,),
          Image.asset('assets/star.png'),
          Image.asset('assets/star.png'),
          Image.asset('assets/star.png'),
          Image.asset('assets/star.png'),
          Image.asset('assets/star.png')
        ],
      )
    ],
  );
}

Widget buildReviewSelection(String reviewSelected){
  final reviewCounts = [
    'All',
    '5(xxx)',
    '4(xxx)',
    '3(xxx)',
    '2(xxx)',
    '1(xxx)'
  ];
  return SizedBox(
    height: 35,
    child: Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: reviewCounts.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
              String review = reviewCounts[index];
              bool isActive = reviewSelected == review;
              return GestureDetector(
                onTap: (){
                  reviewSelected = review;
                  print(reviewSelected);
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 3 : 8,
                        right: index == listVariaton.length - 1 ? 4 : 8,
                      ),
                      decoration: BoxDecoration(
                        color: isActive? Color(0xff6A802A): Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        review,
                        style : TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: isActive ? Colors.white : Color(0xff6A802A),
                          ),
                      ),
                    ),
                    if (isActive) Gap(5),
                    if (isActive) Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 4 : 8,
                        right: index == listVariaton.length - 1 ? 4 : 8),
                      height: 3,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff60781C),
                        borderRadius: BorderRadius.circular(18)
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ],
    ),
  ); 
}

Widget buildReviewDetail(){
  return Column(
    children: [
      for (int i=0; i<listReview.length; i++)
         Column(
          children: [
            Gap(40),
            Row(
              children: [
                Image.asset(
                  listReview[i].profile,
                  height: 42,
                  width: 42,
                ),
                SizedBox(width: 11,),
                Text(
                  listReview[i].name,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                )
              ],
            ),
            Gap(8),
            Row(
              children: [
                for (int j=0;j<listReview[i].review; j++)
                Image.asset(
                  'assets/star.png',
                  height: 12,
                  width: 12,  
                ),
                SizedBox(width: 16,),
                Text(
                  listReview[i].date,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6A802A)
                  ),
                ),
                SizedBox(width: 16,),
                Text(
                  "Variation : " + listReview[i].variant,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6A802A)
                  ),
                )
              ],
            ),
            ReadMoreText(
              listReview[i].description,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: Color(0xff5B5B5B)
              ),
              trimLength: 80,
              trimCollapsedText: ' Read More ...',
              trimExpandedText: ' Read Less',
              moreStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: Colors.black
              ),
              lessStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: Colors.black
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 8, right: 30),
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xffDEE3CF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Seller Response',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      Text(
                        listReview[i].sellerResponseDate,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5B5B5B)
                        ),
                      )
                    ],
                  ),
                  Gap(5),
                  ReadMoreText(
                    listReview[i].sellerResponse,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff5B5B5B)
                    ),
                    trimLength: 70,
                    trimCollapsedText: ' Read More ...',
                    trimExpandedText: ' Read Less',
                    moreStyle: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                    ),
                    lessStyle: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                    ),
                  )
                ],
              ),
                
              ),
          ],
         )
    ],
  );
}

Widget buildPagination(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        onPressed: ()=>print("pressed icon"), 
        icon: ImageIcon(
          AssetImage('assets/left.png'),
        ),
      ),
      GestureDetector(
        onTap: () {
          print("pressed icon");
        },
        child: Text(
          "1",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff6A802A),
          ),
        ),
      ),
      SizedBox(width: 10,),
      GestureDetector(
        onTap: () {
          print("pressed icon");
        },
        child: Text(
          "2",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff6A802A),
          ),
        ),
      ),
      SizedBox(width: 10,),
      GestureDetector(
        onTap: () {
          print("pressed icon");
        },
        child: Text(
          "3",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff6A802A),
          ),
        ),
      ),
      SizedBox(width: 10,),
      GestureDetector(
        onTap: () {
          print("pressed icon");
        },
        child: Text(
          "4",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff6A802A),
          ),
        ),
      ),
      SizedBox(width: 10,),
      GestureDetector(
        onTap: () {
          print("pressed icon");
        },
        child: Text(
          "...",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff6A802A),
          ),
        ),
      ),
      IconButton(
        onPressed: ()=>print("pressed icon"), 
        icon: ImageIcon(
          AssetImage('assets/right.png'),
        ),
      ),
    ],
  );
}

Widget buildBuy(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(32),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            print("press min");
          },
          child: Container(
            width: 30,
            height: 34,
            decoration: BoxDecoration(
              color: Color(0xffDEE3CF),
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/min.png'),
          ),
        ),
        SizedBox(width: 8,),
        Text(
          "1",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              
            ),
        ),
        SizedBox(width: 8,),
        InkWell(
          onTap: () {
            print("press plus");
          },
          child: Container(
            width: 30,
            height: 34,
            decoration: BoxDecoration(
              color: Color(0xff6A802A),
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/plus.png'),
          ),
        ),
        SizedBox(width: 45,),
        InkWell(
          onTap: () {
            print("press Buy");
          },
          child: Container(
            width: 72,
            height: 38,
            decoration: BoxDecoration(
              color: Color(0xff6A802A),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                'Buy Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16,),
        InkWell(
          onTap: () {
            print("press Add to Cart");
          },
          child: Container(
            width: 112,
            height: 38,
            decoration: BoxDecoration(
              color: Color(0xff6A802A),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                'Add to Cart',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}