extends CharacterBody2D


const SPEED = 100.0
var wait5 = 0
var test = 600


func _ready():
	position.x = 120
	position.y = 172
	pass

func _physics_process(delta):
	if(test <=0 && test >= -45):
		velocity.y = SPEED;
		move_and_slide();
		wait5=1;
	if(wait5!=0&&wait5!=6):
		wait5+=1;
	if(wait5==5):
		position.x = 896
		position.y = 256
	test-=1
