// 前端入口方法请放到 cloudapp.run() 的回调中
cloudapp.run((container) => {
  const start = async () => {
    // loading
    container.style.padding = '10px';
    container.innerHTML = '加载中';

    // call api
    const { ResponseBody, ResponseCode, ResponseMessage } = await cloudapp.callAPI('Hello');
    const h1 = document.createElement('h1');
    const pre = document.createElement('pre');
    
    // show message if success
    if (ResponseCode === 'Success') {
      const { message, env } = ResponseBody;
      h1.textContent = message;
      pre.textContent = JSON.stringify(env, null, 2);
    } else {
      h1.textContent = `加载失败 (CODE ${ResponseCode})`;
      pre.textContent = ResponseMessage;
      h1.style.color = pre.style.color = 'red';
    }

    // render to container
    container.innerHTML = '';
    container.appendChild(h1);
    container.appendChild(pre);
  };
  start();
  return () => {
    // 需要清理资源，可以在这里进行
  };
});