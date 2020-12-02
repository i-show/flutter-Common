import 'package:app/entries/rake_chain_entity.dart';
import 'package:app/generated/json/base/json_convert_content.dart';

class RakeChainContainerEntity with JsonConvert<RakeChainContainerEntity> {
  List<RakeChainEntity> results;
}
