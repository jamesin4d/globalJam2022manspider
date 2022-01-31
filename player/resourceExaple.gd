# bot_stats.gd
extends Resource
export(int) var health
export(Resource) var sub_resource
export(Array, String) var strings

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_health = 0, p_sub_resource = null, p_strings = []):
	health = p_health
	sub_resource = p_sub_resource
	strings = p_strings
#--------------------------------------------------------------------------
# bot.gd
#extends KinematicBody

#export(Resource) var stats

#func _ready():
	# Uses an implicit, duck-typed interface for any 'health'-compatible resources.
 #   if stats:
  #      print(stats.health) # Prints '10'.
#--------------------------------------------------------------------------------
# bot_stats_table.gd
#extends Resource

#const BotStats = preload("bot_stats.gd")

#var data = {
#    "GodotBot": BotStats.new(10), # Creates instance with 10 health.
#    "DifferentBot": BotStats.new(20) # A different one with 20 health.
#}

#func _init():
 #   print(data)
#----------------------------------------------------------
#extends Node

#class MyResource:
 #   extends Resource
  #  export var value = 5

#func _ready():
 #   var my_res = MyResource.new()

	# This will NOT serialize the 'value' property.
  #  ResourceSaver.save("res://my_res.tres", my_res)
