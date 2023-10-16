#FileHelper.gd
class_name FileHelper

#普通写入
static func save(path, data):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(str(data))
	file = null

#普通读取
static func read(path, default_data):
	var data :String = str(default_data)
	var file = FileAccess.open(path, FileAccess.READ)
	var content :String = file.get_as_text()
	if not content.is_empty():
		data = content
	file = null
	return data
