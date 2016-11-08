# Blackjack Advisor

The program entitled blackjack_advisor.rb is intended to help users optimize their profits during a game of Blackjack.  The program asks for the user to input data for both player cards and the dealer's card using number values for numbered cards, the number '10' for face cards, and the letter 'A' for Ace cards.  The program will automatically advise the user to hit, stand, or split based on the players hand (hard, soft, or set of pairs), and the number of decks in play. This program is only intended to advise one play at a time and will not loop through multiple sequences.

## Getting Started

The instructions below will help you retrieve a copy of the project to run on your local machine through the Terminal application. Please see deployment for notes on how to deploy the project on a live system.  The instructions provided are for macbook users.

### Prerequisities

You may need to install or update the following software.

Find Terminal - to run program
  1. Open Finder. Finder is available in the Dock.
  2. Select Applications from the side bar menu.  Then unfold the Utilities folder.
  3. Double click on Terminal to initialize.

Install Homebrew - to store program files properly
  1. Open up Terminal.
  2. Run `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
  3. Run `brew doctor`

Install rbenv & ruby-build - to install and compile different versions of Ruby code language
  1. Open up Terminal
  2. Run `brew install ruby-build rbenv`
  3. Run `echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile`

Install ruby 2.3.1 - or latest version of Ruby
  1. Close and reopen Terminal. `rbenv install 2.3.1`
  2. After quite some time, run: `rbenv global 2.3.1`

Once you have completed the above installation processes your system is ready to launch the program!

## Deployment

Please complete the following procedure to run the program on a live system:
  1. Open Terminal.
  2. Change your directory to the one that which you would like to save this project. `$ cd folder_name`
  3. Then run the commands `$ git clone https://github.com/kteich88/blackjack_advisor.git` and `$ cd blackjack_advisor`
  4. Type `ruby blackjack_advisor.rb` to run the program.
  5. READ all instructions BEFORE adding input.

## Built With

* Atom

## Authors

* **Kristine Teichmann**

## Acknowledgments

* The Iron Yard - Durham

* Alyssa Pratt

* Bryce Darling
