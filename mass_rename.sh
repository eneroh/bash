#!/bin/sh                                                                       
    
for file in $file; do    
    mv "$file" "${file/F-/F}"    
done   
