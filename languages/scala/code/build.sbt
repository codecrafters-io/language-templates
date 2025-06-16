ThisBuild / scalaVersion     := "3.7.1"
ThisBuild / version          := "0.1.0-SNAPSHOT"
ThisBuild / organization     := "com.codecrafters"
ThisBuild / organizationName := "CodeCrafters"

assembly / assemblyJarName := "{{course_slug}}.jar"

lazy val root = (project in file("."))
  .settings(
    name := "codecrafter-{{course_slug}}",
    // List your dependencies here
    libraryDependencies ++= Seq(
    )
  )
