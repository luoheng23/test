	ph := p.cgen.add_placeholder()
	for p.tok == .dot {
		println(typ_str)
		typ_str = p.dot(typ_str, ph)
	}