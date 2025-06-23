function _tide_remove_unusable_items
    # Remove tool-specific items for tools the machine doesn't have installed
    set -l removed_items
    for item in direnv git nix_shell
        contains $item $tide_left_prompt_items $tide_right_prompt_items || continue
        type --query $item || set -a removed_items $item
    end

    set -U _tide_left_items (for item in $tide_left_prompt_items
        contains $item $removed_items || echo $item
    end)
    set -U _tide_right_items (for item in $tide_right_prompt_items
        contains $item $removed_items || echo $item
    end)
end
