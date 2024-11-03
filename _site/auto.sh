#!/bin/bash

# Directory to save the posts
POSTS_DIR="./_posts"

# Check if the posts directory exists; if not, create it
mkdir -p $POSTS_DIR

# Number of posts to generate
NUM_POSTS=5

# Loop to create multiple Markdown files
for i in $(seq 1 $NUM_POSTS); do
    # Generate a date for each post (today - i days)
    DATE=$(date -d "$i days ago" +"%Y-%m-%d")
    TITLE="Sample Blog Post $i"
    FILENAME="${POSTS_DIR}/${DATE}-sample-post-${i}.md"
    
    # Create the file with front matter and content
    cat <<EOF > $FILENAME
---
layout: post
title: "${TITLE}"
date: ${DATE}
categories: blog
---

This is an automatically generated blog post for testing purposes.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Post number ${i}.
EOF

    echo "Created post: $FILENAME"
done

echo "Finished generating $NUM_POSTS blog posts."
