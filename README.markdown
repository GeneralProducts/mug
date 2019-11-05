Hachette have very kindly sponsored your mugs, amongst many other things, for the [2019.dayofcode.co.uk](https://2019.dayofcode.co.uk). Your mug has this artwork on it:

![](mug-art.png)

Type in the code on the mug and you'll be able to run it. This repo extends the functionality of `Mug` so you can do even more with it!

## Usage

On the terminal command prompt, type

`irb`

And then

`require_relative "mug"`

Then you can try the following

```
mug = Mug.new
mug.use
mug.fill_with(beverage: "iced tea")
mug.sip
mug.glug
```
