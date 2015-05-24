json.array!(@courses) do |course|
  json.extract! course, :id, :instructor_id, :title, :subtitle, :objectives, :language_id, :category_id, :subcategory_id, :level_id, :certificate, :lectures, :coursecontentjson, :privacy_level
  json.url course_url(course, format: :json)
end
