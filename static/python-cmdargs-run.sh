cmdargs_path="${VIM_FILEDIR}/cmdargs"
if [ -e "$cmdargs_path" ]; then
    python "$VIM_FILENAME" $(cat ${VIM_FILEDIR}/cmdargs)
else
    python "$VIM_FILENAME"
fi
