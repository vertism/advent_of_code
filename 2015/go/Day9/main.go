package main

import (
	"fmt"
	"strconv"
	"strings"

	"golang.org/x/exp/slices"

	"net.pepler/advent"
)

func main() {
	data := advent.FileToSlice("input")

	routes := make(map[string][]string)

	for _, route := range data {
		parts := strings.Split(route, " = ")
		distance := parts[1]
		locations := strings.Split(parts[0], " to ")
		from, to := locations[0], locations[1]
		routes[from] = append(routes[from], to, distance)
		routes[to] = append(routes[to], from, distance)
	}

	shortest, longest := 0, 0

	for from := range routes {
		visited := []string{from}
		distShort, distLong := calculate(from, routes, visited, 0)
		if shortest == 0 || distShort < shortest {
			shortest = distShort
		}
		if longest == 0 || distLong > longest {
			longest = distLong
		}
	}

	fmt.Println("part 1: ", shortest)
	fmt.Println("part 2: ", longest)
}

func calculate(from string, routes map[string][]string, visited []string, distance int) (int, int) {
	shortest, longest := 0, 0
	options := routes[from]
	for i := 0; i < len(options)-1; i += 2 {
		currentVisited := make([]string, len(visited))
		copy(currentVisited, visited)
		to := options[i]
		leg, _ := strconv.Atoi(options[i+1])
		if !slices.Contains(currentVisited, to) {
			currentVisited = append(currentVisited, to)
			currentShortest, currentLongest := calculate(to, routes, currentVisited, distance+leg)
			if shortest == 0 || currentShortest < shortest {
				shortest = currentShortest
			}
			if longest == 0 || currentLongest > longest {
				longest = currentLongest
			}
		}
	}

	if shortest == 0 {
		shortest = distance
	}
	if longest == 0 {
		longest = distance
	}

	return shortest, longest
}
