# Utility functions for path management.


# Remove the specified segment ($2) from the specified path variable ($1)
path_remove () {
    local expanded
    eval "expanded=\"\${$1}\""

    # Return if the segment is not contained in the path
    if [[ ":${expanded}:" != *":${2}:"* ]] ; then
        return
    fi

    # Construct new path without the specified segments
    local IFS=':'
    local newpath
    local segment
    for segment in ${expanded} ; do
        if [ "${segment}" != "${2}" ] ; then
            newpath=${newpath:+${newpath}:}${segment}
        fi
    done

    export "${1}"="${newpath}"
}

# Append the specified segment ($2) to the specified path variable ($1)
path_append () {
    # # Check if directory exists
    if [[ ! -d "${2}" ]] ; then
        return
    fi

    path_remove "${1}" "${2}"

    local expanded
    eval "expanded=\"\${${1}}\""

    export "${1}"="${expanded:+${expanded}:}${2}"
}

# Prepend the specified path variable ($1) with the specified segment ($2)
path_prepend () {
    # Check if directory exists
    if [[ ! -d "${2}" ]] ; then
        return
    fi

    path_remove "${1}" "${2}"

    local expanded
    eval "expanded=\"\${${1}}\""

    export "${1}"="${2}${expanded:+:${expanded}}"
}


# Append the specified flags ($2, $3, ...) to the specified variable ($1)
# Note: spaces need to be escaped
flags_append () {
    local varname="${1}"
    shift

    local expanded
    eval "expanded=\"\${$varname}\""

    local flags=${expanded:+"${expanded} "}"${*}"
    export "${varname}"="${flags}"
}

# Prepend the specified variable ($1) with the specified flags ($2, $3, ...)
# Note: spaces need to be escaped
flags_prepend () {
    local varname="${1}"
    shift

    local expanded
    eval "expanded=\"\${${varname}}\""

    local flags="${*}"${expanded:+" ${expanded}"}
    export "${varname}"="${flags}"
}


# Check if the given command ($1) is available
is_command() {
    command -v "${1}" >/dev/null 2>&1
}

# Check if command exists and is an executable file (script or bina
is_executable() {
    local info="$(command -v "${1}" 2>/dev/null)"

    if [[ "${info}" == /* ]]; then
        return 0
    else
        return 1
    fi
}

