import std/[sequtils, parseutils]

proc gted(arr: seq[int], skip: int): int =
  for p in arr.zip(arr[skip ..< arr.len()]):
    if p[1] > p[0]:
      result += 1

proc read_input(filename: string): seq[int] =
  var k: int
  for line in filename.lines:
    discard line.parseInt(k)
    result.add(k)

proc day1_runner*(): (int, int) =
  let s = read_input("input/day1")
  result = (gted(s, 1), gted(s, 3))
