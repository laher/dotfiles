#!/usr/bin/env python3
"""Kitten to print the current list of keyboard shortcuts (consists of BOTH single keys and key
sequences).
"""

import re
from collections import defaultdict
from typing import Union, Final

from kittens.tui.handler import result_handler
from kitty import fast_data_types
from kitty.boss import Boss
from kitty.options.utils import KeyMap, SequenceMap
from kitty.tab_bar import Formatter as fmt
from kitty.types import Shortcut, mod_to_names

# List of categories and regular expressions to match actions on
categories: Final = {
    "Scrolling": r"(^scroll_|show_scrollback|show_last_command_output)",
    "Tab Management": r"(^|_)tab(_|$)",
    "Window Management": r"(^|_)windows?(_|$)",
    "Layout Management": r"(^|_)layout(_|\b)",
    "Other Shortcuts": r".",
}

ShortcutRepr = str
ActionMap = dict[str, list[ShortcutRepr]]


def main(args: list[str]) -> Union[str, None]:
    pass

@result_handler(no_ui=True)
def handle_result(args: list[str], answer: str, target_window_id: int, boss: Boss):
    opts = fast_data_types.get_options()

    # set up keymaps (single keystrokes)
    keymap: KeyMap = (
        boss.keymap
    )  # same as `opts.keymap`, except with global keymaps removed
    keymap: dict[Shortcut, str] = {
        Shortcut((key,)): action for key, action in keymap.items()
    }
    # set up key sequences (combinations of keystrokes, separated by '>')
    seq_keymap: SequenceMap = opts.sequence_map
    seq_keymap: dict[Shortcut, str] = {
        Shortcut((key, *subseq_keys)): action
        for key, subseq in seq_keymap.items()
        for subseq_keys, action in subseq.items()
    }
    keymap.update(seq_keymap)
    kittymod = "+".join(mod_to_names(opts.kitty_mod))
    # categorize shortcuts
    # because each action can have multiple shortcuts associated with it, we also attempt to
    # group shortcuts with the same actions together.
    output_categorized: dict[str, ActionMap] = defaultdict(lambda: defaultdict(list))
    for key, action in keymap.items():
        key_repr: ShortcutRepr = key.human_repr(kitty_mod=opts.kitty_mod)
        key_repr = key_repr.replace('kitty_mod', kittymod)

        key_repr = f"{key_repr:<20} {fmt.fg.green}→{fmt.fg.default} {action}"

        for subheader, re_pat in categories.items():
            if re.search(re_pat, action):
                action_map: ActionMap = output_categorized[subheader]
                action_map[action].append(key_repr)
                break
        else:
            emsg = f"No valid subheader found for keymap {key_repr!r}."
            raise ValueError(emsg)

    # print out shortcuts
    output = [
        f"""Kitty keyboard mappings
=======================

kitty_mod is {kittymod}
""",
    ]
    for category in categories:
        if category not in output_categorized:
            continue
        output.extend([category, "=" * len(category), ""])
        output.extend(sum(output_categorized[category].values(), []))
        output.append("")

    boss.display_scrollback(
        boss.active_window,
        "\n".join(output),
        title="Kitty keyboard mappings",
        report_cursor=False,
    )
