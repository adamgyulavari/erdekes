class S3DataStore < Dragonfly::S3DataStore

  def initialize(attributes = {})
    super(attributes)
  end

  def meta_to_headers(meta)
    { 'x-amz-meta-json' => ActiveSupport::JSON.encode(meta) }
  end
end
