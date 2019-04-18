# From https://github.com/matchai/spacefish/blob/master/functions/__sf_util_set_default.fish

function __tarakihi_set_default -a var -d "Set the default value for a global variable"
	if not set -q $var
		# Multiple arguments will become a list
		set -g $var $argv[2..-1]
	end
end
