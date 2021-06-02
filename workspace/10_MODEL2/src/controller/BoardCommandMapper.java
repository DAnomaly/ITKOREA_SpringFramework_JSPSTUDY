package controller;

import command.board.BoardCommand;
import command.board.DeleteBoardCommand;
import command.board.DeleteFileBoardCommand;
import command.board.DeleteReplyBoardCommand;
import command.board.EditBoardCommand;
import command.board.EditBoardPageCommand;
import command.board.FindBoardCommand;
import command.board.InsertBoardCommand;
import command.board.InsertBoardPageCommand;
import command.board.InsertReplyBoardCommand;
import command.board.ListBoardPageCommand;
import command.board.ViewBoardPageCommand;

public class BoardCommandMapper {
	
	// single-ton
	private BoardCommandMapper() {
	}
	private static BoardCommandMapper instance = new BoardCommandMapper();
	public static BoardCommandMapper getInstatnce() {
		if(instance == null)
			instance = new BoardCommandMapper();
		return instance;
	}

	public BoardCommand getCommand(String cmd) {
		BoardCommand command = null;
		switch (cmd) {
		case "listBoardPage.b":
			command = new ListBoardPageCommand();
			break;
		case "insertBoardPage.b":
			command = new InsertBoardPageCommand(); 
			break;
		case "insertBoard.b":
			command = new InsertBoardCommand();
			break;
		case "viewBoardPage.b":
			command = new ViewBoardPageCommand();
			break;
		case "findBoard.b":
			command = new FindBoardCommand();
			break;
		case "deleteBoard.b":
			command = new DeleteBoardCommand();
			break;
		case "editBoardPage.b":
			command = new EditBoardPageCommand();
			break;
		case "editBoard.b":
			command = new EditBoardCommand();
			break;
		case "deleteFileBoard.b":
			command = new DeleteFileBoardCommand();
			break;
		case "insertReply.b":
			command = new InsertReplyBoardCommand();
			break;
		case "deleteReply.b":
			command = new DeleteReplyBoardCommand();
			break;
		}
		return command;
	}
	
}
