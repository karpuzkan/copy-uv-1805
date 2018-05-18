macroScript Batch_Camera_Lister category:"gugu" tooltip:"Copy&Instance UV's"
Icon:#("UVWUnwrapOption", 1)
(
try(destroyDialog copyUvRo )catch()

rollout copyUvRo "Copy Uv" width:200 height:60 (
	pickbutton tempcam "Pick Obj" autodisplay:true
	checkbox instanceCheck "Instance?" pos:[70,30,0]
	
	on tempcam picked obj do (
		objmod=obj.modifiers[1]
		
		--print objmod
		for i in $ do (
			addModifier i objmod
			if not instanceCheck.checked then (
				InstanceMgr.MakeModifiersUnique i objmod #individual
				i.modifiers[1].Gizmo.position = [i.pos.x,i.pos.y,i.pos.z]
			)
		)
		destroyDialog copyUvRo
	)
)
createDialog copyUvRo	
)