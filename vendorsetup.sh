#
# Copyright (C) 2024 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Apply ROM patches
echo -e "\033[31mAutomatically applying ROM patches...\033[0m"
THISDIR=$PWD
cd ${THISDIR}/device/huawei/liszt/patches
./patch.sh
cd ${THISDIR}
sleep 1

# Add lunch combo options
add_lunch_combo cm_liszt-userdebug
