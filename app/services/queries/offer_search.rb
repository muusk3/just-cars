module Queries
  class OfferSearch
    include Pagy::Backend
    include CollectionWrapper

    FILTERS = %i[title page limit]
    PAGY_LIMIT = Pagy::VARS[:items]

    def initialize(filters = nil)
      @filters = filters.to_h.slice(*FILTERS)
    end

    def call
      results = Offer.search(filters[:title], search_criteria)
      @pagy, @results = pagy_array(results, pagy_options)

      wrapped_response(@results, @pagy)
    end

    private

      attr_reader :filters

      def search_criteria
        {
          order: order_criteria,
          scope_results: ->(r) {
            r.with_attached_photo
          }
        }
      end

      def order_criteria
        {
          _score: :desc,
          created_at: {
            unmapped_type: :integer,
            order: :desc
          }
        }
      end

      def pagy_options
        {
          page: filters[:page].to_i,
          limit: [filters[:limit].to_i, PAGY_LIMIT].min
        }
      end

      def pagy_get_vars(collection, vars)
        {
          count: vars[:count] || collection.size,
          items: vars[:limit],
          page: vars[:page].nonzero? || 1
        }
      end
      alias pagy_array_get_vars pagy_get_vars
  end
end
