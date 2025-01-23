#!/bin/bash
PACKAGE_PAGE_DIR_NAME=github-page

DIRECTORIES=$(find . -type d -name $PACKAGE_PAGE_DIR_NAME)
for directory in $DIRECTORIES
do
  PARENT_BASENAME=$(basename $(dirname $directory));
  # Construct appropriate pages path
  PAGE_PATH=docs/$PARENT_BASENAME;
  mkdir -p $PAGE_PATH;
  cp $directory/* $PAGE_PATH;
done


PAGE_NAMES=$(for directory in $DIRECTORIES;
do
    PARENT_BASENAME=$(basename $(dirname $directory));
    echo "<li><a href=${PARENT_BASENAME}>${PARENT_BASENAME}</a></li>";
done );

echo $PAGE_NAMES;
cat > docs/index.html << EOF
<!DOCTYPE html>
<html>
  <head>
    <title>Packages preview</title>
  </head>
  <body>
    <ul>
    $PAGE_NAMES
    </ul>
  </body>
</html>
EOF

