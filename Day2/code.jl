file = open("../Day2/input.txt", "r")
input = read(file, String)
close(file)
vector = split(input, "\n")

#Part 1
sum = 0
clean = [split(i[9:length(i)], r"[;,:]") for i in vector]
for (game, i) in enumerate(clean)
    list = [0, 0, 0]
    for (round, j) in enumerate(i)
        single = split(j, " ")
        single[1] == "" && popfirst!(single)
        length(single) == 0 && continue

        if single[2] == "red"
            list[1] = parse(Int, single[1])
        elseif single[2] == "green"
            list[2] = parse(Int, single[1])
        else
            list[3] = parse(Int, single[1])
        end

        (list[1] > 12 || list[2] > 13 || list[3] > 14) && break
        round == length(i) && (sum += game)
    end
end
print(sum)

#Part 2
sum = 0
clean = [split(i[9:length(i)], r"[;,:]") for i in vector]
for (game, i) in enumerate(clean)
    red = Vector()
    green = Vector()
    blue = Vector()
    for (round, j) in enumerate(i)
        single = split(j, " ")
        single[1] == "" && popfirst!(single)
        length(single) == 0 && continue

        if single[2] == "red"
            append!(red, parse(Int, single[1]))
        elseif single[2] == "green"
            append!(green, parse(Int, single[1]))
        else
            append!(blue, parse(Int, single[1]))
        end

        round == length(i) && (sum += (maximum(red) * maximum(green) * maximum(blue)))
    end
end
print(sum)