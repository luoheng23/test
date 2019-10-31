package main

import "llvm.org/llvm/bindings/go/llvm"

func main() {
	t := llvm.CodeModelDefault
	print("hello world", t)
}
