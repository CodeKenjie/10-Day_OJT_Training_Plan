class HashMap
  def initialize()
    @load_factor = 0.75
    @capacity = 16
    @size = 0
    @buckets = Array.new(@capacity)
  end

  def buket_at(index)
    raise IndexError if index.negative? || index >= @buckets.length

    @buckets[index]
  end

  def set(key, value)
    resize if @size > (@capacity * @load_factor)

    index = hash(key) % @capacity

    if @buckets[index]
      if @buckets[index][0] == key
        @buckets[index][1] = value 
      end
    else
      @buckets[index] = [key, value]
      @size += 1
    end
  end

  def get(key)
    index = hash(key) % @capacity
    buckets = @buckets[index]

    return nil unless buckets

    buckets.each do |item|
      if item[0] == key
        return item[1]
      end
    end
  end

  def has?(key)
    index = hash(key) % @capacity
    buckets = @buckets[index]

    return nil unless buckets

    buckets.each do |item|
      return true if item[0] == key 
    end

    false
  end

  def remove(key)
    index = hash(key) % @capacity
    buckets = @buckets[index]

    return nil unless buckets

    value = nil

    buckets.each do |item|
      if item[0] == key
        value = item[1]
        buckets.delete(item)
        @size -= 1
        return value
      end
    end

    nil
  end

  def length
    @size
  end

  def clear 
    @capacity = 16 
    @size = 0 
    @buckets = Array.new(@capacity)
  end

  def keys
    arr = []
    @buckets.each do |item|
      next if item.nil?

      item.each do |sub_item|
        arr << sub_item[0]
      end
    end
    arr
  end

  def entries
    arr = []

    @buckets.each do |item|
      next if item.nil?
      item.each do |sub_item|
        arr << sub_item
      end
    end

    arr
  end

  private

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def resize
    old_buckets = @buckets
    @capacity *= 2
    new_bucket = Array.new(@capacity)

    old_buckets.each do |item| 
      next if item.nil?
      index = hash(item[0]) % capacity
      new_bucket[index] = item
    end

    @buckets = new_bucket
  end 
end
