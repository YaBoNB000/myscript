module.exports = function handler(req, res) {

  const userAgent = req.headers['user-agent'] || '';
  const isRoblox = userAgent.includes('Roblox');

  if (isRoblox) {
    res.setHeader('Content-Type', 'text/plain');
    res.status(200).send('print("123")');

  } else {
    res.setHeader('Content-Type', 'text/html; charset=utf-8');
    res.status(403).send(`
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <title>受保护</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      background: #0f0f0f;
      color: #fff;
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      user-select: none;
    }
    .box {
      text-align: center;
      border: 1px solid #ff4444;
      padding: 40px 60px;
      border-radius: 12px;
      background: #1a1a1a;
    }
    h1 { color: #ff4444; font-size: 2em; margin-bottom: 12px; }
    p  { color: #aaa; margin-top: 8px; }
    small { color: #555; }
  </style>
</head>
<body>
  <div class="box">
    <h1>🔒 脚本受到保护</h1>
    <p>此脚本已受到保护，无法通过浏览器直接访问。</p>
    <br>
    <small>Protected by MyGuard</small>
  </div>
  <script>
    document.addEventListener("contextmenu", e => { e.preventDefault(); alert("⚠️ 右键已禁用！"); });
    document.addEventListener("keydown", e => {
      if (e.key === "F12" || (e.ctrlKey && e.key === "u") || (e.ctrlKey && e.shiftKey && ["I","J","C"].includes(e.key))) {
        e.preventDefault();
        alert("⚠️ 此操作已被禁用！");
      }
    });
    alert("⚠️ 此脚本受到保护，请勿直接访问！");
  </script>
</body>
</html>
    `);
  }
}
