<?php
class mue{

	var $host;
	var $port;
	var $protocol;
	var $err;
		
	function mue($host,$port,$protocol)
	{
		$this->host = $host;
		$this->port = $port;
		$this->protocol = $protocol;
	}


	function ascii2hex($ascii) 
	{
			$hex 	= '';
			for ($i = 0; $i < strlen($ascii); $i++) 
			{
				$byte 	= strtoupper(dechex(ord($ascii{$i})));
				$byte 	= str_repeat('0', 2 - strlen($byte)).$byte;
				$hex	.= $byte.' ';
			}
			$hex	= str_replace(' ', '', $hex);
			return $hex;
	}
		
	function hex2ascii($hex)
	{
			$ascii	= '';
			$hex	= str_replace(' ', '', $hex);
			for($i=0; $i<strlen($hex); $i=$i+2) 
			{
				$ascii .= chr(hexdec(substr($hex, $i, 2)));
			}
			return($ascii);
	}
	
	function data($char,$subject=NULL,$body=NULL) 
	{
		if($this->protocol == 'A5')
		{
			// char
			$difflen = 11 - strlen($char);
			$addnull = '';
			for($i=0; $i < $difflen; $i++)
			{
				$addnull .= "00";
			}
			$nchar = $this->ascii2hex($char).$addnull;
			// subject
			$difflen = 20 - strlen($subject);
			$addnull = '';
			for($i=0; $i < $difflen; $i++)
			{
				$addnull .= "00";
			}
			$nsubject = $this->ascii2hex($subject).$addnull;
			// body
			$difflen = 100 - strlen($body);
			$addnull = '';
			for($i=0; $i < $difflen; $i++)
			{
				$addnull .= "00";
			}
			$nbody = $this->ascii2hex($body).$addnull;
			
			$len 	= sprintf("%02X",133);
			$data 	= 'C1'.$len.$this->protocol.$nchar.$nsubject.$nbody;
			$outdata 	= $this->hex2ascii($data);
			// send
			return $this->datasend($outdata,true);
		}
		else if($this->protocol == 'A7' || $this->protocol == 'A8')
		{
			// user
			$difflen = 10 - strlen($char);
			$addnull = '';
			for($i=0; $i < $difflen; $i++)
			{
				$addnull .= "00";
			}
			$nchar = $this->ascii2hex($char).$addnull;
			// pass
			$difflen = 10 - strlen($subject);
			$addnull = '';
			for($i=0; $i < $difflen; $i++)
			{
				$addnull .= "00";
			}
			$nsubject = $this->ascii2hex($subject).$addnull;
			
			$len 	= sprintf("%02X",25);
			$data 	= 'C1'.$len.$this->protocol.$nchar.$nsubject."0000";
			$outdata 	= $this->hex2ascii($data);
			// send
			return $this->datasend($outdata,true);
		}
		else
			return $this->datasend($char,false);
	}	
		
	function datasend($msg='',$isascii=false) 
	{ 
 			if($isascii == false)
			{
				switch($this->protocol)
				{
				case 'A3':
				case 'A9':
					$difflen = 11-strlen($msg);
					break;
				case 'A1':
					$difflen = 59-strlen($msg);
					break;
				case 'A6':
					$difflen = 0;
					break;
				case 'AA':
					$difflen = 3;
					break;
				case 'AB':
				case 'AC':
				case 'AD':
					$difflen = 2;
					break;
				default:
					$difflen = 10-strlen($msg);
				}
				
				$addnull = '';
				for($i=0; $i < $difflen; $i++)
				{
					$addnull .= "00";
				}

				if($this->protocol == 'AB')
					$len 	= sprintf("%02X",6);
				else
					$len 	= sprintf("%02X",strlen($msg)+3+$difflen);

				if($this->protocol == 'AB')
				{
					$msgf = sprintf("%02X",$msg);
					$data 	= 'C1'.$len.$this->protocol.$msgf.$addnull;
				}
				else
				{
					$data 	= 'C1'.$len.$this->protocol.$this->ascii2hex($msg).$addnull;
				}


				$outdata 	= $this->hex2ascii($data);
			}
			else
				$outdata = $msg;

			//echo $data."<br>";

			$socket 	= socket_create(AF_INET, SOCK_STREAM, SOL_TCP); 
			
			socket_set_option($socket,SOL_SOCKET, SO_RCVTIMEO, array("sec"=>3, "usec"=>0)); // 3 seconds timeout
			   
			if (!socket_connect($socket, $this->host, $this->port))
			{
				$this->err = socket_strerror(socket_last_error($socket))."<br>"; 
				return false;
			}
			socket_write($socket, $outdata);

			$this->err = socket_strerror(socket_last_error($socket))."<br>"; 


			while ($result = socket_read($socket,2))
			{
				$binout .= bin2hex($result);
			}


			socket_close($socket);


			return hexdec($binout);
	}
}
?>