
import Foundation

/*
  Object oriented Programming
 =============================
> During the life the app we can create and destroy objects
> Create - Initialize(init) = Allocate(add to memory)
> Destroy - Deinitialize (deinit) = Deallocate (remove from memory)
 
 
 ARC (Automatic Reference Counting)
 ==================================
> A live count of the number of objects in memory
 
 1. Create 1 object, Count goes up by 1
 2. Create 2 object, Count goes up by 2
 3. Destroy 1 object, Count goes down by 1
 4. Destroy 1 object, Count goes down by 0
 
> The more objects in memory, the slower the app performs
> We want to keep the ARC count as low as possible
> We want to create objects only when we need them
> And Destroy them as soon as we no longer need them
 
> For Example, If an App has 2 Screens and user is moving from screen1 to screen2.
> We only want to allocate screen2 when we need it.(i.e. When the user clicks a button to segue to screen2)
> When we get to screen2, we may want to deallocate screen1.
 
 
> There are 2 types of Memory
 
 Stack and Heap
 ---------------
> Only Objects in the Heap are counted towards ARC.

 Objects in the Stack
 ---------------------
 String,Bool, Int, Most basic Types
 New: Struct, Enum
 
 Objects in the Heap
 --------------------
 Functions
 New: Class, Actors
 
> The Iphone is a "Multi Threaded Environment"
> There are multiple "Threads" or "Engines" running simultaneously
> Each thread has a Stack
> But there is only 1 Heap for all the Threads
 
 Therefore :
 * Stack is Faster, lower memory footprint, preferable
 * Heap is Slower, higher memory footprint, risk of threading issue
 
 Value vs Reference Types
 
 Objects in the stack are "Value" types.
 When you edit a Value type, you create a copy of it with new data.
 
 Objects in the heap are Reference types.
 When you edit a reference type, you edit the object that you are referencing. This "reference" is called "pointer" bcause it "points" to an object in the Heap (in Memory).
 
 */

struct myObj{
    let title: String = "Hello World"
}
class MyClass{
    let title: String = "Hello World"
}

//Class vs Struct
/*
 Imagine a school and in the schhol there are classrooms.
 Within each class, there are quizzes.
 During the day, the teacher will hand out many different quizzes to different classes. The Students will answer the quizzes and return them back to the teacher.
 
 //School    --> App
 //Classroom --> Class
 //Quizzes   --> Struct
 
 
> In this example, we have a classroom and there are many actions that occur inside a classroom.
> In Code, we create a class and can perform actions within the class.
> In this Example, there are many different types of quizzes. The teacher hands out the quizzes and the students take the quizzes and return them to the Teacher.
> In Code, we create many structs and pass them around out app with ease.
 
 //Note:
 This metaphor is not Perfect.
 Technical a "Quiz" can be a class, etc.
 
 We want to use a class for things like:
 "Manager" "DataService" "Service" "Factory" "ViewModel"
 Objects that we create and want to perform actions inside.
 
 We want to use a struct for things like:
 Data Models
 Objects that we create and pass around our app.
  
 */
