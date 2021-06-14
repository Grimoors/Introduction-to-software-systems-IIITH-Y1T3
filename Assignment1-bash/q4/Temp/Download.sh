#!/bin/bash

LIST=${1:?"LIST word"}
FILE=${2:?"FILE name not set"}

L=$( sed -e ':a;N;$!ba;s_\n_\x00_g' ${LIST}|sed -e 's_\x00_ \\|_g' -e's_\(\\|\)*$__g')
P='s_\('$L'\)__ig'
O="sed -e '$P'  ${FILE}"

eval "${O}"