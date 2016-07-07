if [ -f "index.html" ]
then
    rm index.html
fi

INDEX=0
HEADER=0
NAV=0
FOOTER=0

while read line; do
    case "$line" in
        *BEGIN*HEADER*) 
            HEADER=1
            ;;
        *END*HEADER*)
            HEADER=0
            ;;
        *BEGIN*FOOTER*)
            FOOTER=1
            ;;
        *END*FOOTER*)
            FOOTER=0
            ;;
        *BEGIN*NAV*)
            NAV=1
            ;;
        *END*NAV*)
            NAV=0
            ;;
        *BEGIN*INDEX*)
            INDEX=1
            ;;
        *END*INDEX*)
            INDEX=0
            ;;
    esac

    if [ $HEADER -eq 1 ] || [ $FOOTER -eq 1 ] || [ $INDEX -eq 1 ]; then
        echo $line >> index.html
    fi

done < 2016-mooc.html
