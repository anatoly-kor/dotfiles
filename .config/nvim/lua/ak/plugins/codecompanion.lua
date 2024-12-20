local p = [[
###INSTRUCTIONS###

You MUST ALWAYS:
- Answer in the language of my message
- Read the chat history before answering
- I have no fingers and the placeholders trauma. NEVER use placeholders or omit the code
- If you encounter a character limit, DO an ABRUPT stop; I will send a "continue" as a new message
- You will be PENALIZED for wrong answers
- NEVER HALLUCINATE
- You DENIED to overlook the critical context
- ALWAYS follow ###Answering rules###

###Answering Rules###

Follow in the strict order:

1. USE the language of my message
2. In the FIRST message, assign a real-world expert role to yourself before answering, e.g., "I'll answer as a world-famous historical expert <detailed topic> with <most prestigious LOCAL topic REAL award>" or "I'll answer as a world-famous <specific science> expert in the <detailed topic> with <most prestigious LOCAL topic award>"
3. You MUST combine your deep knowledge of the topic and clear thinking to quickly and accurately decipher the answer step-by-step with CONCRETE details
4. I'm going to tip $1,000,000 for the best reply
5. Your answer is critical for my career
6. Answer the question in a natural, human-like manner
7. ALWAYS use an ##Answering example## for a first message structure

##Answering example##

// IF THE CHATLOG IS EMPTY:
<I'll answer as the world-famous %REAL specific field% scientists with %most prestigious REAL LOCAL award%>

**TL;DR**: <TL;DR, skip for rewriting>

<Step-by-step answer with CONCRETE details and key context>
]]

-- local docstring = [[
-- Добавь однострочный python docstrings на русском языке к каждому методу/функции/классу, просто и понятно обьясняющие что делает этот метод/функция/класс в следующем коде
-- ]]
return {}
-- return {
--     "olimorris/codecompanion.nvim",
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--         "nvim-treesitter/nvim-treesitter",
--     },
--     config = function()
--         require("codecompanion").setup({
--             opts = {
--                 log_level = "DEBUG", -- or "TRACE"
--             },
--             -- display = { chat = { show_settings = true } },
--             pre_defined_prompts = {
--                 ["ChatGPT"] = {
--                     strategy = "chat",
--                     description = "ChatGPT prompt",
--                     prompts = {
--                         {
--                             role = "system",
--                             content = p,
--                             opts = {
--                                 visible = false,
--                             },
--                         },
--                         {
--                             role = "user",
--                             content = "Обьясни ...",
--                         },
--                     },
--                 },

--                 ["docstring"] = {
--                     strategy = "chat",
--                     description = "Add Docstrings",
--                     prompts = {
--                         {
--                             role = "system",
--                             content = p
--                                 .. "Добавь однострочный python docstrings на русском языке к каждому методу/функции/классу,"
--                                 .. "просто и понятно обьясняющие что делает этот метод/функция/класс в следующем коде",

--                             opts = {
--                                 visible = false,
--                             },
--                         },
--                         {
--                             role = "user",
--                             content = "Добавь однострочный python docstrings на русском языке к каждому методу/функции/классу,"
--                                 .. "просто и понятно обьясняющие что делает этот метод/функция/класс в следующем коде",
--                         },
--                     },
--                 },
--                 ["pytest"] = {
--                     strategy = "chat",
--                     description = "Generate tests with pytest for the selected code",
--                     prompts = {
--                         {
--                             role = "system",
--                             content = [[When generating unit tests, follow these steps:

--                             1. Identify the programming language.
--                             2. Identify the purpose of the function or module to be tested.
--                             3. List the edge cases and typical use cases that should be covered in the tests and share the plan with the user.
--                             4. Generate unit tests using an appropriate testing framework for the identified programming language.
--                             5. Ensure the tests cover:
--                                   - Normal cases
--                                   - Edge cases
--                                   - Error handling (if applicable)
--                             6. Provide the generated unit tests in a clear and organized manner without additional explanations or chat.
--                             7. Write tests only in functions, don`t use classes.
--                             8. Write tests only with pytest(use fixture, assert, etc).]],
--                             opts = {
--                                 visible = false,
--                             },
--                         },
--                         {
--                             role = "user",
--                             content = "Please generate tests with pytest for this code:",
--                             opts = {
--                                 contains_code = true,
--                             },
--                         },
--                     },
--                 },
--             },
--             adapters = {
--                 llama3 = function()
--                     return require("codecompanion.adapters").extend("ollama", {
--                         name = "llama3",
--                         schema = {
--                             temparature = {
--                                 default = 0.2,
--                             },
--                             model = {
--                                 default = "qwen2.5-coder:3b",
--                             },
--                             num_ctx = {
--                                 default = 16384,
--                             },
--                             num_predict = {
--                                 default = -1,
--                             },
--                         },
--                     })
--                 end,
--             },
--             strategies = {
--                 chat = {
--                     adapter = "llama3",
--                 },
--                 inline = {
--                     adapter = "llama3",
--                 },
--                 agent = {
--                     adapter = "llama3",
--                 },
--             },
--         })
--         vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", {
--             noremap = true,
--             silent = true,
--             desc = "[C]ode companion [A]ctions",
--         })
--         vim.keymap.set(
--             { "n", "v" },
--             "<C-t>",
--             "<cmd>CodeCompanionToggle<cr>",
--             { noremap = true, silent = true, desc = "[C]ode companion [T]oggle" }
--         )
--         vim.keymap.set(
--             "v",
--             "ga",
--             "<cmd>CodeCompanionAdd<cr>",
--             { noremap = true, silent = true, desc = "Code companion add selected to chat" }
--         )
--     end,
-- }
