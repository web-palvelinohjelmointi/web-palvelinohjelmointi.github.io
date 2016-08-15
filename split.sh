if [ -f "index.html" ]
then
    rm index.html
    rm osa1.html
    rm osa2.html
    rm osa3.html
    rm osa4.html
    rm osa5.html
    rm osa6.html
fi

echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > index.html
echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > osa1.html
echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > osa2.html
echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > osa3.html
echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > osa4.html
echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > osa5.html
echo "<!-- AUTOMATICALLY GENERATED FILE, PLEASE DO NOT EDIT DIRECTLY: FOR CHANGES, MODIFY 2016-mooc.html -->" > osa6.html

INDEX=0
HEADER=0
NAV=0
CONTENT=0
FOOTER=0
OSA=0

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
            OSA=1
            ;;
        *END*OSA1*)
            OSA=-1
            ;;
        *BEGIN*OSA2*)
            OSA=2
            ;;
        *END*OSA2*)
            OSA=-1
            ;;
        *BEGIN*OSA3*)
            OSA=3
            ;;
        *END*OSA3*)
            OSA=-1
            ;;
        *BEGIN*OSA4*)
            OSA=4
            ;;
        *END*OSA4*)
            OSA=-1
            ;;
        *BEGIN*OSA5*)
            OSA=5
            ;;
        *END*OSA5*)
            OSA=-1
            ;;
        *BEGIN*OSA6*)
            OSA=6
            ;;
        *END*OSA6*)
            OSA=-1
            ;;
    esac

    if [ $HEADER -eq 1 ] || [ $FOOTER -eq 1 ] || [ $INDEX -eq 1 ]; then
        echo $line >> index.html
    fi

    if [ $HEADER -eq 1 ] || [ $FOOTER -eq 1 ] || [ $CONTENT -eq 1 ]; then
        echo $line >> osa1.html
        echo $line >> osa2.html
        echo $line >> osa3.html
        echo $line >> osa4.html
        echo $line >> osa5.html
        echo $line >> osa6.html
    fi

    if [ $OSA -eq 1 ]; then
        echo $line >> osa1.html
    fi

    if [ $OSA -eq 2 ]; then
        echo $line >> osa2.html
    fi

    if [ $OSA -eq 3 ]; then
        echo $line >> osa3.html
    fi

    if [ $OSA -eq 4 ]; then
        echo $line >> osa4.html
    fi

    if [ $OSA -eq 5 ]; then
        echo $line >> osa5.html
    fi

    if [ $OSA -eq 6 ]; then
        echo $line >> osa6.html
    fi
done < 2016-mooc.html
