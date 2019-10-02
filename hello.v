
struct Nord {
	h int
	w int
}

fn (n Nord) get() int{
	return n.h + n.w
}

struct M {
	n &Nord
	w int
}

fn main() {
	nt := Nord{2, 3}
	m := M{n: &nt, w: 3}
	println(m.n.get())
}
