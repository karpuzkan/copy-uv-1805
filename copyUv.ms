macroScript UvwMapCloning category:"gugu" tooltip:"Copy&Instance UV's"
Icon:#("UVWUnwrapOption", 1)

(
try(destroyDialog copyUvRo )catch()

rollout copyUvRo "Copy Uv" width:200 height:60 (
	pickbutton tempcam "Pick Obj" autodisplay:true
	checkbox instanceCheck "Instance?" pos:[70,30,0]
	
	on tempcam picked obj do (
		if (for m in obj.modifiers where classof m == Uvwmap collect m).count==0 do return messagebox "no uv found!"
		if (for m in obj.modifiers where classof m == Uvwmap collect m).count>1 do return messagebox "multiple uv found!"
		
		copymod = obj.modifiers[1]
		
		if not instanceCheck.checked then (	
			for i in $ do (
					map = uvwmap()
					map.maptype = copymod.maptype
					addmodifier i map
					map.length=copymod.length
					map.width=copymod.width
					map.height=copymod.height
					redrawviews()
					i.modifiers[1].Gizmo.scale=copymod.Gizmo.scale
					i.modifiers[1].Gizmo.rotation=copymod.Gizmo.rotation
				)
		)
		
		if instanceCheck.checked then (	
			deletemodifier obj obj.modifiers[1]
			selectMore obj
			modPanel.addModToSelection (copymod)
			redrawviews()
			clearSelection()
		)

		destroyDialog copyUvRo
	)
)
createDialog copyUvRo	
)