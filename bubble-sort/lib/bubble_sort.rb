def bubble_sort(unsorted_array)
	sort(unsorted_array, unsorted_array.size)
end

def sort(unsorted_array, size)
	if (size == 0) then
		return unsorted_array
	end

	for i in 0..size-2
		if (unsorted_array[i] > unsorted_array[i+1]) then
			aux = unsorted_array[i]
			unsorted_array[i] = unsorted_array[i+1]
			unsorted_array[i+1] = aux
		end
	end

	return sort(unsorted_array, size-1)
end