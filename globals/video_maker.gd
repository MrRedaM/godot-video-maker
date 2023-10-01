extends Node


func search_node(node_path):
	return get_tree().current_scene.find_child(node_path)
