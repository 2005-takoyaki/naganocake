module Admin::GenresHelper
def active(active)
	if active
		'有効'
	else
		'無効'
	end
end
end