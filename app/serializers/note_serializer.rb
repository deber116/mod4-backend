class NoteSerializer < ActiveModel::Serializer
  attributes :id, :innerText, :title, :user_id, :tags

  def innerText 
    self.object.inner_text
  end
end
