{ lib, ... }:
with lib;

lib // rec {
	writeFile = name: content: with scriptBuilder {}; "echo \"${content}\" > ${name}";
}
