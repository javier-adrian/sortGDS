extends Node2D


var size : int = 100
var array : Array = Array(range(100))
var cursor : Array[int]

var width : int
var viewport_size : Vector2
var margin : int

var rect_pos : Vector2
var rect_size : Vector2
var color : Color

var sorting : bool = false
var current: int = 0


func swap(a : int, b : int):
	var c : int= array[a]
	array[a] = array[b]
	array[b] = c


func bubble_sort():
	for i in array.size() - 1:
		while array[i] > array[i+1]:
			cursor.clear()
			cursor.append(i)
			swap(i, i+1)
			i += 1
			if i == 99:
				break


func resize() -> void:
	viewport_size = get_viewport_rect().size
	width = viewport_size.x * .9 / 100
	margin = viewport_size.x * .06 # idk why its .06 but ok


func _ready() -> void:
	get_tree().root.size_changed.connect(_on_viewport_size_changed)
	resize()
	array.shuffle()


func _on_viewport_size_changed() -> void:
	resize()


func _process(_delta: float) -> void:
	queue_redraw()


func _draw() -> void:
	for i in array:
		rect_pos = Vector2(i * width + margin, 0)
		rect_size = Vector2(width - 1, -(array[i] + 1))
		# color = Color.RED if i in cursor else Color.WHITE
		color = Color.WHITE

		draw_rect(Rect2(rect_pos, rect_size), color)
