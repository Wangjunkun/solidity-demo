const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const dataUintDeploy = 666;
const dataBoolDeploy = true;
const dataStringDeploy = "WHOSYOURDADDY";

module.exports = buildModule("DemoModule", (m) => {
  // 这里要求成员变量都是public的
//   const dataUint = m.getParameter("dataUint", dataUintDeploy);
//   const dataBool = m.getParameter("dataBool", dataBoolDeploy);
//   const dataString = m.getParameter("dataString", dataStringDeploy);

  const dataUint = 666;
  const dataBool = true;
  const dataString = "wjk";

    const demo = m.contract(
        "Demo", 
        [dataUint, dataBool, dataString]
    );

    // call一下某个函数
    m.call(demo, "getDataString");

    return { demo };
}
);
