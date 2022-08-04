package main

import (
	"fmt"
	"strconv"
	"strings"

	"net.pepler/advent"
)

func main() {
	data := advent.FileToSlice("input")

	lookup := make(map[string]string)

	for _, line := range data {
		parts := strings.Split(line, " -> ")
		lookup[parts[1]] = parts[0]
	}

	val := calc(lookup, "a")

	fmt.Println("part 1:", val)

	for _, line := range data {
		parts := strings.Split(line, " -> ")
		if parts[1] == "b" {
			lookup["b"] = val
		} else {
			lookup[parts[1]] = parts[0]
		}
	}

	val2 := calc(lookup, "a")

	fmt.Println("part 2:", val2)
}

func calc(lookup map[string]string, key string) string {
	ins := lookup[key]
	parts := strings.Fields(ins)

	var result string

	// Single value
	if len(parts) == 1 {
		if _, ok := lookup[ins]; ok {
			result = calc(lookup, ins)
		} else {
			result = ins
		}
		lookup[key] = result
		return result
	}

	// NOT
	if len(parts) == 2 {
		val := calc(lookup, parts[1])
		iVal, _ := strconv.Atoi(val)
		sVal := fmt.Sprintf("%016b", uint16(iVal))
		sNot := ""
		for _, c := range sVal {
			if string(c) == "0" {
				sNot += "1"
			} else {
				sNot += "0"
			}
		}
		iRet, _ := strconv.ParseInt(sNot, 2, 32)

		result = strconv.Itoa(int(iRet))
		lookup[key] = result
		return result
	}

	var a, b string
	if _, ok := lookup[parts[0]]; ok {
		a = calc(lookup, parts[0])
	} else {
		a = parts[0]
	}

	if _, ok := lookup[parts[2]]; ok {
		b = calc(lookup, parts[2])
	} else {
		b = parts[2]
	}
	iA, _ := strconv.Atoi(a)
	iB, _ := strconv.Atoi(b)

	if parts[1] == "AND" {
		result = strconv.Itoa(iA & iB)
	} else if parts[1] == "OR" {
		result = strconv.Itoa(iA | iB)
	} else if parts[1] == "LSHIFT" {
		result = strconv.Itoa(iA << iB)
	} else if parts[1] == "RSHIFT" {
		result = strconv.Itoa(iA >> iB)
	}

	lookup[key] = result
	return result
}
