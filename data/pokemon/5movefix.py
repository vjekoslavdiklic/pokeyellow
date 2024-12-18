import os
import re

BASE_STATS_DIR = "base_stats"  # Change this to the correct directory if needed

def add_fifth_move_to_learnset(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".asm"):
            file_path = os.path.join(directory, filename)
            with open(file_path, "r", encoding="utf-8") as file:
                content = file.read()

            # Match the 'level 1 learnset' line, which always has 4 entries
            learnset_pattern = r"(db\s+[A-Z,_\s]+;\s*level\s*1\s*learnset)"
            match = re.search(learnset_pattern, content)

            if match:
                # Add an additional NO_MOVE entry
                learnset_line = match.group(1)
                fixed_learnset_line = learnset_line.replace(" ; level 1 learnset", ", NO_MOVE ; level 1 learnset")

                # Replace the old line with the fixed line
                content = re.sub(learnset_pattern, fixed_learnset_line, content)

                # Write the fixed content back to the file
                with open(file_path, "w", encoding="utf-8") as file:
                    file.write(content)
                print(f"Added fifth move to {filename}")

# Run the function
add_fifth_move_to_learnset(BASE_STATS_DIR)
