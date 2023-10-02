extends Video


func _ready():
	video_started.connect(func(): print("Video started"))
	video_finished.connect(func(): print("Video ended"))
	super()
	start_video()
