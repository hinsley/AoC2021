import math

with open("input.txt") as f:
  lines = [line.strip() for line in f.readlines()]
  line_count = len(lines)

  # Part One
  accs = [0 for char in lines[0]]
  for line in lines:
    for i, char in enumerate(line):
      accs[i] += 1 if char == "1" else 0
  gamma = sum([round(acc / line_count) * (2 ** i) for
              i, acc in enumerate(reversed(accs))])
  epsilon = (2 ** len(accs) - 1) ^ gamma

  print(gamma * epsilon)

  # Part Two
  o2candidates = lines
  co2candidates = lines
  o2rating = -1
  co2rating = -1
  for i in range(len(lines[0])):
    if o2rating == -1:
      o2candidates_mode = math.floor(sum([
        1 if val[i] == "1" else 0 for val in o2candidates
      ]) / len(o2candidates) - 0.5) + 1 # This weirdness is required because Python does banker's rounding in round().

      # Prune bad candidates.
      o2candidates = [val for val in o2candidates if int(val[i]) == o2candidates_mode]
      if len(o2candidates) == 1:
        o2rating = int(o2candidates[0], 2)
    
    if co2rating == -1:
      co2candidates_mode = math.floor(sum([
        1 if val[i] == "1" else 0 for val in co2candidates
      ]) / len(co2candidates) - 0.5) + 1

      # Prune bad candidates.
      co2candidates = [val for val in co2candidates if int(val[i]) != co2candidates_mode]
      if len(co2candidates) == 1:
        co2rating = int(co2candidates[0], 2)
  
  print(o2rating * co2rating)
