RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

check_exercise()
{
	cc -Wall -Wextra -Werror -lbsd ~/joaonette/$LIST/$DIR/*.c $LOCAL/*.c -o $LOCAL/a.out  || ERROR=true
	DIFF=$(diff <($LOCAL/a.out) ~/joaonette/$LIST/$DIR/expected_output) || ERROR=true
	if [[ "$DIFF" == "" && "$ERROR" == "" ]]; then
		echo -e "OK ${GREEN}✓${NC}"
	else
		echo -e "KO ${RED}✖${NC}"
	fi

	if [ -n "$DIFF" ]; then
		echo -e "----- DIFF ----- ( < user | > expected )"
		diff <($LOCAL/a.out) ~/joaonette/$LIST/$DIR/expected_output
	fi
}

if [[ $(basename $PWD) == ex* ]]; then
	LIST=$(basename $(dirname $PWD))
	DIR=$(basename $PWD)
	LOCAL="$PWD"
	check_exercise
else
	LIST=$(basename ${PWD})
	for DIR in */ ; do
		LOCAL="${DIR::-1}"
		echo "====== $DIR ======"
		check_exercise
	done
fi 