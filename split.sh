if [ -f "index.html" ]
then
    rm index.html
    rm osa1.html
    rm osa2.html
    rm osa3.html
fi

echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > index.html
echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > osa1.html
echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > osa2.html
echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > osa3.html

INDEX=0
HEADER=0
NAV=0
CONTENT=0
FOOTER=0
OSA1=0
OSA2=0
OSA3=0


IFS=''
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
        *BEGIN*CONTENT*)
            CONTENT=1
            ;;
        *END*CONTENT*)
            CONTENT=0
            ;;
        *BEGIN*INDEX*)
            INDEX=1
            ;;
        *END*INDEX*)
            INDEX=0
            ;;
        *BEGIN*OSA1*)
            OSA1=1
            ;;
        *END*OSA1*)
            OSA1=0
            ;;
        *BEGIN*OSA2*)
            OSA2=1
            ;;
        *END*OSA2*)
            OSA2=0
            ;;
        *BEGIN*OSA3*)
            OSA3=1
            ;;
        *END*OSA3*)
            OSA3=0
            ;;
    esac

    if [ $HEADER -eq 1 ] || [ $FOOTER -eq 1 ] || [ $INDEX -eq 1 ]; then
        echo $line >> index.html
    fi
    if [ $HEADER -eq 1 ] || [ $FOOTER -eq 1 ] || [ $OSA1 -eq 1 ] || [ $CONTENT -eq 1 ]; then
        echo $line >> osa1.html
    fi
    if [ $HEADER -eq 1 ] || [ $FOOTER -eq 1 ] || [ $OSA2 -eq 1 ] || [ $CONTENT -eq 1 ]; then
        echo $line >> osa2.html
    fi
    if [ $HEADER -eq 1 ] || [ $FOOTER -eq 1 ] || [ $OSA3 -eq 1 ] || [ $CONTENT -eq 1 ]; then
        echo $line >> osa3.html
    fi

done < 2016-mooc.html
