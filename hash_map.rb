class HashMap
    capacity = 16

    def initialize(initial_capacity = 16)
        @buckets = Array.new(initial_capacity)
        @length = 0;
    end

    def hash(key)
        hash_code = 0
        prime_number = 31
           
        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
           
        hash_code
    end

    def set(key, value)  
        index = get_index(key)
        current = @buckets[index]
    
        if current.nil?
            @buckets[index] = [[key, value]]
            @length += 1
        elsif !has(key)
            current << [key, value]
            @length += 1
        end
    end

    def get(key)
        current = @buckets[get_index(key)]
    
        return nil if current.nil?
    
        current.each do |pair|
            return pair[1] if pair[0] == key
        end
    
        return nil
    end

    def has(key)
        current = @buckets[get_index(key)]

        current.each do |pair|
            if pair[0] == key
                return true
            end
        end

        return false
    end

    def remove(key)
        return nil unless has(key)
        @buckets[get_index(key)].reject! { |pair| pair[0] == key }
    end
    

    def length
        @length
    end

    def clear 
        @buckets = Array.new(@buckets.length)
        @length = 0
    end

    def keys 
        keys_arr = []

        @buckets.compact.each do |bucket|
            bucket.each do |pair|
                keys_arr << pair[0]
            end
        end

        keys_arr
    end

    def values
        values_arr = []

        @buckets.compact.each do |bucket|
            bucket.each do |pair|
                values_arr << pair[1]
            end
        end

        values_arr
    end

    def entries
        entries_arr = []

        @buckets.compact.each do |bucket|
            bucket.each do |pair|
                entries_arr << pair
            end
        end

        entries_arr
    end

    def get_index(key)
        index = hash(key) % @buckets.length
        raise IndexError if index.negative? || index >= @buckets.length
    end
end