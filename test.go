package main

type Collector struct {}

type CollectorOption func(*Collector)

func test(coll *Collector) {
	print("hello world!")
}

func main() {
	var c CollectorOption
	c = test
	c(&Collector{})
}