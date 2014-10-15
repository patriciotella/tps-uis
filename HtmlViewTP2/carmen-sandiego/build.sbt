name := "carmen-sandiego"

version := "1.0-SNAPSHOT"

autoScalaLibrary := false

scalaVersion := "2.11.2"

libraryDependencies ++= Seq(
  javaJdbc,
  javaEbean,
  cache
)     

play.Project.playJavaSettings
