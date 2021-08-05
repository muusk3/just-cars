class ApplicationDecorator < SimpleDelegator
  include RoutesHelper

  def self.decorate(obj)
    new(obj)
  end

  def self.decorate_collection(collection)
    Array(collection).map { |element| new(element) }
  end

  def object
    __getobj__
  end
end
