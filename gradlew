#!/usr/bin/env sh

# This is a Gradle Wrapper script for Unix systems.
# It ensures that the correct version of Gradle is used for the project.

# Determine the location of the script
PRG="$0"

# Resolve symbolic links
while [ -h "$PRG"`; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="`which java`"
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
fi

# Calculate the JAVA_OPTS
APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`
GREP="grep"

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

exec "$JAVACMD" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
