# Matrix Animation
Once the Program is started up there isn't much to do other than observe a stick figure representation of the classic matrix scene. There is some user interactivity available which is listed below:

### Pressing 'U'
pressing 'u' allows you to go up higher above the scene while still looking at neo, it creates a bit of a new perspective

### Pressing 'D'
pressing 'd' alternatively does the opposite. The camera shifts lower than originally and allows you to look from a lower angle at the scene. 

## Project Description
**01001101 01100001 01110100 01110010 01101001 01111000**

Narrative:
    The narrative of this animation is the epic scene in the matrix where neo dodges bullets. In this one though, its a stick figure fight near the eiffel tower (it's tucked away in one of the corners). Agent smith stick figure unleashes an unrelenting rain of gunfire on a nimble neo who dodges them effortlessly.

Class Descriptions:
    Backdrop
        This class creates the background image for the animation. It takes in a panorama for the surroundings as an input, the width and height of the view window, as well as jpg files for the ground and sky. Then display function essentially maps those jpgs as textures to create a box that the animation will occur inside of.

    Cam
        URL for ChatGPT conversation - also can see in txt format in gpt.txt
            https://chat.openai.com/share/fb035e2d-9dbd-4adb-9866-3556cb791e93
        The Cam class takes in the screen width and height of the view window, and then with the camOrbit function, the camera orbits around the central character's point, at a width which doesn't clip through the walls of the backdrop. This class also allows user input of either 'u' to make the camera's y level increase to change the angle to look down at neo, or an input of 'd' which does the opposite and looks slightly up at the subject. The lighting is also mostly handled here which the goal was basically to make it look a little dim and dark since the matrix movie felt kinda like that. 


    StickFigure
        The most complex by far, stick figure creates the characters, and depending on a boolean of either neo or not, displays the character in a certain way. This class takes in the x, y, and z coordinates which positions the head of the character first and then builds the body based on those coordinates. The hip angle allows the character to bend at the waist, which can be seen with neo laying back at the hips. Scale allows you to scale the character differently.

        The methods in this class split up the various different components in the character's hierarchy. It first creates the head at the specified location, then builds the body, and then the arms and legs are slightly different depending on the boolean neo. Neo's arms use a method which allows them to rotate in a circle around the shoulder, this function is called armsRotate. ArmsShoot on the other hand rotates around the shoulders but only in a small range, where the right and left arms are off slightly just like in the armsRotate function. Both of these arms functions calls on the arm method, which creates the box at the specified x, y, and z coordinates, and it checks if the character isn't neo, and in that case it loads in a gun obj at the end of the arms. The legs method creates the legs, but checks if it's neo in which case the legs are adjusted slightly to account for the hip rotation. BulletShot shoots a bullet in roughly the same time that the guns kick back to emulate the firing of the gun. The final method is the display method which pieces all of this together and checks for which arms need to be used by checking the boolean neo.

Two Transformation requirement
    I met the two transformation requirement by performing both several rotates and several translates on each object in the scene. There was various scaling to allow the OBJ's to appear a valid size for the animation as well.

Two Classes
    The cam class has the camera as its member
    The backdrop class has essentially all other classes as its members since they're constructed inside of it
    The stick figure class has the two characters as its members, but the head has the body and everything else as members, it also has the camera kind of as a member, but the legs and arms are children of the head as well. Then the gun is a child of the arms and the bullets are a child of the head as well. 

Two Instances
    This is the neo vs agent smith stuff that was outlined in the classes section above. Essentially they are built the same way, but they differ in what their arms do, where they're located, hip rotation, and whether or not the OBJs are loaded in.

Unexpected challenges
    getting the bullets to line up with the gun was a pain in the butt. Also the orbiting camera I used ChatGPT to help me understand how to implement it which was a great time saver. Trying to adjust the speed of the bullets shooting was pretty tough. Getting the gun to rotate the right ways to look right side up in smith's hands was tricky. But all of these snags felt less severe than the stuff I was running into on project 2.

Any extra credit you completed
    OBJ import - 
        I loaded in the gun and bullet OBJs which enabled me to create the actual substance of the animation. Both were animated, one with rotation and the other with translations (after rotating to be the correct orientation)

    Textures - 
        I mapped the textures in the backdrop class. Just creating simple quads that boxed in the animation and then using 25% of the panorama for each side of the box allowed me to wrap the scene nicely.

    Orbit - 
        There is an orbiting feature and there's some user interactivity where you can go up and down, but the orbit itself isn't maneuverable by the user, so it's a little bit of this included but not really. 