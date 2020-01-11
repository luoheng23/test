package main

func distance(p1 []int, p2 []int) int {
	x, y := p1[0]-p2[0], p1[1]-p2[1]
	return x*x + y*y
}

func validSquare(p1 []int, p2 []int, p3 []int, p4 []int) bool {
	x1, x2, x3, x4, x5, x6 := distance(p1, p2), distance(p1, p3), distance(p1, p4), distance(p2, p3), distance(p2, p4), distance(p3, p4)
	var m map[int]int = map[int]int{}
	m[x1]++
	m[x2]++
	m[x3]++
	m[x4]++
	m[x5]++
	m[x6]++
	println(m[1], m[2])
	if len(m) != 2 {
		return false
	}
	var s, s_value int
	for key, value := range m {
		if s != 0 {
			println(value, s_value, key, s)
			if value*2 == s_value && key == 4 && s == 2 || s_value*2 == value && key == 2 && s == 4 {
				return true
			}
			return false
		}
		s, s_value = key, value
		println(s, s_value)
	}
	return false
}
func main() {
	p1 := []int{0, 0}
	p2 := []int{1, 1}
	p3 := []int{0, 1}
	p4 := []int{1, 0}
	println(validSquare(p1, p2, p3, p4))

}
