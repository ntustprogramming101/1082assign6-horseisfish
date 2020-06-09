class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
	int direction = RIGHT;
	Laser laser;
	int timer = 0;

	float speed = 2f;
	boolean dectected = false;
	boolean fired = false;
	
	void display(){
		//int direction = (speed > 0) ? RIGHT : LEFT;

		pushMatrix();
		translate(x, y);
		if (direction == RIGHT) {
			scale(1, 1);
			image(robot, 0, 0, w, h); 
		}
		else {
			scale(-1, 1);
			image(robot, -w, 0, w, h); 
		}
		popMatrix();
		
	}
	
	void update(){
		
		x += speed;
		
		if(dectected == true){
			speed = 0;
			if(fired != true){
				firelaser(player);
			}else{
				timer++;
				//println(timer);
			}
			if(timer/180 == 1){
				fired = false;
				timer = 0;
			}			
			laser.display();
			laser.update();
			laser.checkCollision(player);
			
			/*laser.display();
			laser.update();
			laser.checkCollision(player);*/
						
			
		}else if(speed == 0 && direction == RIGHT){
			speed = 2f;
		}else if(speed == 0 && direction == LEFT){
			speed = -2f;
		}

		if(x >= width - w || x <= 0){
			speed *= -1;
			direction = (speed > 0) ? RIGHT : LEFT;
		}
	}

	void detectPlayer(Player player){
		
			if(player.row >= (this.y / SOIL_SIZE) - 2 && player.row <= (this.y / SOIL_SIZE) + 2){
				if(player.x > this.x && direction == RIGHT || player.x < this.x && direction == LEFT){
					dectected = true;
				}
			}else{
				dectected = false;
			}
		
	}
	void firelaser(Player player){
		//println("fire");
		laser = new Laser();
		if(direction == RIGHT){
			laser.fire(this.x + HAND_OFFSET_X_FORWARD, this.y + HAND_OFFSET_Y, player.x + player.w/2 , player.y + player.h/2);
		}else{	
			laser.fire(this.x + HAND_OFFSET_X_BACKWARD, this.y + HAND_OFFSET_Y, player.x + player.w/2 , player.y + player.h/2);
		}
		fired = true;
	}	

	Robot(float x, float y){
		super(x, y);
	}
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
