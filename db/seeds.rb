if Object.const_defined?('Faker')
  max_offers = rand(30)

  def stream_photo_url
    Faker::LoremFlickr.image(size: '480x320', search_terms: ['cars'])
  end

  (1..max_offers).each do |num|
    offer_args = {
      title:       format("%<vehicle>s for sale!", vehicle: Faker::Vehicle.make_and_model),
      description: Faker::Vehicle.standard_specs.join(', '),
      price:       Faker::Number.decimal(l_digits: 2),
      photo:       AttachmentFormatterService.data_from_url(stream_photo_url)
    }
    Offer.create(offer_args)
  end
else
  puts "'Faker' gem is not installed."
end
