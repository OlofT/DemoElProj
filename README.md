# DemoElProj

## Task Description
 
Create a small app that lists the Oven retrieved from the provided json file
 
- Create a thin mocked networking layer with a fake API call that retrieves the provided json from file
- The main screen should consist of a List that lists the one oven retrieved from the mocked API call
- The oven name should be taken from the json
- "applianceState": "READY_TO_START" means that the oven is “Off”.
- Pressing the oven inside the list in the main screen should take you to the “Remote control view”
- In the “Remote control view” you should show the correct appliance name, state, current function and current target temperature for the oven as displayed in the Figma file.
- Turn off/on button doesn’t have to be implemented
- Tab bar doesn’t have to be implemented
 
The screens should be developed using SwiftUI.
 
General:

1. Create a project on GitHub and share a link with us when the implementation is ready for a demo
2. Show the best of working with git: branching, committing, commenting, etc.
3. Use SwiftUI and Swift
4. Don’t use Strings when representing appliance state and functions
5. Follow Apple human interface guidelines
6. Try to follow MVVM design pattern while developing the app
7. Write comments and leave marks
8. Variables should have sensible names
9. No crashes
 
Screen Contents:

1. Use any approach for screen building (with SwiftUI that is)
2. Show oven image, name, state, target temperature and function
3. Design using the Figma file provided.
Optional:

1. (Optional) Use Combine for retrieving the mocked JSON
2. (Optional) Use Dependency Injection (of your choice)
3. (Optional) Cache “network requests”
4. (Optional) Create a fake spinner while “loading” the ovens
5. (Optional) Write some sensible Unit Tests
 
