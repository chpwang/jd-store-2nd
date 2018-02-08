module ProductsHelper
  def render_product_status(product)
    if product.is_hidden?
      content_tag(:i, "", class: ["fas", "fa-lock"])
    else
      content_tag(:i, "", class: ["fas", "fa-eye"])
    end
  end
end
