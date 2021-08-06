class OfferSerializer
  include JSONAPI::Serializer

  def initialize(resource, options = {})
    super
    @resource = OfferDecorator.decorate_collection(resource)
  end

  attributes \
    :title,
    :description,
    :photo,
    :price
end
