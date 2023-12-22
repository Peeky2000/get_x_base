#!/bin/bash

prefix=""
name_page=""
name_page_lower=""
type=""
package=""

getPackageName() {
  i=1
      while read line; do

      if [[ $line == *"name: "* ]]; then
          package="${line/name: /}"
          break
      fi
      i=$((i+1))
      done < $PWD/pubspec.yaml
}

makeScreenFile() {
  echo "import 'package:$package/presentation/${prefix}/controller/${prefix}_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ${name_page}Screen extends StatelessWidget {
  final ${name_page}Controller _controller = Get.find<${name_page}Controller>();

  ${name_page}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
" > "./lib/presentation/${prefix}/view/${prefix}_screen.dart"
}

makeControllerFile() {
  echo "import 'package:ebook_name/core/base_component/base_controller.dart';

class ${name_page}Controller extends BaseController {

}
" > "./lib/presentation/${prefix}/controller/${prefix}_controller.dart"
}

makeBindingFile() {
  echo "import 'package:$package/presentation/${prefix}/controller/${prefix}_controller.dart';
import 'package:get/get.dart';

class ${name_page}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${name_page}Controller>(() => ${name_page}Controller());
  }
}
" > "./lib/presentation/${prefix}/binding/${prefix}_binding.dart"
}

while getopts n:p:t: flag
do
  case "${flag}" in
    n)
      name_page=${OPTARG}
      name_page_lower="$(echo ${name_page:0:1} | tr '[:upper:]' '[:lower:]')${name_page:1}"
      ;;
    p) prefix=${OPTARG};;
    t) type=${OPTARG};;
    *)
      echo "Please add flags -n and -p to set value for Screen Name and Prefix name file"
      echo "If you want to gen cubit for list screen using -t with input [list/l]"
      exit 1
    ;;
  esac
done

if [ -z "$name_page" -o -z "$prefix" ]; then
  echo "Please add flags -n and -p to set value for Screen Name and Prefix name file"
  exit 1
fi

if [ ! -d ./lib/presentation/"${prefix}"/controller ]; then
  mkdir -p "./lib/presentation/${prefix}/controller"
fi

if [ ! -d ./lib/presentation/"${prefix}"/binding ]; then
  mkdir -p "./lib/presentation/${prefix}/binding"
fi


if [ ! -d ./lib/presentation/"${prefix}"/view ]; then
  mkdir -p "./lib/presentation/${prefix}/view"
fi

getPackageName
makeControllerFile
makeBindingFile
makeScreenFile
