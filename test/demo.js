const Demo = artifacts.require("Demo");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Demo", function (/* accounts */) {

  it("should assert true", async function () {
    await Demo.deployed();
    return assert.isTrue(true);
  });
  
});