package listener;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import dao.StudentDAO;
import dto.StudentDTO;

public class StudentJob implements Job {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		System.out.println("포상자명단 생성!");
		List<StudentDTO> list = StudentDAO.getInstance().highScoreStudent();
		
		try {
			FileWriter writer = new FileWriter(new File("C:\\포상자명단.txt"));
			for (int i = 0; i < list.size(); i++) {
				writer.write(i + 1 + "위: ");
				writer.write(list.get(i).toString());
				writer.append("\n");
			}
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	/*
	public static void main(String[] args) {
		List<StudentDTO> list = StudentDAO.getInstance().highScoreStudent();
		
		try {
			FileWriter writer = new FileWriter(new File("포상자명단.txt"));
			for (int i = 0; i < list.size(); i++) {
				writer.write(i + 1 + "위: ");
				writer.write(list.get(i).toString());
				writer.append("\n");
			}
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	*/
}
