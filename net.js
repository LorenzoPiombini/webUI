
/* send data to the server */

export async function send(payload,method,resource){
	if(payload == null && method === "POST") return;
	let req = 0;
	if(method === "POST"){
		console.log(`POST REQUEST with body: ${payload}`)
		req = new Request(`http://artech:5043/${resource}`,{
			headers:{ 
				"Content-Type": "application/json",
			},
			method: method,
			body: payload
		});
	}

	if(method === "GET"){
		req = new Request(`http://artech:5043/${resource}`,{
			method: method,
		});
	}

	try{
		let response = await fetch(req);
		if(!response.ok){
			return {		
				message: "error",
				desc:"request failed, please contat your admin"
			};
		}

		let data = await response.json();
		if(Object.hasOwn(data,"message")){
			return {
				message: data.message
			};	
		}else{
			return {
				message: data
			};	

		}
	} catch(err){
		return {
			success: false,
			message: `error: ${err.message}`,
			data: null
		};
	}
}

export default send;
