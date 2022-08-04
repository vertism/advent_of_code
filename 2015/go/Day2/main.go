package main

import (
	"fmt"
	"sort"
	"strconv"
	"strings"

	"net.pepler/advent"
)

func main() {
	data := advent.FileToSlice("input")

	paper := 0
	ribbon := 0

	for _, item := range data {
		sDims := strings.Split(item, "x")
		iDims := []int{}
		for _, s := range sDims {
			dim, _ := strconv.Atoi(s)
			iDims = append(iDims, dim)
		}
		sort.Ints(iDims)

		paper += iDims[0] * iDims[1]
		paper += iDims[0] * iDims[1] * 2
		paper += iDims[0] * iDims[2] * 2
		paper += iDims[1] * iDims[2] * 2

		ribbon += (iDims[0] + iDims[1]) * 2
		ribbon += iDims[0] * iDims[1] * iDims[2]
	}

	fmt.Println("part 1: ", paper)
	fmt.Println("part 2: ", ribbon)
}
