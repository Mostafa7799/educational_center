import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../data/api_service/api_service.dart';

part 'material_controller_state.dart';

class MaterialCubit extends Cubit<MaterialControllerState> {
  MaterialCubit() : super(MaterialControllerInitial());

  static MaterialCubit get(BuildContext context) => BlocProvider.of(context);
  ApiService service = ApiService();

  Future<void> teacherAddMaterial({Map<String, dynamic>? data}) async {
    try {
      print(data);
      final res = await service.teacherAddMaterial(
        data: data!,
      );
      if (res is String) {
        Fluttertoast.showToast(
          msg: "Material Added",
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        Fluttertoast.showToast(
          msg: res['error'][0],
          backgroundColor: Colors.red,
        );
        throw res.toString();
      }
    } catch (error) {
      print(error.toString());
    }
  }

}
