import sbt._
import Keys._
import play.Project._

object ApplicationBuild extends Build {
	val appName         = "carmen-sandiego"
	val appVersion      = "1.0-SNAPSHOT"
  
  	val appDependencies = Seq(
	    // Add your project dependencies here,
	    //javaCore,
	    //javaJdbc,
	    //javaEbean,
	    "Carlines.org" % "UIs-UNQ-2014-Model" % "0.0.1-SNAPSHOT"
	)
	
	val main = play.Project(appName, appVersion, appDependencies).settings(
	    // Add your own project settings here
	    resolvers += ("Local Maven" at "file:///home/julian/.m2/repository/")
	    //resolvers += ("Local Maven" at "/home/julian/UNQ/UI-Workspace/Carmen San Diego Model")
	    //resolvers += ("Uqbar Releases" at "http://uqbar-wiki.org/mvn/releases"),
	    //resolvers += ("Uqbar Snapshots" at "http://uqbar-wiki.org/mvn/snapshots")
	)
  
}
