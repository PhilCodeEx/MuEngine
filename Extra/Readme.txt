eJSProxy is a console app that will handle MUE php API in behalf of joinserver
// parameters in shortcut link

eJSProxy.exe  8081 127.0.0.1 55970

8081 - listen port, you need to set this in your web for mue class config.
127.0.0.1 - joinserver IP
55970 - joinserver port

Advantages of using this:
1. Security of your eJS, using this you never have to expose its port externally.
2. Packet delay will be handled by this proxy, after receiving all data then locally it will pass it to eJS.
3. You can use MSSQL 64 bit by passing the login/password check/update to eJSProxy, this app will handle the MD5 encryption/decryption.