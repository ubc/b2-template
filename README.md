Blackboard Building Block template for a REST style building block. Tested on a Blackboard Learn 9.1 SP13 instance.

Server side provided by the [Jersey framework](https://jersey.java.net/). Client side using [AngularJS](http://angularjs.org/) with CSS compiled by [Sass](http://sass-lang.com/). Java logging using the [Logback](http://logback.qos.ch/) implementation of the [SLF4J](http://www.slf4j.org/) API. 

Overall project dependency management provided by [Gradle](http://www.gradle.org/). Augmented by [Bower](http://bower.io/) for client side dependency management. Gradle should automatically call Bower in the initial setup.

# Dependencies

Software that needs to be installed by the user before using this template.

* Gradle 1.10
 * [Apache Ant](http://ant.apache.org/) 1.9.2
* Bower
 * [NodeJS](http://nodejs.org/) 0.10.15
 * [npm](https://npmjs.org/) 1.2.18
* Sass
 * [Ruby](https://www.ruby-lang.org/en/) 1.9.3
 * [RubyGems](http://rubygems.org/) 1.8.23

Version number might not be hard requirements, just the version that was used at the time.

# Configuration

In `build.gradle`, edit `bblServer` to the address of the Blackboard Learn server you want to deploy the building blocks to.

`webapp/WEB_INF/bb-manifest.xml` must be customized. At the very least, a unique name and handle needs to be given to the building block. These are marked with `CHANGEME`.

There are comments with `CHANGEME` spread throughout the example. Those indicate locations where you can configure unique values for your building block. Most `CHANGEME` comments are on the same line as the value to be changed but if the value is too long, then the comment is placed before the line.

## Optional

Java logging using Logback has a configuration file at `webapp/WEB-INF/classes/logback.xml`

# Usage

To build the building block:

    gradle war

The building block war file will be placed in `build/libs/`.

To build and deploy the building block (must configure deployment target server):

    gradle deploy

To create or update an Eclipse project (remember to refresh project in Eclipse):

    gradle eclipse

If you messed up the Eclipse project and need to recreate it from scratch:

    gradle cleanEclipse
    gradle eclipse

# Directory Layout

- `webapp/styles`, where Sass files live and where the compiled CSS will be too.
- `webapp/scripts`, meant for javascript files.

# Gradle Notes

* Blackboard Libraries - Currently pulling from the Blackboard's Maven repository, which unfortunately hasn't been updated since SP12.
* The webapp/ directory is in the project root for faster access. Note that the default location for webapp is src/main/webapp/. There is an extra directive for including the webapp/ in the project root.
* The building block deployment is done by creating an Ant task and then executing it. The Ant task is how the old deployment script worked. I'm not sure if the Ant task is necessary or if some built in Gradle capability can be used instead.
