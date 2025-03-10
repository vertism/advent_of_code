#!/usr/bin/env python3

with open('input', 'r') as file:
    lines = [line.strip() for line in file.readlines()]

a = set()
b = []

for line in lines:
    i, j = line.split()
    a.add(int(i))
    b.append(int(j))

score = 0

for n in b:
    if n in a:
        score += n

print(score)
