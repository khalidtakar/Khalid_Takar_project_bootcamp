class Food {
  boolean is_eaten;
  PVector position;
  float foodSize;
  color foodColour;
  PVector velocity;
  Food(float foodX_, float foodY_) {
    position = new PVector(foodX_, foodY_);
    randomise();
  }

  void draw() {
     if (!is_eaten) {
      fill(foodColour);
      circle(position.x, position.y, foodSize);
    }
  }

  void randomise() {
    velocity = new PVector(random(-5, 5), random(-5, 5));
    foodColour = color(random(0, 255), random(0, 255), random(0, 255));
    foodSize = random(10, 45);
  }

  void move()
  {
    position.x = position.x + velocity.x;
    position.y = position.y + velocity.y;
      // i think this increases the movement of the balls in x and y coordinates
    if (position.x-radius < 0 && velocity.x < 0)
    {
      // Escaping to the left, start moving right.
      velocity.x = -1*velocity.x;
    } else if (position.x+radius > width && velocity.x > 0)
    {
      // Escaping to the right, start moving left.
      velocity.x = -1*velocity.x;
    }

    if (position.y-radius < 0 && velocity.y < 0)
    {
      // Escaping upwards, start moving down.
      velocity.y = -1*velocity.y;
    } else if (position.y+radius > height && velocity.y > 0)
    {
      // Escaping downwards, start moving up.
      velocity.y = -1*velocity.y;
    }
  }
  boolean collide(float inX, float inY) {
    return dist(inX, inY, position.x, position.y)<= foodSize;
  }
}
