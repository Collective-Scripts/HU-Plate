function ChangeLicensePlate()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicle = lib.getClosestVehicle(coords, 2.0)
    if not vehicle then CollectiveC.Notification(3, 'No vehicles nearby') return end
    local oldplate = GetVehicleNumberPlateText(vehicle)
    local input = lib.inputDialog('Old Plate '..oldplate, {'New Plate'})
    if not input then return end
    local newplate = input[1]
    local len = string.len(newplate)
    if len >= 8 then
        CollectiveC.Notification(3, 'Max 8 letters or numbers')
        return
    end
    lib.callback('cfx-hakdog-license:update', false, function(hasChanged)
        if hasChanged then
            SetVehicleNumberPlateText(vehicle, newplate)
            CollectiveC.Notification(1, 'Your vehicle plate has been changed.')
        end
    end, oldplate, newplate)
end

RegisterNetEvent('cfx-hakdog-license:ChangePlate', ChangeLicensePlate)