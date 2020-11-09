#!/bin/bash

for i in sam joe amy sara admin; do userdel -fr $i; done
exit