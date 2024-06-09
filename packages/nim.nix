{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        nimble
        nim
    ];
}