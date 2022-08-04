package main

import (
	"fmt"

	"net.pepler/advent"
)

func main() {
	encodedCount, codeCount, stringsCount := 0, 0, 0
	data := advent.FileToSlice("input")
	for _, line := range data {
		encodedCount += len(fmt.Sprintf("%q", line))
		codeCount += len(line)
		for i := 1; i < len(line)-1; i++ {
			if string(line[i]) == "\\" {
				if string(line[i+1]) == "\\" || string(line[i+1]) == "\"" {
					i++
				} else if string(line[i+1]) == "x" {
					i += 3
				}
			}
			stringsCount++
		}
	}
	fmt.Println("part 1:", codeCount-stringsCount)
	fmt.Println("part 2:", encodedCount-codeCount)
}
