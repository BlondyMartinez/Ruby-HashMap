require_relative 'hash_map'

# create new instance
hash_map = HashMap.new

# test set and get key-value pairs
hash_map.set("key1", "value1")
raise "Test failed: expected value1, got #{hash_map.get("key1")}" unless hash_map.get("key1") == "value1"

hash_map.set("key2", "value2")
raise "Test failed: expected value2, got #{hash_map.get("key2")}" unless hash_map.get("key2") == "value2"

# test update value of existing key
hash_map.set("key1", "updated_value1")
raise "Test failed: expected updated_value1, got #{hash_map.get("key1")}" unless hash_map.get("key1") == "updated_value1"

# test remove key
hash_map.remove("key2")
raise "Test failed: key2 should be removed" unless hash_map.get("key2").nil?

# test retrieve key, value and entry
raise "Test failed: expected ['key1'], got #{hash_map.keys.inspect}" unless hash_map.keys == ["key1"]
raise "Test failed: expected ['updated_value1'], got #{hash_map.values.inspect}" unless hash_map.values == ["updated_value1"]
raise "Test failed: expected [['key1', 'updated_value1']], got #{hash_map.entries.inspect}" unless hash_map.entries == [["key1", "updated_value1"]]

# Test clearing the hash map
hash_map.clear
raise "Test failed: length should be 0 after clearing" unless hash_map.length == 0
raise "Test failed: keys should be empty after clearing" unless hash_map.keys.empty?

# Test handling collisions
hash_map.set("aaa", "value1")
hash_map.set("bbb", "value2")
raise "Test failed: expected value1, got #{hash_map.get("aaa")}" unless hash_map.get("aaa") == "value1"
raise "Test failed: expected value2, got #{hash_map.get("bbb")}" unless hash_map.get("bbb") == "value2"

# Additional edge cases
hash_map.set("", "empty_key_value")
raise "Test failed: expected empty_key_value, got #{hash_map.get("")}" unless hash_map.get("") == "empty_key_value"

hash_map.set("key_with_numeric_value", 123)
raise "Test failed: expected 123, got #{hash_map.get("key_with_numeric_value")}" unless hash_map.get("key_with_numeric_value") == 123

hash_map.set("key_with_nil_value", nil)
raise "Test failed: expected nil, got #{hash_map.get("key_with_nil_value")}" unless hash_map.get("key_with_nil_value").nil?

# Test clearing again
hash_map.clear
raise "Test failed: length should be 0 after clearing" unless hash_map.length == 0
raise "Test failed: keys should be empty after clearing" unless hash_map.keys.empty?

puts "All tests passed successfully!"