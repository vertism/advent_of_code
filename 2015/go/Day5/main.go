package main

import (
	"fmt"
	"strings"

	"net.pepler/advent"
)

func main() {
	data := advent.FileToSlice("input")

	nice := 0

	for _, str := range data {
		double := false
		badSub := false
		vowels := 0
		for i := 0; i < len(str)-1; i++ {
			if i == 0 {
				if strings.ContainsAny(string(str[i]), "aeiou") {
					vowels++
				}
			}

			if strings.ContainsAny(string(str[i+1]), "aeiou") {
				vowels++
			}
			if str[i] == str[i+1] {
				double = true
			}
			if str[i:i+2] == "cd" || str[i:i+2] == "ab" || str[i:i+2] == "pq" || str[i:i+2] == "xy" {
				badSub = true
			}
		}
		if !badSub && double && vowels >= 3 {
			nice++
		}
	}

	fmt.Println("part 1:", nice)

	nice = 0

	for _, str := range data {
		doubled, repeats := false, false

		for i := 0; i < len(str)-3; i++ {
			pair := str[i : i+2]
			for j := i + 2; j < len(str)-1; j++ {
				pair2 := str[j : j+2]
				if pair == pair2 {
					doubled = true
				}
			}
		}

		if !doubled {
			continue
		}

		for i := 0; i < len(str)-2; i++ {
			if str[i] == str[i+2] {
				repeats = true
				break
			}

		}

		if repeats {
			nice++
		}
	}

	fmt.Println("part 2:", nice)
}
