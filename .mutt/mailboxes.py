#!/usr/bin/env python

import os
import sys
import json

def main():
    account = str(sys.argv[1])
    mailboxes = []
    filepath = os.path.expanduser("~/.offlineimap/mbnames/{}.json".format(account))
    with open(filepath, "r") as f:
        data = json.load(f)
        for folder in data:
            mailboxes.append('"+{}/{}"'.format(account, folder["foldername"]))

    print("mailboxes {}".format(" ".join(mailboxes)))


if __name__ == "__main__":
    main()
