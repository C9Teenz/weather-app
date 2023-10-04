// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:dropdown_plus_plus/dropdown_plus_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utils/Constant.dart';
import '../../cubit/code/code_cubit.dart';
import '../../cubit/current_weather/current_weather_cubit.dart';
import '../../cubit/location/location_cubit.dart';
import '../../cubit/navbar/navbar_cubit.dart';
import '../../cubit/weather/weather_cubit.dart';
import '../../widgets/navbar_item.dart';
import '../../widgets/weather_item.dart';
import '../../widgets/weather_item_nodata.dart';

class WeatherWeb extends StatelessWidget {
  const WeatherWeb({
    Key? key,
    required this.formattedDateTime,
  }) : super(key: key);
  final String formattedDateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff695BFC), Color(0xff5A99F2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Center(
            child: Container(
              width: 412,
              height: 915,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.65,
                      padding: const EdgeInsets.only(top: 42),
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                          gradient: LinearGradient(
                              colors: [Color(0xff695BFC), Color(0xff5A99F2)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Column(
                        children: [
                          BlocBuilder<LocationCubit, LocationState>(
                            builder: (context, state) {
                              return state.maybeWhen(orElse: () {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }, loaded: (model) {
                                List<Map<String, dynamic>> data =
                                    model.map((e) => e.toJson()).toList();
                                return SizedBox(
                                  width: 170,
                                  child:
                                      DropdownFormField<Map<String, dynamic>>(
                                    onEmptyActionPressed: () async {},
                                    dropdownItemSeparator: const Divider(
                                      color: Colors.white,
                                      height: 1,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.zero,
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                      ),
                                      suffix: SizedBox(
                                        width: 1,
                                      ),
                                    ),
                                    onChanged: (dynamic str) {
                                      context
                                          .read<WeatherCubit>()
                                          .getData(str["id"]);
                                      context
                                          .read<CurrentWeatherCubit>()
                                          .getData(str["id"]);
                                      context
                                          .read<CodeCubit>()
                                          .changeCode(str["id"]);
                                      context
                                          .read<NavbarCubit>()
                                          .changeIndex(0);
                                    },
                                    validator: null,
                                    displayItemFn: (dynamic item) => item !=
                                            null
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                item["propinsi"],
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                item["kota"],
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          )
                                        : const Text("Pilih Kota",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16)),
                                    findFn: (dynamic str) async => data,
                                    filterFn: (dynamic item, str) =>
                                        item['kota']
                                            .toLowerCase()
                                            .indexOf(str.toLowerCase()) >=
                                        0,
                                    dropdownItemFn: (dynamic item,
                                            position,
                                            focused,
                                            dynamic lastSelectedItem,
                                            onTap) =>
                                        ListTile(
                                      title: Text(item['propinsi']),
                                      subtitle: Text(
                                        item['kota'] ?? '',
                                      ),
                                      tileColor: focused
                                          ? const Color.fromARGB(
                                              19, 255, 255, 255)
                                          : Colors.transparent,
                                      onTap: onTap,
                                    ),
                                  ),
                                );
                              });
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return SizedBox(
                                    child: Column(
                                      children: [
                                        const Text(
                                          "-----°",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 82,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          formattedDateTime,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const Text(
                                          "----------",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 42,
                                        ),
                                        Container(
                                          width: 230,
                                          height: 120,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      ConstantData.noweather))),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                loaded: (model) {
                                  return SizedBox(
                                    child: Column(
                                      children: [
                                        Text(
                                          "${model.tempC}°",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 82,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          formattedDateTime,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          model.cuaca,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          width: 230,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      ConstantData.image[
                                                          model.kodeCuaca]!))),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(ConstantData.wave),
                                      fit: BoxFit.cover)),
                            ),
                          )
                        ],
                      )),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10))),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 42),
                                child: const Divider(
                                  thickness: 1.0,
                                  color: Colors.grey,
                                ),
                              ),
                              BlocListener<NavbarCubit, int>(
                                listener: (context, state) {
                                  if (state == 0) {
                                    context.read<WeatherCubit>().getData(
                                        context.read<CodeCubit>().state);
                                  } else {
                                    context.read<WeatherCubit>().getDataNextDay(
                                        context.read<CodeCubit>().state);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            context
                                                .read<NavbarCubit>()
                                                .changeIndex(0);
                                          },
                                          child: const NavbarItem(
                                              name: "Hari ini", index: 0)),
                                      InkWell(
                                          onTap: () {
                                            context
                                                .read<NavbarCubit>()
                                                .changeIndex(1);
                                          },
                                          child: const NavbarItem(
                                              name: "Besok", index: 1)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              child: BlocBuilder<WeatherCubit, WeatherState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                      orElse: () {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            WeatherItemNoData(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: 70,
                                                data: "00"),
                                            WeatherItemNoData(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: 70,
                                                data: "06"),
                                            WeatherItemNoData(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: 70,
                                                data: "12"),
                                            WeatherItemNoData(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: 70,
                                                data: "18"),
                                          ],
                                        );
                                      },
                                      loaded: (model) {
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return WeatherItem(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: 70,
                                                data: model[index]);
                                          },
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: model.length,
                                        );
                                      },
                                      loading: () => const Center(
                                            child: CircularProgressIndicator(),
                                          ));
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
