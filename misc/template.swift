// UnkeyedBegin
<% types.each do |type| %>
    <%= inline %>public mutating func decode(_ type: <%= type %>.Type) throws -> <%= type %> {
        currentValue = try valueFromIterator()
        let decoded = decoder.unbox(currentValue, as: <%= type %>.self)
        try unkeyedThrowErrorIfNecessary()
        advanceArray()
        return decoded
    }

<% end %>
// UnboxBegin
<% types.each do |type| %>
    <%= inline %>fileprivate func unbox(_ value: Value, as type: <%= type %>.Type) -> <%= type %> {
        let result = JNTDocumentDecode__<%= c_type(type) %>(value)
        return <%= convert(type) %>
    }

<% end %>
// SingleValueBegin
<% types.each do |type| %>
    public func decode(_ type: <%= type %>.Type) throws -> <%= type %> {
        let result = unbox(containers.topContainer, as: <%= type %>.self)
        try throwErrorIfNecessary(value)
        return result
    }

<% end %>
// KeyedBegin
<% types.each do |type| %>
    <%= inline %>fileprivate func decode<%= type == "T" ? "<T : Decodable>" : "" %>(_ type: <%= type %>.Type, forKey key: K) <%= throws(type) %>-> <%= type %> {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        try keyedThrowErrorIfNecessary(value, key: key)
        let result = decoder.unbox(subValue, as: <%= type %>.self)
        try keyedThrowErrorIfNecessary(value, key: key)
        return result
    }

<% end %>
