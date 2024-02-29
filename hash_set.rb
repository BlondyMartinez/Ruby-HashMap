class HashSet
    def initialize
        @hash = {}
    end

    def set(key)  
        @hash[key] = true
    end

    def get(key)
        return nil unless has(key)
        @hash[key]        
    end

    def has(key)
        @hash.key?(key)
    end

    def remove(key)
        return nil unless has(key)
        @hash.delete(key)
    end

    def length
        @hash.length
    end

    def clear 
        @hash = {}
    end

    def keys 
        @hash.keys
    end
end