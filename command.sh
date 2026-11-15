#!/usr/bin/env bash

# REPO_URL https://github.com/ZakiRahnavard/propeller-logo-task

# 1. Create React application
npx create-react-app propeller-logo-task
cd propeller-logo-task

# 2. Create public GitHub repository
git branch -M master
gh repo create propeller-logo-task --public --source=. --remote=origin --push

# 3. Create and switch to feature branch
git switch -c update_logo

# 4. Download Propeller Aero logo
curl -L "https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg" -o src/logo.svg

# 5. Update App.js manually in the editor:
# Replace the default React logo and update the link to:
# https://www.propelleraero.com/dirtmate/

# 6. Commit and push changes
git add src/App.js src/logo.svg
git commit -m "Update Propeller Aero logo and DirtMate link"
git push -u origin update_logo

# 7. Create pull request
gh pr create --base master --head update_logo --title "Update Propeller Aero logo and DirtMate link" --body "Replace the default React logo with the Propeller Aero logo and update the link to DirtMate."

# 8. Merge pull request
gh pr merge --merge
