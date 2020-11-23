ActiveAdmin.register Cosmetic do
  permit_params :name, :description, :category_id, :rarity, :image

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :description
      f.input :category
      f.input :rarity
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size: "200x200") : ""
    end
    f.actions
  end
end
