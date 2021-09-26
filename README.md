# Introduce
This is a demo to reduce the `basic noise of booting memory`.
It includes:
- A demo of stratovirt which saves about 12% memory when booting.
- A test script which can help watching the changes of memory when booting.

The size of memory is the sum of PSS of the Stratovirt, including the consumption of Guest OS.
It is only based on the architecture of `x86_64`.

# Test process
First, clone this reposity to the diretory where you like.

Then, you can clone the master branch of stratovirt from the official repository as a comparison with mine.
```bash
git clone https://gitee.com/openeuler/stratovirt.git
```
And then copy the `test_script` in my repository to the root directory of official `stratovirt`.
The `test_script` including the scripts which should run both;

```bash
cp test_script the/root/of/official/stravorit
# both repository should do the following for preparation.
cd test_script
chmod +x *.sh
./preprocess.sh
```
This will download the same environment in both repositories.

Open another terminal(named Terminal 1) to run `watch_mem.sh`, this will watch the memory changes of the only `stravorit` job. You can run it along the whole process of testing.
```bash
# Open another terminal and run it:
# In test_script:
./watch_mem.sh
```

Then we open another terminal(named Terminal 2) to run `run_gnu.sh` or `run_musl.sh` in the official stratovirt repo and this repo seperately. Namely you should run four test cases seperately.

# Result
The Test results of mine are just the following:
| repo    | gnn toochchain | musl toolchain |
| ------- | -------------- | -------------- |
| Demo    | 78229 Kib      | 78192 Kib      |
| official| 88904 Kib      | 89796 Kib      |
| saving  | 0.12007%       | 0.12923%       |

Note: The test is based on `x86_64`. No test in `aarch64`.

