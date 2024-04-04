import { describe, expect, it } from "@jest/globals";
import { hello } from "../src";

describe("# index", () => {
  it("should return world", () => {
    const result = hello();

    expect(result).toStrictEqual("world");
  });
});
