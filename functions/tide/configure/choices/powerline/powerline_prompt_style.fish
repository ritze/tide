function powerline_prompt_style
    _tide_title 'Powerline Prompt Style'

    _tide_option 1 'One line'
    _tide_find_and_remove newline fake_tide_left_prompt_items
    _tide_find_and_remove character fake_tide_left_prompt_items
    _tide_display_prompt

    set -a fake_tide_left_prompt_items newline

    _tide_option 2 'Two lines, character'
    set -a fake_tide_left_prompt_items character
    _tide_display_prompt

    _tide_option 3 'Two lines, frame'
    _tide_find_and_remove character fake_tide_left_prompt_items
    _tide_display_prompt

    _tide_option 4 'Two lines, character and frame'
    set -a fake_tide_left_prompt_items character
    _tide_display_prompt

    _tide_menu (status function)
    switch $_tide_selected_option
        case 'One line'
            _tide_find_and_remove newline fake_tide_left_prompt_items
            _tide_find_and_remove character fake_tide_left_prompt_items
            _next_choice all/prompt_connection_andor_frame_color
        case 'Two lines, character'
            _next_choice all/prompt_connection
        case 'Two lines, frame'
            _tide_find_and_remove character fake_tide_left_prompt_items
            _next_choice all/prompt_connection
        case 'Two lines, character and frame'
            _next_choice all/prompt_connection
    end
end
