ThisBuild / scalaVersion := "3.3.5"
ThisBuild / version := "0.1.0-SNAPSHOT"
ThisBuild / organization := "com.CodeCrafters"
ThisBuild / organizationName := "CodeCrafters"

assembly / assemblyJarName := "{{course_slug}}"

lazy val root = (project in file("."))
  .settings(
    name := "codecrafter-{{course_slug}}",
    // List your dependencies here
    libraryDependencies ++= Seq(
    ),
  )
