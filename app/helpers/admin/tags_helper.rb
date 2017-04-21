module Admin::TagsHelper
  def create_deletable_button tag
    if tag.in_use?
      link_to '#' do
      content_tag(:button, 'Delete', class: 'btn btn-danger', disabled:"disabled")
      end
       else
       link_to admin_tag_path(tag), method: :DELETE do
      content_tag(:button, 'Delete', class: 'btn btn-danger')
      end
     end
  end
end
