# Color Palette Script
# This script defines a color palette using ANSI color codes for logging and styling.
# It includes standard colors and custom log level colors.

# Load Custom Colors from Settings
# Ensure that settings.cfg exists in the correct path
if [ -f "./config/settings.cfg" ]; then
    source ./config/settings.cfg
else
    echo "Error: settings.cfg not found. Please check the path."
    exit 1
fi

# Color Palette Definition
# Associative array to hold ANSI color codes.
declare -A COLOR_PALETTE=(
    [BLACK]='\033[0;30m'
    [RED]='\033[0;31m'
    [GREEN]='\033[0;32m'
    [YELLOW]='\033[0;33m'
    [BLUE]='\033[0;34m'
    [PURPLE]='\033[0;35m'
    [CYAN]='\033[0;36m'
    [WHITE]='\033[0;37m'
    [RESET]='\033[0m'
    [INFO]="$COLOR_INFO"
    [SUCCESS]="$COLOR_SUCCESS"
    [WARNING]="$COLOR_WARNING"
    [ERROR]="$COLOR_ERROR"
    [DEBUG]='\033[0;35m'
)

# Add Bold Variants to the Palette
# Adding Bold Variants
for color in BLACK RED GREEN YELLOW BLUE PURPLE CYAN WHITE; do
    base_color_code="${COLOR_PALETTE[$color]}"
    bold_color_code="\033[1;${base_color_code:4}"
    COLOR_PALETTE["BOLD_$color"]="$bold_color_code"
done
# This script can be sourced in other scripts to use the defined color palette.
