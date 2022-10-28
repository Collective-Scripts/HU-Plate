lib.callback.register('cfx-hakdog-license:update', function(source, oldP, newP)
    local _source = source
    local oldplate = string.upper(tostring(oldP):match("^%s*(.-)%s*$"))
    local newplate = string.upper(newP)
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local result = MySQL.query.await('SELECT plate FROM owned_vehicles')
    local duplicate = false
    local theReturnValue = false
    if result then
        for i = 1, #result do
            local row = result[i]
            if row.plate == newplate then
                duplicate = true
            end
        end
    end
    if not duplicate then
        local row = MySQL.single.await('SELECT plate, vehicle FROM owned_vehicles WHERE plate = ?', {oldplate})
        if row then
            local vehicle = json.decode(row.vehicle)
            vehicle.plate = newplate
            local affectedRows = MySQL.update.await('UPDATE owned_vehicles SET plate = ?, vehicle = ? WHERE plate = ?', {newplate, json.encode(vehicle), oldplate})
            if affectedRows then
                exports.ox_inventory:RemoveItem(xPlayer.source, 'license_plate', 1)
                theReturnValue = true
            end  
        end
    else
        CollectiveS.Notification(_source, 3, 'This plate is already been used on another vehicle')
    end
    return theReturnValue
end)