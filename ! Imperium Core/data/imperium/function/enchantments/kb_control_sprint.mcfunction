# Knockback Control's tick effect, while the holder sprints: remember the tick. Every attack resets
# sprint before post_attack runs, so kb_control_read checks "sprinting last tick" instead.
execute store result score @s im.kbSprint run time query gametime
