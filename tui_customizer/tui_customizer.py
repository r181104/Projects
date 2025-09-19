import json
import os
import subprocess
from simple_term_menu import TerminalMenu

def main():
    """
    The main function to run the TUI Customizer.
    """
    # Change directory to the script's location
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    
    try:
        with open("scripts.json", "r") as f:
            scripts = json.load(f)
    except FileNotFoundError:
        print("Error: scripts.json not found.")
        return

    def get_description_for_status_bar(menu_entry_index):
        if menu_entry_index is not None:
            return scripts[menu_entry_index]["description"]
        return "Navigate with ↑/↓, press Enter to run, or Esc to quit."

    menu_entries = [f"{s.get('icon', '▶️')}  {s['name']}" for s in scripts]

    terminal_menu = TerminalMenu(
        menu_entries,
        title="🐧 Linux TUI Customizer 🐧",
        status_bar=get_description_for_status_bar,
        status_bar_style=("fg_yellow", "bg_black"),
        menu_cursor_style=("fg_cyan", "bold"),
        exit_on_shortcut=False,
    )

    chosen_menu_index = terminal_menu.show()

    if chosen_menu_index is None:
        print("No script selected. Exiting.")
        return

    chosen_script = scripts[chosen_menu_index]
    script_path = chosen_script["script_path"]

    if not os.path.exists(script_path):
        print(f"\n🛑 Error: Script not found at '{script_path}'")
        input("Press Enter to continue...")
        return

    os.system('clear')
    print(f"--- Running '{chosen_script['name']}' ---")
    
    try:
        subprocess.run(["chmod", "+x", script_path], check=True)
        subprocess.run(["/bin/bash", script_path], check=True)
    except subprocess.CalledProcessError as e:
        print(f"\n--- 🛑 Script failed with error code {e.returncode} ---")
        input("Press Enter to return to the menu...")
    except KeyboardInterrupt:
        print("\n--- ⚠️ Script execution cancelled by user ---")
        input("Press Enter to return to the menu...")
    except Exception as e:
        print(f"\n--- 🛑 An unexpected error occurred: {e} ---")
        input("Press Enter to return to the menu...")

if __name__ == "__main__":
    main()
