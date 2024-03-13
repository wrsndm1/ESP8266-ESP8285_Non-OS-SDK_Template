#!/bin/bash
# 用于将当前工程文件内的bin文件夹复制到共享文件夹内，方便在windows进行固件烧录，如需使用需要修改目标目录

# 定义源目录和目标目录
src_dir="./../bin/"
dst_dir="/mnt/Share/bin/"

# 确保目标目录存在，如果不存在则创建
if ! mkdir -p "$dst_dir"; then
    echo "错误：无法创建目标目录${dst_dir}。"
    exit 1
fi

# 清空目标目录下已存在的文件及子目录（如果需要）
if ! rm -rf "$dst_dir"/*; then
    echo "警告：无法清空目标目录${dst_dir}下的内容。"
    # 选择是否终止脚本
    # exit 1
fi

# 复制源目录下的所有内容到目标目录
if ! cp -rf "$src_dir"/* "$dst_dir"; then
    echo "错误：复制过程中出现问题。"
    exit 1
fi

echo "完成：已将${src_dir}中的内容复制到${dst_dir}目录下。"

exit 0
