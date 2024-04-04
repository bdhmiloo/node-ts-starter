module.exports = {
    parser: "@typescript-eslint/parser",
    parserOptions: {
      ecmaVersion: 2020,
      sourceType: "module",
    },
    extends: [
      "eslint:recommended",
      "plugin:@typescript-eslint/recommended",
      "plugin:@typescript-eslint/stylistic",
      "plugin:prettier/recommended",
    ],
    plugins: ["prefer-arrow"],
    rules: {
      "func-style": ["error", "expression"],
      "prefer-arrow/prefer-arrow-functions": "error",
    },
  };
  