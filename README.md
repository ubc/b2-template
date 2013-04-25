Building Block Template for Blackboard Learn
============================================

This template helps developers to set up the building block development environment.

Provides:
* Spring
* Log4J
* JUnit
* Jetty (for testing)
* And more

Requirements:
* JDK
* Apache Ant
* Blackboard SDK

How to Use:
    
    git clone https://github.com/ubc/b2-template.git PROJECT_NAME
    cd PROJECT_NAME
    ant init

This will help you to setup the initial develop environment, including directory structures and download the necessary jar files. You may want to remove this .git directory and create your own git repo once your set up your project.
