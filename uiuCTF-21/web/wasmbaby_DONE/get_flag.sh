# @Author: SAIKAT KARMAKAR
# @Date:   2021-07-31 13:58:28
# @Last Modified by:   SAIKAT KARMAKAR
# @Last Modified time: 2021-07-31 13:59:31

if [[ -f index.wasm ]];
	then
		rm index.wasm
fi
curl  http://wasmbaby.chal.uiuc.tf/index.wasm -o index.wasm

strings index.wasm | tail -1 > flag.txt
