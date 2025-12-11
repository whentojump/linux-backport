export PATH=/lib/llvm-20/bin:$PATH

llvm-profdata merge default.profraw -o default.profdata

rm -rf {html,text}-reports

llvm-cov show \
-instr-profile=default.profdata \
-output-dir=html-reports \
-show-mcdc -show-branches=count -show-directory-coverage -show-region-summary=false -show-mcdc-summary \
-format=html vmlinux

llvm-cov show \
-instr-profile=default.profdata \
-output-dir=text-reports \
-use-color=false \
-show-mcdc -show-branches=count -show-directory-coverage -show-region-summary=false -show-mcdc-summary \
-format=text vmlinux
