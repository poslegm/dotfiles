import $ivy.`org.typelevel::cats-effect:2.0.0`
import $ivy.`org.typelevel::cats-core:2.0.0`

import $ivy.`com.github.julien-truffaut::monocle-core:2.0.0`

import $ivy.`io.monix::monix:3.0.0`

import $ivy.`dev.zio::zio:1.0.0-RC18`
import $ivy.`dev.zio::zio-interop-cats:2.0.0.0-RC6`

import monix.eval.Task
import monix.reactive.Observable
import scala.concurrent.{Future, ExecutionContext}
import scala.concurrent.duration._
import scala.util.{Try, Success, Failure}

implicit val monixScheduler = monix.execution.Scheduler.forkJoin(4, 8)
