//calculate distance from monster to player
dest = distance_to_point(playerLNLX,playerLNLY);

if(dest >= lightMonsterVisualRange) {
    awareOfPlayer = true;
    if(!chasing) { //if we are starting a new path
        chasing = true;
        path_end();
        path_add_point(pursuit_path,x,y,lightMonsterSpeed);

    }
    else {
        path_add_point(pursuit_path,x,y,lightMonsterSpeed);
    }
}
else {
    awareOfPlayer = false;
    /*
        This check fails to continue pursuing the player if the player manages to get
        far enough away from the monster by the time the monster gets to the LNL.
    */
    if(x == playerLNLX && y == playerLNLY) {
        //start rewinding back to the original position in the initial path
        path_start(pursuit_path,-lightMonsterSpeed,1,true);
    }
     
}

//THIS MODEL ASSIGNS VALUES TO awareOfPlayer and will take too much time

