// UnkeyedBegin
<% types.each do |type| %>
    <%= inline %>public mutating func decode(_ type: <%= type %>.Type) throws -> <%= type %> {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: <%= type %>.self)
        try unkeyedThrowErrorIfNecessary(value, decoder: self)
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
        let value = unbox(containers.topContainer.0, as: <%= type %>.self)
        try throwErrorIfNecessary(value, decoder: self, breadcrumb: containers.topContainer.1)
        return value
    }

<% end %>
// KeyedBegin
<% types.each do |type| %>
    <%= inline %>fileprivate func decode<%= type == "T" ? "<T : Decodable>" : "" %>(_ type: <%= type %>.Type, forKey key: K) <%= throws(type) %>-> <%= type %> {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        let result = decoder.unbox(subValue, as: <%= type %>.self)
        try keyedThrowErrorIfNecessary(value, decoder: self)
        return result
    }

<% end %>
