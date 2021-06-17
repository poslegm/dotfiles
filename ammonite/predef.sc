import $ivy.`org.typelevel::cats-effect:3.1.1`
import $ivy.`org.typelevel::cats-core:2.6.1`

import $ivy.`com.lihaoyi::requests:0.6.9`
import $ivy.`com.lihaoyi::upickle:1.3.8`

import $ivy.`dev.zio::zio:1.0.9`

import scala.concurrent.{Future, ExecutionContext}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.util.{Try, Success, Failure}

val zioRuntime = zio.Runtime.default
