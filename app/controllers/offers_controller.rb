class OffersController < ApplicationController

  expose(:offers) { Offer.with_attached_photo }
  expose(:offer)

  def index
    render json: serialize(offers)
  end

  def show
    render json: serialize(offer)
  end

  def create
    if offer.save!
      offer.photo.attach(photo_attach_args)

      render json: serialize(offer)
    end
  end

  def update
    offer.photo.attach(photo_attach_args)

    if offer.update!(offer_params)
      render json: serialize(offer)
    end
  end

  private

    def photo_attach_args
      AttachmentFormatterService.data_from_url(
        offer_params[:photo],
        filename: offer.title.parameterize
      )
    end

    def serialize(offers)
      OfferSerializer.new(offers).serializable_hash
    end

    def offer_params
      params.permit(Offer.column_names - %w[created_at updated_at], :photo)
    end
end
