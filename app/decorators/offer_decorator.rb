class OfferDecorator < ApplicationDecorator

  def photo
    if object.photo.attached?
      url_helpers.rails_blob_url(object.photo)
    end
  end

  def price
    format('%<amount>s zł', amount: object.price.to_f)
  end
end
