{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        nim-unwrapped-2
        nimble
    ];
}