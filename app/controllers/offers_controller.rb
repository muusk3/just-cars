class OffersController < ApplicationController

  expose(:offers) { Queries::OfferSearch.new(permit_params).call }
  expose(:offer)

  def index
    render json: serialize(offers[:data], meta: offers[:meta])
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
        permit_params[:photo],
        filename: offer.title.parameterize
      )
    end

    def serialize(offers, **options)
      OfferSerializer.new(offers, options).serializable_hash
    end

    def permit_params
      params.permit(:photo, *Queries::OfferSearch::FILTERS)
    end

    def offer_params
      params.permit(Offer.column_names - %w[created_at updated_at])
    end
end
