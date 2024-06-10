# My .dotfiles

Here you'll find configurations for various tools and applications that I use daily. These dotfiles are managed using GNU Stow, making it easy to symlink configuration files into the appropriate locations.

## Installation

> You need to have GNU Stow installed on your system first, I use Slackware so you should download from slackbuilds(https://slackbuilds.org/repository/15.0/system/stow/)

To use my dotfiles, clone this repository into your home directory:

```bash
git clone https://codeberg.org/r1w1s1/dotfiles.git ~/.dotfiles
```

Navigate to the `.dotfiles` directory

```bash
cd ~/.dotfiles
```

Use GNU Stow to symlink the configurations:

```bash
stow .
```

## Usage

After symlinking the configurations, you can customize them further or start using them immediately. Any changes made to the files within the repository will be reflected in your home directory.

## Contributions

Feel free to fork this repository, make changes, and submit pull requests. I'm open to suggestions for improvements or new configurations.
