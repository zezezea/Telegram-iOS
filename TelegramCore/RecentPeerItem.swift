import Foundation
#if os(macOS)
    import PostboxMac
#else
    import Postbox
#endif

public struct RecentPeerItemId {
    public let rawValue: MemoryBuffer
    public let peerId: PeerId
    
    init(_ rawValue: MemoryBuffer) {
        self.rawValue = rawValue
        assert(rawValue.length == 8)
        var idValue: Int64 = 0
        memcpy(&idValue, rawValue.memory, 8)
        self.peerId = PeerId(idValue)
    }
    
    init(_ peerId: PeerId) {
        self.peerId = peerId
        var idValue: Int64 = peerId.toInt64()
        self.rawValue = MemoryBuffer(memory: malloc(8)!, capacity: 8, length: 8, freeWhenDone: true)
        memcpy(self.rawValue.memory, &idValue, 8)
    }
}

public final class RecentPeerItem: OrderedItemListEntryContents {
    init() {
    }
    
    public init(decoder: Decoder) {
    }
    
    public func encode(_ encoder: Encoder) {
    }
}
