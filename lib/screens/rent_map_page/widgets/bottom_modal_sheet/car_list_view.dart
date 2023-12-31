import 'package:flutter/material.dart';

import 'package:socar/car_data/car_data.dart';
import 'package:socar/constants/color.dart';
import 'package:socar/screens/main_page/main_page.dart';
import 'package:socar/screens/rent_map_page/widgets/bottom_modal_sheet/icon_row.dart';
import 'package:socar/screens/rent_map_page/widgets/bottom_modal_sheet/text_styles.dart';
import 'package:socar/screens/rent_map_page/widgets/padding_box.dart';
import 'package:socar/screens/rent_map_page/widgets/time_select_modal_utils.dart';

class CarListView extends StatelessWidget {
  final String socarZoneId;
  final List<CarData> carList;
  final List<String> reservationList;
  final List<String> reservationNumber;
  final DateTimeRange timeRange;
  final bool isChanged;
  final void Function(DateTimeRange newTimeRange) updateTimeRange;
  final void Function(String markerId) setMarkerId;
  const CarListView(
      {required this.socarZoneId,
      required this.carList,
      required this.reservationList,
      required this.timeRange,
      required this.isChanged,
      required this.updateTimeRange,
      required this.reservationNumber,
      required this.setMarkerId});

  @override
  Widget build(BuildContext context) {
    print(carList);
    print(reservationList);
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: carList.length,
        itemBuilder: (context, index) {
          CarData carData = carList[index];
          return Stack(children: [
            ListTile(
              leading: Image.network(carData.imageUrl),
              title: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        carData.name,
                        style: carNameStyle,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin: EdgeInsets.all(10),
                        child: Text(
                          carData.driveFee.toString() + "원/km",
                          style: driveFeeStyle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        carData.discountRate.toString(),
                        style: socarBlueStyle,
                      ),
                      PaddingBox(width: 10, height: 0),
                      Text(
                        carData.rentFee.toString() + "원/km",
                        style: rentFeeStyle,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        (carData.rentFee * (100 - carData.discountRate) / 100)
                                .toString() +
                            "원",
                        style: discountRentFeeStyle,
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Map<String, dynamic> arg = {
                              "car_license": reservationNumber[index],
                              "start_time": timeRange.start.toString(),
                              "end_time": timeRange.end.toString(),
                            };
                            Navigator.pushNamed(context, "/reservationPayment",
                                arguments: arg);
                          },
                          icon: Icon(Icons.next_plan))
                    ],
                  )
                ],
              ),
            ),
            if (reservationList.contains(carData.imageUrl))
              Positioned.fill(
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255)
                      .withOpacity(0.7), // 투명도 조절
                ),
              ),
            if (reservationList.contains(carData.imageUrl))
              Positioned.fill(
                child: Center(
                  child: GestureDetector(
                      onTap: () {
                        TimeSelectModalUtils.showCustomModal(
                            context,
                            timeRange,
                            isChanged,
                            updateTimeRange,
                            setMarkerId,
                            socarZoneId);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(0),
                          color: ColorPalette.gray600.withOpacity(0.6),
                          child: IconRowWidget(
                            icon: Icons.access_alarm,
                            text: "시간 조정하기",
                          ),
                        ),
                      )),
                ),
              )
          ]);
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
