interp.configureCompiler(_.settings.YpartialUnification.value = true)

import $ivy.`org.typelevel::cats-effect:1.1.0`
import $ivy.`org.typelevel::cats-core:1.5.0`

import $ivy.`com.github.julien-truffaut::monocle-core:1.5.1-cats`

import $ivy.`com.chuusai::shapeless:2.3.3`

import $ivy.`com.typesafe.akka::akka-actor:2.5.19`
import $ivy.`com.typesafe.akka::akka-http-core:10.1.7`
import $ivy.`com.typesafe.akka::akka-http:10.1.7`

import $ivy.`com.typesafe.akka::akka-stream:2.5.19`
import $ivy.`io.monix::monix:3.0.0-RC2`
import $ivy.`co.fs2::fs2-core:1.0.2`

import $ivy.`org.json4s::json4s-native:3.6.3`
import $ivy.`io.circe::circe-core:0.11.1`
import $ivy.`io.circe::circe-generic:0.11.1`
import $ivy.`io.circe::circe-parser:0.11.1`

import $ivy.`com.lihaoyi::requests:0.1.4`

import akka.actor.ActorSystem
import akka.stream.ActorMaterializer
import akka.stream.scaladsl._
import monix.eval.Task
import monix.reactive.Observable
import scala.concurrent.{Future, ExecutionContext}
import scala.concurrent.duration._
import scala.util.{Try, Success, Failure}

implicit val actorSystem = ActorSystem()
implicit val actorMaterializer = ActorMaterializer()
implicit val monixScheduler = monix.execution.Scheduler.forkJoin(4, 8)
