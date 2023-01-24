module Paginable
  protected
  
  # current_page by default is 1 and assume parameter values ​​if it is positive
  def current_page
    return 1 unless params[:page].present?
    return (params[:page].to_i > 0 ? params[:page] : 1)
  end
  
  # per_page by default is 6 and assume parameter values ​​if it is positive
  def per_page
    return 6 unless params[:per_page].present?
    return (params[:per_page].to_i > 0 ? params[:per_page] : 1)
  end
  
  # Default pagination return
  def meta_attributes(collection, extra_meta = {})
    {
      current_page: collection.current_page,
      total_items: collection.total_count,
      items_per_page: collection.limit_value
    }.merge(extra_meta)
  end

end