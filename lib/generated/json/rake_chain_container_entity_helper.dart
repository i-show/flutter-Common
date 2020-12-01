import 'package:app/entries/rake_chain_container_entity.dart';
import 'package:app/entries/rake_chain_entity.dart';

rakeChainContainerEntityFromJson(RakeChainContainerEntity data, Map<String, dynamic> json) {
	if (json['results'] != null) {
		data.results = new List<RakeChainEntity>();
		(json['results'] as List).forEach((v) {
			data.results.add(new RakeChainEntity().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> rakeChainContainerEntityToJson(RakeChainContainerEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.results != null) {
		data['results'] =  entity.results.map((v) => v.toJson()).toList();
	}
	return data;
}