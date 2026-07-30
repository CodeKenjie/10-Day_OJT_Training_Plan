# bubble_sort

def bubble_sort(arr)
  n = arr.length - 1

  loop do
    swapped = false

    (0...n).each do |index|
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swapped = true
      end
    end

    break unless swapped
    n -= 1
  end

  arr
end

print bubble_sort([5, 2, 4, 3, 1])
