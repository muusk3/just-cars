module CollectionWrapper
  def wrapped_response(items, meta)
    {
      data: items,
      meta: {
        total_items: meta.count,
        total_pages: meta.pages,
        page: meta.page
      }.compact
    }
  end
end
