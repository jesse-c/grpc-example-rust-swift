//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: Sources/Model/helloworld.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate `Helloworld_GreeterClient`, then call methods of this protocol to make API calls.
public protocol Helloworld_GreeterClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Helloworld_GreeterClientInterceptorFactoryProtocol? { get }

  func sayHello(
    _ request: Helloworld_HelloRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Helloworld_HelloRequest, Helloworld_HelloReply>
}

extension Helloworld_GreeterClientProtocol {
  public var serviceName: String {
    return "helloworld.Greeter"
  }

  /// Our SayHello rpc accepts HelloRequests and returns HelloReplies
  ///
  /// - Parameters:
  ///   - request: Request to send to SayHello.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func sayHello(
    _ request: Helloworld_HelloRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Helloworld_HelloRequest, Helloworld_HelloReply> {
    return self.makeUnaryCall(
      path: "/helloworld.Greeter/SayHello",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSayHelloInterceptors() ?? []
    )
  }
}

public protocol Helloworld_GreeterClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'sayHello'.
  func makeSayHelloInterceptors() -> [ClientInterceptor<Helloworld_HelloRequest, Helloworld_HelloReply>]
}

public final class Helloworld_GreeterClient: Helloworld_GreeterClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Helloworld_GreeterClientInterceptorFactoryProtocol?

  /// Creates a client for the helloworld.Greeter service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Helloworld_GreeterClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
public protocol Helloworld_GreeterProvider: CallHandlerProvider {
  var interceptors: Helloworld_GreeterServerInterceptorFactoryProtocol? { get }

  /// Our SayHello rpc accepts HelloRequests and returns HelloReplies
  func sayHello(request: Helloworld_HelloRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Helloworld_HelloReply>
}

extension Helloworld_GreeterProvider {
  public var serviceName: Substring { return "helloworld.Greeter" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "SayHello":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Helloworld_HelloRequest>(),
        responseSerializer: ProtobufSerializer<Helloworld_HelloReply>(),
        interceptors: self.interceptors?.makeSayHelloInterceptors() ?? [],
        userFunction: self.sayHello(request:context:)
      )

    default:
      return nil
    }
  }
}

public protocol Helloworld_GreeterServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'sayHello'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSayHelloInterceptors() -> [ServerInterceptor<Helloworld_HelloRequest, Helloworld_HelloReply>]
}
