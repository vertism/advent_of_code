package main

import (
	"fmt"
	"strconv"
	"strings"

	"net.pepler/advent"
)

func main() {
	data := advent.FileToSlice("input")

	display := make([][]int, 1000)
	brightness := make([][]int, 1000)

	for i := 0; i <= 999; i++ {
		display[i] = make([]int, 1000)
		brightness[i] = make([]int, 1000)
		for j := 0; j <= 999; j++ {
			display[i][j] = 0
			brightness[i][j] = 0
		}
	}

	for _, line := range data {
		a := 0
		ins := ""
		if line[:6] == "toggle" {
			ins = "toggle"
			a = 7
		} else if line[:7] == "turn on" {
			ins = "on"
			a = 8
		} else {
			ins = "off"
			a = 9
		}

		coords := strings.Split(line[a:], " through ")
		from := strings.Split(coords[0], ",")
		to := strings.Split(coords[1], ",")
		x1, _ := strconv.Atoi(from[0])
		y1, _ := strconv.Atoi(from[1])
		x2, _ := strconv.Atoi(to[0])
		y2, _ := strconv.Atoi(to[1])

		for i := x1; i <= x2; i++ {
			for j := y1; j <= y2; j++ {
				switch ins {
				case "on":
					display[i][j] = 1
					brightness[i][j]++
				case "off":
					display[i][j] = 0
					if brightness[i][j] > 0 {
						brightness[i][j]--
					}
				case "toggle":
					brightness[i][j] += 2
					if display[i][j] == 1 {
						display[i][j] = 0
					} else {
						display[i][j] = 1
					}
				}
			}
		}
	}

	count, sum := 0, 0

	for i := 0; i <= 999; i++ {
		for j := 0; j <= 999; j++ {
			count += display[i][j]
			sum += brightness[i][j]
		}
	}

	fmt.Println("part 1:", count)
	fmt.Println("part 2:", sum)
}
