//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: pahkat.proto
//

import Foundation
import GRPC
import NIO
import NIOHTTP1
import SwiftProtobuf


/// Usage: instantiate Pahkat_PahkatClient, then call methods of this protocol to make API calls.
public protocol Pahkat_PahkatClientProtocol {
  func notifications(_ request: Pahkat_NotificationsRequest, callOptions: CallOptions?, handler: @escaping (Pahkat_NotificationResponse) -> Void) -> ServerStreamingCall<Pahkat_NotificationsRequest, Pahkat_NotificationResponse>
  func status(_ request: Pahkat_StatusRequest, callOptions: CallOptions?) -> UnaryCall<Pahkat_StatusRequest, Pahkat_StatusResponse>
  func repositoryIndexes(_ request: Pahkat_RepositoryIndexesRequest, callOptions: CallOptions?) -> UnaryCall<Pahkat_RepositoryIndexesRequest, Pahkat_RepositoryIndexesResponse>
  func processTransaction(callOptions: CallOptions?, handler: @escaping (Pahkat_TransactionResponse) -> Void) -> BidirectionalStreamingCall<Pahkat_TransactionRequest, Pahkat_TransactionResponse>
}

public final class Pahkat_PahkatClient: GRPCClient, Pahkat_PahkatClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions

  /// Creates a client for the pahkat.Pahkat service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  public init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }

  /// Server streaming call to Notifications
  ///
  /// - Parameters:
  ///   - request: Request to send to Notifications.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  public func notifications(_ request: Pahkat_NotificationsRequest, callOptions: CallOptions? = nil, handler: @escaping (Pahkat_NotificationResponse) -> Void) -> ServerStreamingCall<Pahkat_NotificationsRequest, Pahkat_NotificationResponse> {
    return self.makeServerStreamingCall(path: "/pahkat.Pahkat/Notifications",
                                        request: request,
                                        callOptions: callOptions ?? self.defaultCallOptions,
                                        handler: handler)
  }

  /// Store
  ///
  /// - Parameters:
  ///   - request: Request to send to Status.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func status(_ request: Pahkat_StatusRequest, callOptions: CallOptions? = nil) -> UnaryCall<Pahkat_StatusRequest, Pahkat_StatusResponse> {
    return self.makeUnaryCall(path: "/pahkat.Pahkat/Status",
                              request: request,
                              callOptions: callOptions ?? self.defaultCallOptions)
  }

  /// Unary call to RepositoryIndexes
  ///
  /// - Parameters:
  ///   - request: Request to send to RepositoryIndexes.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func repositoryIndexes(_ request: Pahkat_RepositoryIndexesRequest, callOptions: CallOptions? = nil) -> UnaryCall<Pahkat_RepositoryIndexesRequest, Pahkat_RepositoryIndexesResponse> {
    return self.makeUnaryCall(path: "/pahkat.Pahkat/RepositoryIndexes",
                              request: request,
                              callOptions: callOptions ?? self.defaultCallOptions)
  }

  /// Bidirectional streaming call to ProcessTransaction
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata and status.
  public func processTransaction(callOptions: CallOptions? = nil, handler: @escaping (Pahkat_TransactionResponse) -> Void) -> BidirectionalStreamingCall<Pahkat_TransactionRequest, Pahkat_TransactionResponse> {
    return self.makeBidirectionalStreamingCall(path: "/pahkat.Pahkat/ProcessTransaction",
                                               callOptions: callOptions ?? self.defaultCallOptions,
                                               handler: handler)
  }

}

/// To build a server, implement a class that conforms to this protocol.
public protocol Pahkat_PahkatProvider: CallHandlerProvider {
  func notifications(request: Pahkat_NotificationsRequest, context: StreamingResponseCallContext<Pahkat_NotificationResponse>) -> EventLoopFuture<GRPCStatus>
  /// Store
  func status(request: Pahkat_StatusRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Pahkat_StatusResponse>
  func repositoryIndexes(request: Pahkat_RepositoryIndexesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Pahkat_RepositoryIndexesResponse>
  func processTransaction(context: StreamingResponseCallContext<Pahkat_TransactionResponse>) -> EventLoopFuture<(StreamEvent<Pahkat_TransactionRequest>) -> Void>
}

extension Pahkat_PahkatProvider {
  public var serviceName: String { return "pahkat.Pahkat" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handleMethod(_ methodName: String, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "Notifications":
      return ServerStreamingCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.notifications(request: request, context: context)
        }
      }

    case "Status":
      return UnaryCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.status(request: request, context: context)
        }
      }

    case "RepositoryIndexes":
      return UnaryCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.repositoryIndexes(request: request, context: context)
        }
      }

    case "ProcessTransaction":
      return BidirectionalStreamingCallHandler(callHandlerContext: callHandlerContext) { context in
        return self.processTransaction(context: context)
      }

    default: return nil
    }
  }
}


// Provides conformance to `GRPCPayload` for request and response messages
extension Pahkat_NotificationsRequest: GRPCProtobufPayload {}
extension Pahkat_NotificationResponse: GRPCProtobufPayload {}
extension Pahkat_StatusRequest: GRPCProtobufPayload {}
extension Pahkat_StatusResponse: GRPCProtobufPayload {}
extension Pahkat_RepositoryIndexesRequest: GRPCProtobufPayload {}
extension Pahkat_RepositoryIndexesResponse: GRPCProtobufPayload {}
extension Pahkat_TransactionRequest: GRPCProtobufPayload {}
extension Pahkat_TransactionResponse: GRPCProtobufPayload {}
