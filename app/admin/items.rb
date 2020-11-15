ActiveAdmin.register Item do
  permit_params :name, :category_id, :rarity, :price, :image

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :rarity
      f.input :price
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size: "200x200") : ""
    end
    f.actions
  end
end
