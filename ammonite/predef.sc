import $ivy.`org.typelevel::cats-effect:2.1.0`
import $ivy.`org.typelevel::cats-core:2.1.0`

import $ivy.`com.github.julien-truffaut::monocle-core:2.0.3`

import $ivy.`com.chuusai::shapeless:2.3.3`

import $ivy.`com.typesafe.akka::akka-actor:2.6.3`
import $ivy.`com.typesafe.akka::akka-http-core:10.1.10`
import $ivy.`com.typesafe.akka::akka-http:10.1.10`

import $ivy.`com.typesafe.akka::akka-stream:2.6.3`
import $ivy.`io.monix::monix:3.1.0`
import $ivy.`co.fs2::fs2-core:2.2.2`

import $ivy.`io.circe::circe-core:0.13.0`
import $ivy.`io.circe::circe-generic:0.13.0`
import $ivy.`io.circe::circe-parser:0.13.0`

import $ivy.`com.lihaoyi::requests:0.5.1`

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
