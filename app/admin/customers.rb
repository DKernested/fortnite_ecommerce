ActiveAdmin.register Customer do
  permit_params :name, :email, :password, :image

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size: "200x200") : ""
    end
    f.actions
  end
end
