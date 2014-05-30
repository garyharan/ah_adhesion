module Completable
  extend ActiveSupport::Concern

  included do
    cattr_accessor :completable_attributes

    def self.completes_with(*args)
      self.completable_attributes = args

      self.completable_attributes.each do |attribute|
        self.send(:define_method, "completed_#{attribute}?") do
          !self.send(attribute).blank?
        end
      end
    end
  end
  def completion_percentage
    completed = self.completable_attributes.reject do |attribute|
      send(attribute).blank?
    end

    (100.0 / self.completable_attributes.count * completed.count).to_i
  end

  def complete?
    completion_percentage == 100
  end
end
