class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :notes

  def notes 
    result = self.object.notes.map do |note|
      {id: note.id, userId: note.user_id, innerText: note.inner_text, title: note.title, tags: note.tags}
    end
  end

end
