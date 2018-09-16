# frozen_string_literal: true

module InitializeObject
  extend ActiveSupport::Concern

  class_methods do
    def initialize_object(params = {})
      new(params.select { |k| attribute_method?(k) })
    end
  end
end
