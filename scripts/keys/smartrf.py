#!/bin/python3

# smartrf
# deps: xdotool, gtk-launch

# if app is not running: open it
# if it is running but is not focused: focus it
# if it is focused, try to focus to the next instance of it (if it exists)

import subprocess
import argparse
import time
import shlex


def active_window():
    try:
        out = subprocess.check_output(["xdotool", "getactivewindow"])
    except subprocess.CalledProcessError:
        return None
    lines = out.decode('UTF-8').splitlines()
    if (len(lines) == 1):
        return lines[0]
    else:
        return None


def search_windows(search, by, only_visible=False):
    xdotool_cmd = ["xdotool", "search"]
    if only_visible:
        xdotool_cmd.append("--onlyvisible")
    xdotool_cmd += ["--" + by, search]

    try:
        out = subprocess.check_output(xdotool_cmd)
    except subprocess.CalledProcessError:
        return None

    windows = out.decode('UTF-8').splitlines()
    if windows is None:
        return None

    # cross-reference window id with xprop -root
    # due to an issue where xdotool shows windows that can't be focused
    # (especially from chrome?)
    try:
        xpropout = subprocess.check_output(["xprop", "-root"]).decode('UTF-8')
    except subprocess.CalledProcessError:
        return None

    final = []
    for w in windows:
        # xprop outputs window ids in hex, whereas we're
        # working with numeric base 10 strings here
        if hex(int(w)) in xpropout:
            final.append(w)
    return final or None


def activate_window(window):
    subprocess.run(["xdotool", "windowactivate", window])


def launch(program, shell=False):
    if (shell):
        subprocess.run(shlex.split(program))
    else:
        subprocess.run(["gtk-launch", program])


def run(program, search, by, trap_visible=True, sleep=1, shell=False):
    search_results = search_windows(search, by, trap_visible)

    if search_results is None:
        # If trap_visible == True, then only leave [current workspace]
        # if there is not a matching window [in current workspace]
        # and there IS elsewhere. Otherwise, launch program as normal.
        if trap_visible:
            run(program, search, by, False, sleep, shell)
        else:
            # open it
            launch(program, shell)
            # sleep
            time.sleep(sleep)
            # search again
            search_results = search_windows(search, by, trap_visible)

    active = active_window()

    if active in search_results:
        # activate next window in search_results
        activate_window(
            search_results[(search_results.index(active) + 1) % len(search_results)])
    elif search_results:
        # activate first window in search_results
        activate_window(search_results[0])


def main():
    parser = argparse.ArgumentParser(
        description='launch or focus between the open windows of a program')
    parser.add_argument('program', metavar='PROGRAM', type=str,
                        help='program to launch')
    parser.add_argument('search', metavar='SEARCH', type=str,
                        help='window to search for')
    parser.add_argument('--by', metavar='SEARCHBY', type=str,
                        choices=["classname", "class", "name"], default="classname",
                        help='what to search by (classname, class, name), all regex-able')
    parser.add_argument('--sleep', metavar='SLEEP', type=float, default=0.2,
                        help='seconds to wait after launch to try focusing')
    parser.add_argument('--trap', action="store_true", default=False,
                        help='what to search by (classname, class, name), all regex-able')
    parser.add_argument('--shell', action="store_true", default=False,
                        help='run straight-up instead of with gtk-launch')
    args = parser.parse_args()

    run(args.program, args.search, args.by, args.trap, args.sleep, args.shell)


main()
