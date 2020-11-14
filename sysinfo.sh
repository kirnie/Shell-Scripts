#!/usr/bin/sh

# sysinfo_page - Script to produce an HTML file

#### Constants

TITLE="System Information for $HOSTNAME"
RIGHT_NOW="$(date +"%x %r %Z")"
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

#### Functions

system_info()
{
    echo "<h2>System release info</h2>"
    echo "<p>Function not implemented yet</p>"
}


show_uptime()
{
    echo "<h2>System uptime</h2>"
    echo "<pre>"
    uptime
    echo "</pre>"
}


drive_space()
{
    echo "<h2>Drive Space</h2>"
    echo "<pre>"
    df -h
    echo "</pre>"
}

home_space()
{
    echo "<h2>Home Space</h2>"
    echo "<pre>"
    #used disk space displayed as list in descending order 
    du -sh /home/koski | sort -nr
    echo "</pre>"
}

#### Main

cat <<- _EOF_
    <html>
    <head>
        <title>$TITLE</title>
    </head>

    <body>
        <h1>$TITLE<h1>
        <p>$TIME_STAMP</p>
        $(system_info)
        $(show_uptime)
        $(drive_space)
        $(home_space)
    </body>
    </html>
_EOF_

