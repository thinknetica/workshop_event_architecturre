class DriverRepository
  def initialize(event_store = Rails.configuration.event_store)
    @repository = AggregateRoot::Repository.new(event_store)
  end

  def with_driver(id, &block)
    stream_name = "driver$#{id}"
    repository.with_aggregate(DriverAggregate.new(id), stream_name, &block)
  end
end
