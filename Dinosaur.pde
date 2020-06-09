class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class

	float speed = 1f;
	float originSpeed = 1f;
	final float TRIGGERED_SPEED_MULTIPLIER = 5;
	boolean dectected = false;
	void display(){
		int direction = (speed > 0) ? RIGHT : LEFT;

		pushMatrix();
		translate(x, y);
		if (direction == RIGHT) {
			scale(1, 1);
			image(dinosaur, 0, 0, w, h); 
		} else {
			scale(-1, 1);
			image(dinosaur, -w, 0, w, h); 
		}
		popMatrix();
	}

	void update(){
		
		
		
		if(dectected == true && abs(speed) != 5f){
			speed *= TRIGGERED_SPEED_MULTIPLIER;
		}else if(abs(speed) == 5f){
			speed /= TRIGGERED_SPEED_MULTIPLIER;
		}
		
		if(x >= width - w || x <= 0){
			speed *= -1;
		}
		x += speed;
	}

	void detectPlayer(Player player){
		
			if(player.y == this.y){
				if(player.x > x && speed > 0 || player.x < x && speed < 0){
				dectected = true;
				}
			}else{
				dectected = false;
			}
		
	}
	

	Dinosaur(float x, float y){
		super(x, y);
	
	}
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
