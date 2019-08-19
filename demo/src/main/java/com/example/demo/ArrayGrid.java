/**
 * A 2D grid implemented as an array. Each (x,y) coordinate can hold a single
 * item of type <T>.
 *
 * @param <T> The type of element held in the data structure
 */
public class ArrayGrid<T> implements Grid<T> {

	private Object[][] grid;
	private int width;
	private int height;

	/**
	 * Constructs a new ArrayGrid object with a given width and height.
	 *
	 * @param width  The width of the grid
	 * @param height The height of the grid
	 * @throws IllegalArgumentException If the width or height is less than or equal
	 *                                  to zero
	 */
	public ArrayGrid(int width, int height) throws IllegalArgumentException {
		this.width = width;
		this.height = height;
		if (width <= 0 || height <= 0) {
			throw new IllegalArgumentException();
		}
		grid = new Object[width][height];
	}

	/**
	 * Add an element at a fixed position, overriding any existing element there.
	 *
	 * @param x       The x-coordinate of the element's position
	 * @param y       The y-coordinate of the element's position
	 * @param element The element to be added at the indicated position
	 * @throws IllegalArgumentException If the x or y value is out of the grid's
	 *                                  maximum bounds
	 */
	public void add(int x, int y, T element) throws IllegalArgumentException {
		if (x < 0 || x >= width || y < 0 || y >= height) {
			throw new IllegalArgumentException();
		}
		grid[x][y] = element;
	}

	/**
	 * Returns the element at the indicated position.
	 *
	 * @param x The x-coordinate of the element to retrieve
	 * @param y The y-coordinate of the element to retrieve
	 * @return The element at this position, or null is no elements exist
	 * @throws IndexOutOfBoundsException If the x or y value is out of the grid's
	 *                                   maximum bounds
	 */
	public T get(int x, int y) throws IndexOutOfBoundsException {
		if (x < 0 || x >= width || y < 0 || y >= height) {
			throw new IndexOutOfBoundsException();
		}
		return (T) grid[x][y];
	}

	/**
	 * Removes the element at the indicated position.
	 *
	 * @param x The x-coordinate of the element to remove
	 * @param y The y-coordinate of the element to remove
	 * @return true if an element was successfully removed, false if no element
	 *         exists at (x, y)
	 * @throws IndexOutOfBoundsException If the x or y value is out of the grid's
	 *                                   maximum bounds
	 */
	public boolean remove(int x, int y) throws IndexOutOfBoundsException {
		if (x < 0 || x >= width || y < 0 || y >= height) {
			throw new IndexOutOfBoundsException();
		}
		if (grid[x][y] == null) {
			return false;
		}
		grid[x][y] = null;
		return true;

	}

	/**
	 * Removes all elements stored in the grid.
	 */
	public void clear() {
		for (int i = 0; i < width; i++) {
			for (int j = 0; j < height; j++) {
				grid[i][j] = null;
			}
		}
	}

	/**
	 * Changes the size of the grid. Existing elements should remain at the same (x,
	 * y) coordinate If a resizing operation has invalid dimensions or causes an
	 * element to be lost, the grid should remain unmodified and an
	 * IllegalArgumentException thrown
	 *
	 * @param newWidth  The width of the grid after resizing
	 * @param newHeight The height of the grid after resizing
	 * @throws IllegalArgumentException if the width or height is less than or equal
	 *                                  to zero, or if an element would be lost
	 *                                  after this resizing operation
	 */
	public void resize(int newWidth, int newHeight) throws IllegalArgumentException {
		for (int i = 0; i < width; i++) {
			for (int j = 0; j < height; j++) {
				if ((i >= newWidth || j >= newHeight) && grid[i][j] != null) {
					throw new IllegalArgumentException();
				}
			}
		}
		width = newWidth;
		height = newHeight;
		Object[][] newGrid = new Object[newWidth][newHeight];
		for (int i = 0; i < width; i++) {
			for (int j = 0; j < height; j++) {
				newGrid[i][j] = grid[i][j];
			}
		}
		grid = newGrid;
	}
}