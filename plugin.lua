function draw()
    imgui.Begin("1 ms thing")

    state.IsWindowHovered = imgui.IsWindowHovered()

    if imgui.Button("up") then
        local notes = state.SelectedHitObjects
        local result = {}

        for _, note in pairs(notes) do
            if note.EndTime == 0 then
                table.insert(result, utils.CreateHitObject(note.StartTime + 1, note.Lane, note.EndTime, note.HitSound, note.EditorLayer))
            else
                table.insert(result, utils.CreateHitObject(note.StartTime + 1, note.Lane, note.EndTime + 1, note.HitSound, note.EditorLayer))
            end
        end

        actions.RemoveHitObjectBatch(notes)
        actions.PlaceHitObjectBatch(result)
        actions.SetHitObjectSelection(result)
    end
    
    if imgui.Button("down") then
        local notes = state.SelectedHitObjects
        local result = {}

        for _, note in pairs(notes) do
            if note.EndTime == 0 then
                table.insert(result, utils.CreateHitObject(note.StartTime - 1, note.Lane, note.EndTime, note.HitSound, note.EditorLayer))
            else
                table.insert(result, utils.CreateHitObject(note.StartTime - 1, note.Lane, note.EndTime - 1, note.HitSound, note.EditorLayer))
            end
        end

        actions.RemoveHitObjectBatch(notes)
        actions.PlaceHitObjectBatch(result)
        actions.SetHitObjectSelection(result)
    end

    imgui.End()
end
