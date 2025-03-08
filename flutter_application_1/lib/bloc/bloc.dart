import 'package:flutter_application_1/bloc/state.dart';
import 'package:flutter_application_1/helper/nft_helper.dart';
import 'package:flutter_application_1/modal/nft_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NftBloc extends Cubit<NftState> {
  NftBloc()
      : super(NftState(id: 1, modal: NftModal(), data: [], department: []));

  Future<void> getData() async {
    List<NftModal> newData = [];
    Set<String> d = {};

    for (int i = 436121; i <= 436181; i++) {
      NftModal? data = await NftHelper.nh.apiParsing(id: i);
      if (data != null) {
        newData.add(data);
        d.add(data.department!);
      }
    }

    

    emit(NftState(
        id: state.id,
        modal: state.modal,
        data: newData,
        department: d.toList(),
        
        ));
  }
  
}
