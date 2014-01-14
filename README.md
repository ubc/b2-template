Work in progress, only partially implemented. Summary below is the intention/roadmap.

Blackboard Building Block template for a REST style building block. Tested on a Blackboard Learn 9.1 SP13 instance.

Server side provided by the [Jersey framework](https://jersey.java.net/). Client side using [AngularJS](http://angularjs.org/). Java logging using the [Logback](http://logback.qos.ch/) implementation of the [SLF4J](http://www.slf4j.org/) API. 

Overall project dependency management provided by [Gradle](http://www.gradle.org/). Augmented by [Bower](http://bower.io/) for client side dependency management. Gradle should automatically call Bower in the initial setup.

# Requirements

* Gradle 1.9
* [Apache Ant](http://ant.apache.org/) 1.9.2

Version number might not be hard requirements, just the version that was tested.

# Configuration

In `build.gradle`, edit `bblServer` to the address of the Blackboard Learn server you want to deploy the building blocks to.

## Optional

Java logging using Logback has a configuration file at `webapp/WEB-INF/classes/logback.xml`

# Usage

To build the building block:

    gradle build

To build and deploy the building block (must configure deployment target server):

    gradle deploy

To create an Eclipse project:

    gradle eclipse

If you messed up the Eclipse project and need to recreate it from scratch:

    gradle cleanEclipse
    gradle eclipse

# Gradle Notes

* Blackboard Libraries - Currently pulling from the Blackboard's Maven repository, which unfortunately hasn't been updated since SP12.
* The webapp/ directory is in the project root for faster access. Note that the default location for webapp is src/main/webapp/. There is an extra directive for including the webapp/ in the project root.
* The building block deployment is done by creating an Ant task and then executing it. The Ant task is how the old deployment script worked. I'm not sure if the Ant task is necessary or if some built in Gradle capability can be used instead.
