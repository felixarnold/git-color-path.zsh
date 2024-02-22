# Custom function to color path
git_color_path() {
    # Check if the current directory is inside a Git repository
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # Get the full path to the Git repository root
        local repo_root=$(git rev-parse --show-toplevel)
        local repo_root_name=$(basename "$repo_root")
        # Determine if the Git repository root is within the home directory
        local repo_root_relative="${repo_root/#$HOME/~}"
        # Separate the path before the repo root and make it relative to home
        if [ "$ZSH_THEME_COLOR_PATH_FULL" = true ]; then
            local path_before_repo="${repo_root%$repo_root_name}"
        else
            local path_before_repo="${repo_root_relative%$repo_root_name}"
        fi
        # Get the relative path inside the Git repository
        local relative_path_inside_repo="${PWD/#$repo_root\//}"

        if [[ "$PWD" == "$repo_root" ]]; then
            # At the root of the Git repository
            local p="${path_before_repo}${ZSH_THEME_COLOR_PATH_FORMAT_ROOT}"
            p+="${repo_root_name}%f"
            echo "${p}"
        else
            # Inside a subdirectory of the Git repository
            local p="${path_before_repo}${ZSH_THEME_COLOR_PATH_FORMAT_ROOT}"
            p+="${repo_root_name}/${ZSH_THEME_COLOR_PATH_FORMAT_SUBDIRS}"
            p+="${relative_path_inside_repo}%f"
            echo "${p}"
        fi
    else
        # Not in a Git repository, show the path relative to the home directory
        if [ "$ZSH_THEME_COLOR_PATH_FULL" = true ]; then
            echo "${PWD}"
        else
            echo "${PWD/#$HOME/~}"
        fi
    fi
}
