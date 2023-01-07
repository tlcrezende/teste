module Paginable
  protected
  
  # current_page por default é 1 e assumirar valores do parâmetro se ele for positivo 
  def current_page
    (params[:page] & (params[:page] > 0) ? params[:page] : 1).to_i 
  end
  
  # per_page por default é 6 e assumirar valores do parâmetro se ele for positivo 
  def per_page
    (params[:per_page] & (params[:per_page] > 0) ? params[:per_page] : 6).to_i
  end
  
  # Retorno padrão de paginação 
  def meta_attributes(collection, extra_meta = {})
    {
      current_page: collection.current_page,
      total_items: collection.total_count,
      items_per_page: collection.limit_value
    }.merge(extra_meta)
  end

end