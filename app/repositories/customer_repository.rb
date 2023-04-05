class CustomerRepository
  def initialize(event_store = Rails.configuration.event_store)
    @repository = AggregateRoot::Repository.new(event_store)
  end

  def with_customer(id, &block)
    stream_name = "customer$#{id}"
    repository.with_aggregate(CustomerAggregate.new(id), stream_name, &block)
  end
end

