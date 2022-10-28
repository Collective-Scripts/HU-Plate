# HU-Plate
 A simple license plate changer


``ox_inventory/data/items.lua``

```lua
['license_plate'] = {
	label = 'License Plate',
	weight = 50,
	stack = false
},
```

```ox_inventory/modules/items/client.lua```

```lua
Item('license_plate', function(data, slot)
	TriggerEvent('cfx-hakdog-license:ChangePlate')
end)
```