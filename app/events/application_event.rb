class ApplicationEvent < RailsEventStore::Event
  class Schema < Dry::Struct
  end

  module Types
    include Dry::Types()

    UUID = Types::Strict::String.constrained(
      format: /\A[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}\z/i
    )
  end

  module ClassMethods
    extend Forwardable
    def_delegators :schema, :attribute, :attribute?

    def schema
      @schema ||= Class.new(Schema)
    end
  end

  module Constructor
    def initialize(data: {}, **options)
      super(data: data.deep_merge(self.class.schema.new(data.deep_symbolize_keys).to_h), **options)
    end
  end

  def self.inherited(klass)
    klass.extend  ClassMethods
    klass.prepend Constructor
  end
end
