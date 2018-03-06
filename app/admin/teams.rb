ActiveAdmin.register Team do
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
permit_params :name, :title, :twitter, :facebook, :youtube, :image

show do |t|
  attributes_table do
    row :name
    row :title
    row :twitter
    row :facebook
    row :youtube
    row :image do
      team.image? ? image_tag(team.image.url, height: '100') : content_tag(:span, "No Photo Yet")
    end
  end
end

form :html => { :enctype => 'multipart/form-data' } do |f|
  f.inputs do
    f.input :name
    f.input :title
    f.input :twitter
    f.input :facebook
    f.input :youtube
    f.input :image, hint: f.team.image? ? image_tag(team.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
  end
  f.actions
end
end
