#!/usr/bin/env python3

with open('input', 'r') as file:
    lines = [line.strip() for line in file.readlines()]

a, b = [], []
for line in lines:
    i, j = line.split()
    a.append(int(i))
    b.append(int(j))

a.sort()
b.sort()

distance = 0
for i in range(len(a)):
    distance += abs(a[i] - b[i])

print(distance)
