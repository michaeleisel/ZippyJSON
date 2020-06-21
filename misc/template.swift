// UnkeyedBegin
<% types.each do |type| %>
    <%= inline %>public mutating func decode(_ type: <%= type %>.Type) throws -> <%= type %> {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: <%= type %>.self)
        advanceArray()
        return decoded
    }

<% end %>
// UnboxBegin
<% types.each do |type| %>
    <%= inline %>fileprivate func unbox(_ value: Value, as type: <%= type %>.Type) throws -> <%= type %> {
        let result = JNTDocumentDecode__<%= c_type(type) %>(value)
        try throwErrorIfNecessary(value)
        return <%= convert(type) %>
    }

<% end %>
// SingleValueBegin
<% types.each do |type| %>
    public func decode(_ type: <%= type %>.Type) throws -> <%= type %> {
        return try unbox(containers.topContainer, as: <%= type %>.self)
    }

<% end %>
// KeyedBegin
<% (types + ["T"]).each do |type| %>
    <%= inline %>fileprivate func decode<%= type == "T" ? "<T : Decodable>" : "" %>(_ type: <%= type %>.Type, forKey key: K) <%= throws(type) %>-> <%= type %> {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return <%= try(type) %>decoder.unbox(subValue, as: <%= type %>.self)
    }

<% end %>
