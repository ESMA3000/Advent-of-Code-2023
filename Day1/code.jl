#Input
file = open("../Day1/input1.txt", "r")
input = read(file, String)
close(file)
vector = split(input, "\n")

#Part 1
sum = 0
for i in vector
    list = Vector()
    for j in i
        try
            append!(list, parse(Int, j))
        catch
            continue
        end
    end
    length(list) != 0 && (sum += parse(Int, (string(first(list)) * string(last(list)))))
end
print(sum)

#Part 2
numbers = Dict("one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9")
sum = 0
for str in vector
    list = Vector()
    split_string = split(str, "")
    for numb in numbers
        if match(Regex(numb[1]), str) !== nothing
            for range_unit in findall(numb[1], str)
                split_string[range_unit[1]] = numb[2]
            end
        end
    end
    str = join(split_string)
    for char in str
        try
            append!(list, parse(Int, char))
        catch
            continue
        end
    end
    length(list) != 0 && (sum += parse(Int, (string(first(list)) * string(last(list)))))
end
print(sum)