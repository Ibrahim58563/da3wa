import re
import json

# Read the JSON file
with open('assets/lessonsJson/quran.json', 'r') as file:
    data = json.load(file)


# Function to modify the ayat dictionary
def modify_ayat(ayat):
    modified_ayat = []
    for item in ayat:
        modified_item = {}
        for key, value in item.items():
            modified_item[key] = re.sub(r'\(\d+/', r'(', value)
        modified_ayat.append(modified_item)
    return modified_ayat


# Modify the JSON data
modified_data = []
for entry in data:
    modified_entry = entry.copy()
    modified_entry["ayat"] = modify_ayat(entry["ayat"])
    modified_data.append(modified_entry)

# Write the modified JSON data back to the file
with open('modified_file.json', 'w') as file:
    json.dump(modified_data, file, indent=2, ensure_ascii=False)
