show_debug_message("Mode:\tPhysics Test");

//(force/mass) = force / mass
//change in position = velocity * dt;
//change in velocity = (force/mass) *dt;


t = 0.0;
dt = 1/60;
velocity = 0.0;
position = 0.0;
force = 10.0;
mass = 1.0;

enum phys_state{
	explicit_euler,
	semi_implicit_euler,
	custom_implicit
}

state = phys_state.custom_implicit;

switch(state)
{
	case phys_state.explicit_euler:
	{		
		while( t <= 10.0)
		{
			show_debug_message("t=" + string(t) + ":" + "\tposition = " + string(position) + "\tvelocity = " + string(velocity));
			position = position + velocity * dt;
			velocity = velocity + (force/mass) * dt;
			t += dt;
		}
	}break;
	case phys_state.semi_implicit_euler:
	{
		while( t <= 10.0)
		{
			show_debug_message("t=" + string(t) + ":" + "\tposition = " + string(position) + "\tvelocity = " + string(velocity));
			velocity = velocity + (force/mass) * dt;
			position = position + velocity * dt;
			t += dt;
		}
	}break;
	case phys_state.custom_implicit:
	{
		dt = 1/60;
		velocity = 0.0;
		position = 0.0;
		acceleration = 5;
		while(t <= 1)
		{
			show_debug_message("t=" + string(t) + ":" + "\tposition = " + string(position) + "\tvelocity = " + string(velocity));
			velocity = velocity + (acceleration * dt);
			position = position + (velocity * dt);
			t += dt;
		
		
		}
		
	}break;
}


