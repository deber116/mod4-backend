class NotesController < ApplicationController
    def create
        note_info = JSON.parse(request.body.string)
        if note_info["user_id"]
            note = Note.create(
                user_id: note_info["user_id"],
                title: note_info["title"],
                inner_text: note_info["inner_text"]
            )

            tags = note_info["tags"].split(", ")

            allTags = tags.map do |tag|
                Tag.find_or_create_by(name: tag)
            end

            note.tags << allTags
            newNote = Note.find_by(id: note.id)

            render json: newNote
        end
    end

    def destroy 
        note = Note.find_by(id: params["id"])
        note.destroy
        
        render json: note
        
    end
    
    def update
        note = Note.find_by(id: params["id"])

        tags = params["tags"].split(", ")

        allTags = tags.map do |tag|
            Tag.find_or_create_by(name: tag)
        end

        note.title = params["title"]
        note.inner_text = params["inner_text"]
        note.save

        note.tags = []
        note.tags << allTags
        

        updatedNote = Note.find_by(id: params["id"])
        render json: updatedNote

    end
end