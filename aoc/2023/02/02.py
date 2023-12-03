#!/usr/bin/env python

from sys import argv
from functools import reduce

def part_one():
    if len(argv) < 2:
        print(f"Usage: {argv[0]} input_file")
        exit(1)

    bag_max_cubes = { 'red' : 12, 'green' : 13, 'blue' : 14 }
    game_possible_sum = 0
    with open(argv[1]) as input_file:
        for line in input_file:
            line = line.strip()
            line_id = int(line.split(" ")[1].replace(":" , "")) # obtain id
            line_game = line.split(": ")[1]
            line_game_subsets = [i for i in line_game.split("; ")]
            line_game_is_valid = True
            for game in line_game_subsets:
                line_game_cubes = game.split(", ")
                for cube_pair in line_game_cubes:
                    cube_pair_color = cube_pair.split(" ")[1]
                    cube_pair_value = int(cube_pair.split(" ")[0])
                    if cube_pair_value > bag_max_cubes[cube_pair_color]:
                        line_game_is_valid = False
            if line_game_is_valid:
                game_possible_sum += line_id
        print(game_possible_sum)


def part_two():
    if len(argv) < 2:
        print(f"Usage: {argv[0]} input_file")
        exit(1)

    input_file_power_sum = 0;
    with open(argv[1]) as input_file:
        for line in input_file:
            bag_fewest_cubes = { 'red' : 0, 'green' : 0, 'blue' : 0 }
            line = line.strip()
            line_id = int(line.split(" ")[1].replace(":" , ""))
            line_game = line.split(": ")[1]
            line_game_subsets = [i for i in line_game.split("; ")]
            line_game_is_valid = True
            for game in line_game_subsets:
                line_game_cubes = game.split(", ")
                for cube_pair in line_game_cubes:
                    cube_pair_color = cube_pair.split(" ")[1]
                    cube_pair_value = int(cube_pair.split(" ")[0])
                    if cube_pair_value > bag_fewest_cubes[cube_pair_color]:
                        bag_fewest_cubes[cube_pair_color] = cube_pair_value
            line_game_cubes_power = reduce((lambda x, y: x * y), 
                                           bag_fewest_cubes.values())
            # print(line, "\n", bag_fewest_cubes, line_game_cubes_power)
            input_file_power_sum += line_game_cubes_power
    print(input_file_power_sum)


if __name__ == "__main__":
    part_one()
    part_two()
