/*
Tests
uncomment the two lines below to create two test gears
*/
//color("green")rotate(a=6.6)gear(20,8,0.5,2,0.85);
//color("red")translate([15.15,0,0])spur_gear(18,8,0.5,2,7.6,6.9);

/*
Module gear: a simple straight teeth gear
variables
----------------------------------------------------
n = number of teeth
r = outer radius of the gear
r2 = radius of the center hole for shaft
h = thickness of the gear
p = pitch of the gear's teeth
----------------------------------------------------
*/
module gear(n,r,r2,h,p){
    step=360/n;
    linear_extrude(height=h){
        difference(){
            polygon([for(i=[0:step:360-step],b=[1:4])[((b==1||b==2)?p:1)*r*cos(i+((step/4)*b)),((b==1||b==2)?p:1)*r*sin(i+((step/4)*b))]]);
            circle(r2,$fn=100);
        }
    }
}

/*
Module spur_gear: a simple spur gear
variables
----------------------------------------------------
n = number of teeth
r = outer radius of the gear
r2 = radius of the center hole for shaft
height = thickness of the gear
pitch = pitch of the gear's teeth
root = the radius of the gear root
----------------------------------------------------
*/
module spur_gear(n,r,r2,height,pitch,root){
    step = 360/n;
    offsets = [(step/6)-((step/6)/6),(step/6)+((step/6)/6),(step/6),(step/6)-((step/6)/10),(step/6)+((step/6)/10),(step/6)];
    linear_extrude(height=height){
        difference(){
        polygon([for(i=[0:step:360-step],b=[1:6])[((b==1||b==2)?r:1)*((b==3||b==6)?pitch:1)*((b==4||b==5)?root:1)*cos(i+(offsets[b-1]*b)),((b==1||b==2)?r:1)*((b==3||b==6)?pitch:1)*((b==4||b==5)?root:1)*sin(i+(offsets[b-1]*b))]]); 
            circle(r2,$fn=100);
        }
    }
}