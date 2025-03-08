import 'package:flutter_application_1/modal/nft_modal.dart';

class NftState {
  int id;
  NftModal modal = NftModal();
  List<NftModal> data = [];
  List department = [];

  NftState({required this.id, required this.modal, required this.data, required this.department});
}
