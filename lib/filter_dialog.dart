import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  TextEditingController _courierTextEditingController = TextEditingController();
  TextEditingController _storeTextEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18.0.sp, left: 18.0.sp, bottom: 8.0.sp),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        elevation: 0.0,
        content: Container(
          width: 380.0.sp,
          height: 550.0.sp,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 23.0.sp),
                height: 65.0.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(3.0),
                  ),
                  color: const Color(0xFFD83F26),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 8,
                        child: Text(
                          'Filters',
                          style: GoogleFonts.tajawal(
                            fontSize: 20.0.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        )),
                    Expanded(
                        child: Container(
                      width: 28.0.sp,
                      height: 28.0.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: const Color(0xFFFFCCC4),
                      ),
                      child: Icon(
                        Icons.close,
                        color: const Color(0xFFD83F26),
                      ),
                    ))
                  ],
                ),
              )),
              SizedBox(
                height: 20.0.sp,
              ),
              Expanded(
                child: TextFieldWidget(
                    upperText: 'Courier',
                    hintText: 'Select',
                    courierTextEditingController:
                        _courierTextEditingController),
              ),
              SizedBox(
                height: 13.0.sp,
              ),
              Expanded(
                child: TextFieldWidget(
                    upperText: 'Store',
                    hintText: 'Select',
                    courierTextEditingController: _storeTextEditingController),
              ),
              SizedBox(
                height: 13.0.sp,
              ),
              Expanded(
                child: TextFieldWidget(
                    upperText: 'Store',
                    hintText: 'Select',
                    courierTextEditingController: _storeTextEditingController),
              ),
              SizedBox(
                height: 18.0.sp,
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.0.sp),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'From',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 18.0.sp,
                                    color: const Color(0xFF3A3A3A),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 5.0.sp,
                              ),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        height: 45.0.sp,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Colors.grey[100]),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'dd/mm/yyyy',
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 15.0.sp,
                                                      color: const Color(
                                                          0xFF646464),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                                child: Icon(
                                                    Icons.calendar_today,
                                                    color: const Color(
                                                        0xFFD83F26)))
                                          ],
                                        ),
                                      )))
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 13.0.sp,
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'To',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 18.0.sp,
                                    color: const Color(0xFF3A3A3A),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 5.0.sp,
                              ),
                              Expanded(
                                  child: InkWell(
                                onTap: () => _selectDate(context),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 45.0.sp,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          color: Colors.grey[100]),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 15.0.sp,
                                                    color:
                                                        const Color(0xFF646464),
                                                  ),
                                                ),
                                              )),
                                          Expanded(
                                              child: Icon(Icons.calendar_today,
                                                  color:
                                                      const Color(0xFFD83F26)))
                                        ],
                                      ),
                                    )),
                              ))
                            ],
                          ),
                        )),
                      ],
                    ),
                  )),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonRowWidget())),
              SizedBox(
                height: 20.0.sp,
              )
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}

class ButtonRowWidget extends StatelessWidget {
  const ButtonRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.0.sp),
      child: Row(
        children: [
          Expanded(
              child: Container(
            // width: 125.0.sp,
            height: 45.0.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              color: const Color(0xFFDCDCDC),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFB2B2B2).withOpacity(0.22),
                  offset: Offset(0, 3.0),
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Clear',
                style: GoogleFonts.tajawal(
                  fontSize: 18.0.sp,
                  color: const Color(0xFF959595),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )),
          SizedBox(
            width: 15.0.sp,
          ),
          Expanded(
              flex: 2,
              child: Container(
                //width: 188.0,
                height: 45.0.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: const Color(0xFFD83F26),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.22),
                      offset: Offset(0, 3.0),
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Apply',
                    style: GoogleFonts.tajawal(
                      fontSize: 18.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required TextEditingController courierTextEditingController,
    required String upperText,
    required String hintText,
  })  : _courierTextEditingController = courierTextEditingController,
        upperText = upperText,
        hintText = hintText,
        super(key: key);

  final TextEditingController _courierTextEditingController;
  final String upperText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.0.sp),
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                upperText,
                style: GoogleFonts.tajawal(
                  fontSize: 18.0,
                  color: const Color(0xFF3A3A3A),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0.sp,
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 55.0.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.grey[100],
                  //color: Colors.tealAccent,
                ),
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.left,
                    controller: _courierTextEditingController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.0.sp, vertical: 12.0.sp),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: const Color(0xFFD83F26),
                        ),
                        hintText: hintText),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
