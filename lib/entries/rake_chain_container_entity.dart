import 'package:common/entries/rake_chain_entity.dart';
import 'package:common/generated/json/base/json_convert_content.dart';

class RakeChainContainerEntity with JsonConvert<RakeChainContainerEntity> {
  List<RakeChainEntity> results;
}
