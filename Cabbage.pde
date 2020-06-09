class Cabbage extends Item{
	// Requirement #1: Complete Cabbage Class
	void display(){
		if(isAlive == true){
			image(cabbage , x , y);
		}
		
	}

	void checkCollision(Player player){
		if(isAlive == true && player.health < player.PLAYER_MAX_HEALTH
		&& isHit(x, y, w, h, player.x, player.y, player.w, player.h)){

			player.health ++;
			isAlive = false;

		}

	}

	Cabbage(float x,float y){
		super(x,y);
	}



	/*
	Code for Reference:

		for(int i = 0; i < cabbageX.length; i++){

			// Display Cabbage
			image(cabbage, cabbageX[i], cabbageY[i]);

			// Check collision with player
			

		}

	*/
}