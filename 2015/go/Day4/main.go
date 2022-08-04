package main

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"strconv"
)

func main() {
	input := "iwrupvqb"

	five, six := 0, 0

	i := 1
	for {
		str := input + strconv.Itoa(i)
		h := md5.Sum([]byte(str))

		if five == 0 && hex.EncodeToString(h[:])[:5] == "00000" {
			five = i
		}

		if hex.EncodeToString(h[:])[:6] == "000000" {
			six = i
			break
		}
		i++
	}

	fmt.Println("part 1:", five)
	fmt.Println("part 2:", six)
}
