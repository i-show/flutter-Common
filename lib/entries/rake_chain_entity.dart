import 'package:common/generated/json/base/json_convert_content.dart';

class RakeChainEntity with JsonConvert<RakeChainEntity> {
	String address;
	String bit;
	dynamic bizId;
	int order;
	String type;
}
