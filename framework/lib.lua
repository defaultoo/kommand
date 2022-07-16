--[[ Konsole Library - Connects your script to Konsole and opens up a whole library of functions

Functions:
  Lib:OutputText(<string>, <Enum.MessageType/"Custom">, <prefix>, <Color3>)
  - Output text silently without printing to Lua output. Prefix & Color3 can be used if MessageType is "Custom"
      Lib:OutputText("Hello World!", Enum.MessageType.MessageOutput)

  Lib:AddCommand(<string>, function())
  - Creates a new command which when executed, runs the callback function provided
      Lib:AddCommand("runcommand", RunCommand())

  Lib:CreateResponsePrompt()
  - Creates a y/n prompt. Yields thread until user responds. Returns true/false
      Lib:OutputText("Are you sure? [y/n]", "Custom", "--", Color3.fromRGB(85, 170, 255))
      if Lib:CreateResponsePrompt() then
        Lib:OutputText("You are sure.", "Custom", "--", Color3.fromRGB(85, 170, 255))  
      else
        Lib:OutputText("You are not sure.", "Custom", "--", Color3.fromRGB(85, 170, 255))  
      end

  Lib:OutputLoadingSequence(<integer>, <string>)
  - Creates an output with a percentage. First argument must be a number between 0-10.
      Lib:OutputLoadingSequence(2.5, "Inititalising functions")
      Initialise()
      Lib:OutputLoadingSequence(7, "Running command")
      RunCommand()
      Lib:OutputLoadingSequence(10, "Complete")


