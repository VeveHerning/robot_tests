def sort_numbers(input_array):
    input_array = list(map(int, input_array)) 
 
    # Separate even and odd numbers
    evens = [num for num in input_array if num % 2 == 0]
    odds = [num for num in input_array if num % 2 != 0]
    
    # Sort even & odd numbers in descending order
    evens.sort(reverse=True)
    odds.sort(reverse=True)
    
    # Combine the sorted lists
    return evens + odds

# Example usage
if __name__ == "__main__":
    input_array = [3, 2, 5, 1, 8, 9, 6]
    sorted_array = sort_numbers(input_array)
    print(sorted_array)
 # Expected output: [8, 6, 2, 9, 5, 3, 1]
