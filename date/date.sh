#!/usr/bin/env bash

# would be better just to use dategrep
grep -Po "(3[01]|[012][0-9])(\.|\/)(1[012]|0[1-9])(\.|\/)((?:18|19|20)\d{2})" text.txt
