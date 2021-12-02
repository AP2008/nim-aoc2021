import std/[sequtils, re, parseutils]

type pair = tuple[move: string, x: int]

proc read_input(filename: string): seq[pair] =
  for line in filename.lines:
    let t = toSeq(line.split(re" "))
    var k: int
    discard parseInt(t[1], k)
    result.add((move: t[0], x: k))

func part1(nums: seq[pair]): int =
  var h, v = 0
  for n in nums:
    case n.move
    of "down": v += n.x
    of "up": v -= n.x
    of "forward": h += n.x
    else: discard
  result = h * v

func part2(nums: seq[pair]): int =
  var h, v, aim = 0
  for n in nums:
    case n.move
    of "down": aim += n.x
    of "up": aim -= n.x
    of "forward":
      h += n.x
      v += aim * n.x
    else: discard
  result = h * v

proc day2_runner*(): (int, int) =
  let input = read_input("input/day2")
  result = (part1(input), part2(input))
