import $ivy.`org.typelevel::cats-effect:3.1.0`
import $ivy.`org.typelevel::cats-core:2.6.0`

import $ivy.`com.github.julien-truffaut::monocle-core:2.0.0`

import $ivy.`io.monix::monix:3.0.0`

import $ivy.`dev.zio::zio:1.0.9`

import monix.eval.Task
import monix.reactive.Observable
import scala.concurrent.{Future, ExecutionContext}
import scala.util.{Try, Success, Failure}
import zio._

implicit val monixScheduler = monix.execution.Scheduler.forkJoin(4, 8)
