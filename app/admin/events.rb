ActiveAdmin.register Event do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :title, :description, :day, :image

  show do |t|
    attributes_table do
      row :title
      row :description
      row :day
      row :image do
        event.image? ? image_tag(event.image.url, height: '100') : content_tag(:span, "No Photo Yet")
      end
    end
  end

  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :day
      f.input :image, hint: f.event.image? ? image_tag(event.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
