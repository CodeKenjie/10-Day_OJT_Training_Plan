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
