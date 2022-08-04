package main

import (
	"fmt"
	"os"
)

func main() {
	data, _ := os.ReadFile("input")
	floor := 0
	basement := 0
	for index, ins := range data {
		switch string(ins) {
		case "(":
			floor++
		case ")":
			floor--
		}

		if floor == -1 && basement == 0 {
			basement = index + 1
		}
	}

	fmt.Println("part 1 =", floor)
	fmt.Println("part 2 =", basement)
}
