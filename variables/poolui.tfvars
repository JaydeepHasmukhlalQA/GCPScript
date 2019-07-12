project = "gcp-week-246209"

name = "poolui"

ssh_user = "poolui"

scripts = [
	"scripts/poolui.sh"
]

packages = [
	"git"
]

poolui_allowed_ports = [ "22", "4200"]