
fn main() {
	msg := 30

	fn () {
		msg := 20
		print(msg)
	}()
	print(msg)
	hello()
}
