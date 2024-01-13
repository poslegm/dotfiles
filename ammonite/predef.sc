import $ivy.`org.typelevel::cats-effect:3.5.2`
import $ivy.`org.typelevel::cats-core:2.10.0`

import $ivy.`com.lihaoyi::requests:0.8.0`
import $ivy.`com.lihaoyi::upickle:3.1.4`

import $ivy.`dev.zio::zio:2.0.21`

import scala.concurrent.{Future, ExecutionContext}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.util.{Try, Success, Failure}

val zioRuntime = zio.Runtime.default
