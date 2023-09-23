module UniqueId
  extend ActiveSupport::Concern

  included do
    def generate_unique_id
      self.id = SecureRandom.base58(24)
    end
  end
end