#!/bin/bash

declare -a workspace_ids

ps cax | grep $1
if [ $? -eq 0 ]; then
    pkill $1
else
    activeworkspace=$(hyprctl activeworkspace -j | jq -r '.id')
    while IFS=: read -r workspace; do
        workspace_ids+=("$workspace")
    done < <(hyprctl monitors -j | jq -r '.[].activeWorkspace.id')

    if [ ${workspace_ids[$2]} -eq $activeworkspace ]; then
        kitten panel --edge=background --layer=bottom $1 &
    else 
        hyprctl dispatch workspace ${workspace_ids[$2]}
        kitten panel --edge=background --layer=bottom $1 &
        sleep 0.3
        hyprctl dispatch workspace ${activeworkspace}
    fi
fi

