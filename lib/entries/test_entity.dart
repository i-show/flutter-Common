import 'package:common/generated/json/base/json_convert_content.dart';

class TestEntity with JsonConvert<TestEntity> {
	int userId;
	int id;
	String title;
	String body;
}
