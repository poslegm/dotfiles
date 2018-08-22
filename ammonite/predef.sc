interp.configureCompiler(_.settings.YpartialUnification.value = true)

import $ivy.`org.typelevel::cats-effect:1.0.0-RC`
import $ivy.`org.typelevel::cats-core:1.0.1`

import $ivy.`com.github.julien-truffaut::monocle-core:1.5.0-cats`

import $ivy.`org.scalaz::scalaz-core:7.2.23`
import $ivy.`org.scalaz::scalaz-ioeffect:2.1.0`

import $ivy.`com.chuusai::shapeless:2.3.3`

import $ivy.`com.typesafe.akka::akka-actor:2.5.11`
import $ivy.`com.typesafe.akka::akka-http-core:10.0.11`
import $ivy.`com.typesafe.akka::akka-http:10.0.11`

import $ivy.`com.typesafe.akka::akka-stream:2.5.11`
import $ivy.`io.monix::monix:3.0.0-RC1`
import $ivy.`co.fs2::fs2-core:0.10.4`

import $ivy.`org.tpolecat::doobie-core:0.5.3` 
import $ivy.`org.tpolecat::doobie-postgres:0.5.3`
import $ivy.`org.tpolecat::doobie-hikari:0.5.3`
import $ivy.`ru.yandex.clickhouse:clickhouse-jdbc:0.1.36`

import $ivy.`org.json4s::json4s-native:3.6.0-M4`
import $ivy.`io.circe::circe-core:0.9.3`
import $ivy.`io.circe::circe-generic:0.9.3`
import $ivy.`io.circe::circe-parser:0.9.3`

import $ivy.`com.github.pathikrit::better-files:3.4.0`

import $ivy.`com.lihaoyi::requests:0.1.2`

import akka.actor.ActorSystem
import akka.stream.ActorMaterializer
import akka.stream.scaladsl._
import scala.concurrent.{Future, ExecutionContext}
import scala.concurrent.duration._
import scala.util.{Try, Success, Failure}

implicit val actorSystem = ActorSystem()
import actorSystem.dispatcher
implicit val actorMaterializer = ActorMaterializer()
