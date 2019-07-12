project = "gcp-week-246209"

name = "poolapi"

ssh_user = "poolapi"

scripts = [
	"scripts/poolapi.sh"
]

packages = [
	"git"
]

allowed_ports = [ "22", "8080"]