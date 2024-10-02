import requests
import datetime
import re
import binascii
import concurrent
from concurrent.futures import ThreadPoolExecutor

# Define flags with argparse for cleaner command-line arguments
import argparse

# -d = debug mode
# -l = limit the number of finds
parser = argparse.ArgumentParser(description="Legion Space version finder")
parser.add_argument("-d", "--debug", action="store_true", help="Enable debug mode")
parser.add_argument("-l", "--limit", type=int, default=5, help="Limit the number of versions to check")
args = parser.parse_args()

_DEBUG = args.debug
_LIMIT = args.limit

map = {}


def generate_possible_version_list():
    """
    Generates a list of possible Legion Space version numbers based on the current date.

    Returns:
        list: A list of possible version numbers in the format "YY.MM.DD.01".
    """

    current_date = datetime.datetime.now().date()
    current_year = str(current_date.year)[-2:]
    current_month = current_date.month
    current_day = current_date.day

    version_list = []

    for month in range(1, current_month + 1):
        last_day = current_day if month == current_month else 31
        for day in range(1, last_day + 1):
            version_list.append(f"{current_year}.{month:02d}.{day:02d}.01")

    return version_list


# Tools like ExifTool can be used to extract the version number from the exe.

# Supposedly, Windows also has a built-in tool to extract the version number.

# The goal was to allow this script to run on any platform without any tools.


def get_legionspace_version_number(file_path):
    """
    Retrieves the version number of a Legion Space executable file using just hexadecimals.

    Args:
        file_path (str): The path to the Legion Space executable file.

    Returns:
        list: A list containing the hexadecimal version number and its corresponding string representation.
              If the version cannot be found in the exe, it returns: ["30002e0030002e0030002e003000", "0.0.0.0"].
    """

    with open(file_path, "rb") as file:
        # The hex representation of "FileVersion"
        find_hex = "460069006c006500560065007200730069006f006e"

        # The exe has a padding of 5 bytes before the version number
        padding = "00" * 5

        # Decode the file for reading
        hex = binascii.hexlify(file.read()).decode("utf-8")

        # Search for the version number
        match = re.search(find_hex + padding + "(.*?)" + "00" * 2, hex)

        # If the version number is found, return it
        if match:
            # Get the hexadecimal version number
            found_hex = match.group(1)

            # Convert the hexadecimal version number to a string
            version = binascii.unhexlify(found_hex).decode("utf-8").encode("ascii", "ignore").decode()

            # Return the hexadecimal version number and its string representation
            return [found_hex, version]
        else:

            # Return the default version number if it cannot be found
            return ["30002e0030002e0030002e003000", "0.0.0.0"]


def download_file(version):
    url = f"https://s3.service.lenovo.com/legion/cms/v{version}/legionspace.exe"
    try:
        if _DEBUG:
            print(f"\033[93mTrying v{version}...\033[0m")
        response = requests.get(url)
        if response.status_code == 200:
            print(f"\033[92m[+] v{version} found!\033[0m")
            # Download the file
            file_name = f"legionspace_{version}.exe"
            with open(file_name, "wb") as file:
                file.write(response.content)
            print(f"\033[92m[+] Downloaded v{version} to {file_name}.\033[0m")
            return file_name
        elif response.status_code == 401:
            if _DEBUG:
                print(f"\033[91m[-] v{version} requires authentication.\033[0m")
        else:
            if _DEBUG:
                print(f"\033[91m[-] v{version} not found, status code: {response.status_code}.\033[0m")
    except requests.exceptions.RequestException as e:
        if _DEBUG:
            print(f"\033[91m[-] An error occurred while trying to download v{version}: {e}.\033[0m")

def main(version):
    download_task = download_file(version)
    if download_task:
        real_version = get_legionspace_version_number(download_task)
        print(f"\033[92m[+] v{version} has version number: {real_version[1]}.\033[0m")
        map[version] = real_version[1]

possible_version_list = generate_possible_version_list()

# Create a thread pool executor
with ThreadPoolExecutor(max_workers=_LIMIT) as executor:
    # Submit the download tasks to the executor
    download_tasks = [executor.submit(main, version) for version in possible_version_list]

    # Wait for all tasks to complete
    concurrent.futures.wait(download_tasks)

print('\033[92m' + 'Done!' + '\033[0m')

# Write the current date to the file
current_date = datetime.datetime.now().date()
with open("legionspace_output.txt", "w") as file:
    file.write(f"Current Date: {current_date}\n")
    file.write("Versions Found:\n")
    for version, version_number in map.items():
        file.write(f"{version}: {version_number}\n")
