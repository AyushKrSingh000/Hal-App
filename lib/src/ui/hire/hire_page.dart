import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hal/src/constants/constants.dart';
import 'package:hal/src/ui/hire/hire_page_model.dart';

class HireTab extends ConsumerStatefulWidget {
  const HireTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HireTabState();
}

class _HireTabState extends ConsumerState<HireTab> {
  @override
  Widget build(BuildContext context) {
    final status = ref.watch(hirePageModelProvider.select((_) => _.status));
    final data = ref.watch(hirePageModelProvider.select((_) => _.data));

    return status == HirePageStatus.dataLoaded && data != null
        ? SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: primaryColor,
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: GoogleFonts.roboto(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF555555),
                              ),
                              textAlignVertical: TextAlignVertical.bottom,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(CupertinoIcons.search),
                                prefixIconColor: primaryColor,
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Search',
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFC2E854),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFC2E854),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xFFC2E854),
                                ),
                                borderRadius: BorderRadius.circular(35),
                                color: Colors.white),
                            child: Icon(
                              CupertinoIcons.person_alt,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: const Color(0xFFC2E854),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Expanded(
                      child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 100, top: 20),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 5),
                                color: primaryColor,
                                blurRadius: 10,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/Rectangle 54.png',
                                  // height: 200,
                                  width: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Brand Name : ${data[index].brandName}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor,
                                      ),
                                    ),
                                    Text(
                                      ' Cost : ${data[index].cost}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor,
                                      ),
                                    ),
                                    Text(
                                      ' Available For : ${data[index].date}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: data.length,
                  )),
                ],
              ),
            ),
          )
        : status == HirePageStatus.initial
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFC2E854),
                    strokeWidth: 5,
                  ),
                ),
              )
            : status == HirePageStatus.noData
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                    child: const Center(
                      child: Text('NO Data'),
                    ))
                : Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                    child: const Center(
                      child: Text("Something Wrong Happend"),
                    ));
  }
}
