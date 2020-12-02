// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:app/entries/rake_chain_entity.dart';
import 'package:app/generated/json/rake_chain_entity_helper.dart';
import 'package:app/entries/rake_chain_container_entity.dart';
import 'package:app/generated/json/rake_chain_container_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case RakeChainEntity:
				return rakeChainEntityFromJson(data as RakeChainEntity, json) as T;
			case RakeChainContainerEntity:
				return rakeChainContainerEntityFromJson(data as RakeChainContainerEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case RakeChainEntity:
				return rakeChainEntityToJson(data as RakeChainEntity);
			case RakeChainContainerEntity:
				return rakeChainContainerEntityToJson(data as RakeChainContainerEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (RakeChainEntity).toString()){
			return RakeChainEntity().fromJson(json);
		}	else if(type == (RakeChainContainerEntity).toString()){
			return RakeChainContainerEntity().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List<Map> data) {
		if(List<RakeChainEntity>() is M){
			return data.map((e) => RakeChainEntity().fromJson(e)).toList() as M;
		}	else if(List<RakeChainContainerEntity>() is M){
			return data.map((e) => RakeChainContainerEntity().fromJson(e)).toList() as M;
		}
		return null;
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}