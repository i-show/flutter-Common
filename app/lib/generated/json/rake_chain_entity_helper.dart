import 'package:app/entries/rake_chain_entity.dart';

rakeChainEntityFromJson(RakeChainEntity data, Map<String, dynamic> json) {
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['bit'] != null) {
		data.bit = json['bit']?.toString();
	}
	if (json['bizId'] != null) {
		data.bizId = json['bizId'];
	}
	if (json['order'] != null) {
		data.order = json['order']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	return data;
}

Map<String, dynamic> rakeChainEntityToJson(RakeChainEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['address'] = entity.address;
	data['bit'] = entity.bit;
	data['bizId'] = entity.bizId;
	data['order'] = entity.order;
	data['type'] = entity.type;
	return data;
}