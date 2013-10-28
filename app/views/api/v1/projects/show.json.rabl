object @project
attributes :id, :title, :created_at, :thumbnail, :updated_at

node :access_right do |p|
  if p.user == current_user
    'owner'
  else
    current_user.permissions.for_project p, current_user
  end
end

node(:permissions){ @permissions }

node :thumbnail do |p|
  if p.cover_image
    p.cover_image.file.versions[:thumb].url
  else
    asset_path 'placeholder.png'
  end
end

node :cover do |p|
  if p.cover_image
    p.cover_image.file.url
  end
end

node :cover_image do |p|
  if p.cover_image
    p.cover_image.key
  else
    nil
  end
end

[:generation, :remuneration, :partage, :annexes].each do |s|
  child s => s do
    attributes :id, :section_type, :page_count, :rating
  end
end
