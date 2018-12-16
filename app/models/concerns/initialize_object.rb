# frozen_string_literal: true

module InitializeObject
  extend ActiveSupport::Concern

  class_methods do
    def initialize_object(params = {})
      new(params.select { |key| attribute_method?(key) })
    end
  end
end
