package controller;

import command.board.BoardCommand;
import command.board.InsertBoardCommand;
import command.board.InsertBoardPageCommand;
import command.board.ListBoardPageCommand;

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
		}
		return command;
	}
	
}
