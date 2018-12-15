package edu.iot.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.iot.common.exception.PasswordMissmatchException;
import edu.iot.common.model.Reply;
import edu.iot.common.service.ReplyService;

@RestController
@RequestMapping("/board/reply/{boardId}")
public class ReplyController {
	@Autowired
	ReplyService service;

	// �젙�긽 泥섎━ �쓳�떟
	public <T> ResponseEntity<T> getResult(T t) {
		final HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json;charset=UTF-8");
		return new ResponseEntity<T>(t, headers, HttpStatus.OK);
	}

	// �뿉�윭 泥섎━ �쓳�떟
	public <T> ResponseEntity<T> handleError(Exception e) {
		e.printStackTrace();
		final HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json;charset=UTF-8");
		return new ResponseEntity<T>(null, headers, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@ExceptionHandler(PasswordMissmatchException.class)
	public ResponseEntity<String> handlePasswordMissmatchException(PasswordMissmatchException e) {
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
	}
	
	/*@ExceptionHandler
	public ResponseEntity<String> handleException(Exception e) {
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Internal_server_error.");
		//.body(e.getMessage());
	}*/

	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> list(@PathVariable long boardId) throws Exception {
		
			List<Reply> list = service.getList(boardId);
			return getResult(list);
		
	}

	@RequestMapping(value = "/{replyId}", method = RequestMethod.GET)
	public ResponseEntity<Reply> replyId(@PathVariable long replyId) throws Exception {
		
			Reply reply = service.findById(replyId);
			return getResult(reply);
	
	}

	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Reply> create(@RequestBody Reply reply) throws Exception { // �뜲�씠�꽣媛� json�쑝濡� �쟾�넚�릺誘�濡� @RequestBody �궗�슜
		
			Reply r = service.create(reply);
			return getResult(r);
		
	}

	@RequestMapping(value = "/{replyId}", method = RequestMethod.PUT)
	public ResponseEntity<Reply> update(@RequestBody Reply reply) throws Exception { // �뜲�씠�꽣媛� json�쑝濡� �쟾�넚�릺誘�濡� @RequestBody �궗�슜
	
			System.out.println(reply);
			Reply r = service.update(reply);
			return getResult(r);
		} 
	

	@RequestMapping(value = "/{replyId}", method = RequestMethod.DELETE)
	public ResponseEntity<Reply> delete(Reply reply) throws Exception { 
		// password媛� 荑쇰━ �뙆�씪誘명꽣濡� �쟾�넚�맖 //@RequestBody �궗�슜�븯吏� �븡�쓬
		
			service.delete(reply);
			return getResult(reply);
	}
	

}
