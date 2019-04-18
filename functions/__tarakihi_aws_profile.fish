# read here https://github.com/matchai/spacefish/blob/master/functions/__sf_section_aws.fish
function __tarakihi_aws_profile -d "Display the selected aws profile"

  __tarakihi_set_default TARAKIHI_AWS_SHOW true
  __tarakihi_set_default TARAKIHI_AWS_SYMBOL "☁️ "
  __tarakihi_set_default TARAKIHI_AWS_COLOR ff8700

  set -l color_aws (set_color $TARAKIHI_AWS_COLOR)
  set -l color_normal (set_color normal)

  [ $TARAKIHI_AWS_SHOW = false ]; and return

  # Ensure the aws command is available
  # aws command can also be the aws wrapper for fish if you use it: https://github.com/oh-my-fish/plugin-aws/blob/master/functions/aws.fish
  type -q aws; or return


  # Early return if you have you profile set for both AWS_PROFILE and AWS_DEFAULT_PROFILE
  if test "$AWS_PROFILE" -a "$AWS_DEFAULT_PROFILE"
    echo 'Too many profiles set, you have to choose between AWS_PROFILE and AWS_DEFAULT_PROFILE to avoid confusion'
		return
	end

  # Early return if there's no AWS_PROFILE or no AWS_DEFAULT_PROFILE
  # test -z STRING => returns true if the length of STRING is zero.
  # test COND1 -a COND2 => returns true if both COND1 and COND2 are true.
  # test COND1 -o COND2 => returns true if either COND1 or COND2 are true.
  if test -z "$AWS_PROFILE" -a -z "$AWS_DEFAULT_PROFILE"
    set aws_profile 'default'
  else if test "$AWS_PROFILE"
    set aws_profile $AWS_PROFILE
  else if test "$AWS_DEFAULT_PROFILE"
    set aws_profile $AWS_DEFAULT_PROFILE
	end

  # echo ' ('$AWS_PROFILE') '
  echo -n $color_aws' ('$TARAKIHI_AWS_SYMBOL' '$aws_profile')'$color_normal

end
