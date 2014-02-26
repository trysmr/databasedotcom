module Databasedotcom
  module AggregateResult
    class AggregateResult

      def initialize(data)
        @values = data.inject({}) do |h, (k, v)|
          h[k.to_sym] = v
          h
        end
      end

      def method_missing(field, *args)
        if @values.key?(field)
          @values[field]
        else
          super
        end
      end
    end
  end
end