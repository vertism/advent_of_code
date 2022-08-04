package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	data, _ := os.ReadFile("input")

	delivered := map[string]int{"0_0": 1}

	x, y := 0, 0

	for _, ins := range data {
		switch string(ins) {
		case ">":
			x++
		case "<":
			x--
		case "^":
			y--
		case "v":
			y++
		}
		key := strconv.Itoa(x) + "_" + strconv.Itoa(y)
		delivered[key]++
	}

	fmt.Println("part 1: ", len(delivered))

	// Part 2
	delivered2 := map[string]int{"0_0": 2}

	x1, y1 := 0, 0
	x2, y2 := 0, 0

	for index, ins := range data {
		var key string
		if index%2 == 0 {
			switch string(ins) {
			case ">":
				x1++
			case "<":
				x1--
			case "^":
				y1--
			case "v":
				y1++
			}
			key = strconv.Itoa(x1) + "_" + strconv.Itoa(y1)
		} else {
			switch string(ins) {
			case ">":
				x2++
			case "<":
				x2--
			case "^":
				y2--
			case "v":
				y2++
			}
			key = strconv.Itoa(x2) + "_" + strconv.Itoa(y2)
		}
		delivered2[key]++
	}

	fmt.Println("part 2: ", len(delivered2))
}
